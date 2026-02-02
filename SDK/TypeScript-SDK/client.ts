import { ApiTubeConfig } from './config';

export interface RequestOptions {
    params?: Record<string, string | number | boolean>;
    headers?: Record<string, string>;
}

export class ApiTubeClient {
    private config: ApiTubeConfig;

    constructor(config: ApiTubeConfig) {
        this.config = config;
    }

    async request<T>(endpoint: string, options: RequestOptions = {}): Promise<T> {
        const url = new URL(`${this.config.getBaseUrl()}${endpoint}`);

        if (options.params) {
            Object.entries(options.params).forEach(([key, value]) => {
                url.searchParams.append(key, String(value));
            });
        }

        const headers: Record<string, string> = {
            'X-Api-Key': this.config.getApiKey(),
            'Content-Type': 'application/json',
            ...options.headers,
        };

        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), this.config.getTimeout());

        try {
            const response = await fetch(url.toString(), {
                method: 'GET',
                headers,
                signal: controller.signal,
            });

            clearTimeout(timeoutId);

            if (!response.ok) {
                throw new Error(`HTTP Request Error: ${response.status}`);
            }

            return response.json() as Promise<T>;
        } catch (error) {
            clearTimeout(timeoutId);
            throw error;
        }
    }
}
