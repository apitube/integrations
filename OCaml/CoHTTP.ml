#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *urlString = @"https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY";
        NSURL *url = [NSURL URLWithString:urlString];

        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"%@", result);
            }
        }];
        [task resume];
        [[NSRunLoop currentRunLoop] run]; // Keep the command line tool alive until the request finishes.
    }
    return 0;
}
