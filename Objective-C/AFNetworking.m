#import <AFNetworking/AFNetworking.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString *url = @"https://api.apitube.io/v1/news/everything";
        NSDictionary *parameters = @{@"limit": @"50", @"api_key": @"YOUR_API_KEY"};

        [manager GET:url parameters:parameters headers:nil progress:nil
            success:^(NSURLSessionTask *task, id responseObject) {
                NSLog(@"%@", responseObject);
            }
            failure:^(NSURLSessionTask *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];

        [[NSRunLoop currentRunLoop] run]; // Keep the command line tool alive
    }
    return 0;
}
