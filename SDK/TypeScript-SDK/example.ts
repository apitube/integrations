import { ApiTubeConfig } from './config';
import { ApiTubeClient } from './client';
import { ApiTubeNewsService } from './news_service';

async function main() {
    // Initialize configuration
    const config = new ApiTubeConfig({
        apiKey: 'YOUR_API_KEY',
    });

    // Create client and service
    const client = new ApiTubeClient(config);
    const newsService = new ApiTubeNewsService(client);

    try {
        // Fetch latest news
        console.log('Fetching latest news...');
        const latestNews = await newsService.getEverything({ per_page: 10 });
        console.log(`Found ${latestNews.total_results} articles`);
        latestNews.data.forEach((article) => {
            console.log(`- ${article.title}`);
        });

        // Fetch news by category
        console.log('\nFetching technology news...');
        const techNews = await newsService.getArticlesByCategory('technology', { per_page: 5 });
        techNews.data.forEach((article) => {
            console.log(`- ${article.title}`);
        });

        // Fetch news by language
        console.log('\nFetching English news...');
        const englishNews = await newsService.getArticlesByLanguage('en', { per_page: 5 });
        englishNews.data.forEach((article) => {
            console.log(`- ${article.title}`);
        });
    } catch (error) {
        console.error('Error fetching news:', error);
    }
}

main();
