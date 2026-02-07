import { ApiTubeClient } from './client';

export interface Article {
    id: string;
    title: string;
    description: string;
    url: string;
    source: {
        name: string;
        url: string;
    };
    published_at: string;
    language: string;
    categories: string[];
}

export interface NewsResponse {
    status: string;
    total_results: number;
    data: Article[];
}

export interface NewsQueryParams {
    per_page?: number;
    offset?: number;
    language?: string;
    categories?: string;
    published_at?: string;
    sort_by?: 'published_at' | 'relevance';
    sort_order?: 'asc' | 'desc';
}

export class ApiTubeNewsService {
    private client: ApiTubeClient;

    constructor(client: ApiTubeClient) {
        this.client = client;
    }

    async getEverything(params: NewsQueryParams = {}): Promise<NewsResponse> {
        return this.client.request<NewsResponse>('/everything', { params });
    }

    async getTopHeadlines(params: NewsQueryParams = {}): Promise<NewsResponse> {
        return this.client.request<NewsResponse>('/top-headlines', { params });
    }

    async getArticlesByCategory(category: string, params: NewsQueryParams = {}): Promise<NewsResponse> {
        return this.client.request<NewsResponse>('/everything', {
            params: { ...params, categories: category },
        });
    }

    async getArticlesByLanguage(language: string, params: NewsQueryParams = {}): Promise<NewsResponse> {
        return this.client.request<NewsResponse>('/everything', {
            params: { ...params, language },
        });
    }
}
