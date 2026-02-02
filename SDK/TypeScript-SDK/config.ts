export interface ApiTubeConfigOptions {
    apiKey: string;
    baseUrl?: string;
    timeout?: number;
}

export class ApiTubeConfig {
    private apiKey: string;
    private baseUrl: string;
    private timeout: number;

    constructor(options: ApiTubeConfigOptions) {
        this.apiKey = options.apiKey;
        this.baseUrl = options.baseUrl || 'https://api.apitube.io/v1/news';
        this.timeout = options.timeout || 30000;
    }

    getApiKey(): string {
        return this.apiKey;
    }

    getBaseUrl(): string {
        return this.baseUrl;
    }

    getTimeout(): number {
        return this.timeout;
    }
}
