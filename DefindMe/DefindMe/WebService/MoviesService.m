//
//  MoviesService.m
//  DefindMe
//
//  Created by Sumit Mahto on 29/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "MoviesService.h"

@implementation MoviesService
@synthesize strSearch;
+(MoviesService *)sharedInstance{
    static MoviesService*moviesService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moviesService=[[MoviesService alloc] initWithService:LOG_IN];
    });
    return moviesService;
}
-(void)moviesServicewithCompletionHandler:(CompletionHandler)handler{
    
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString * url=[NSString stringWithFormat:@"%@%@%@",@"http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=93fvzwzmrhq56fbsjvax9242&q=",strSearch,@"+&page_limit=20"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:0.0];
    //NSData *RequestPostData = [NSData dataWithBytes:[postParams UTF8String] length:[postParams length]];
    [request setHTTPMethod:@"GET"];
   // [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
   // [request setHTTPBody:RequestPostData];
    NSOperationQueue *queue=[NSOperationQueue new];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (error) {
                        handler(nil,YES,ConnectionErrorMsg);
            
        }else{
            if (data.length >0) {
                
                NSError *error;
                NSLog(@"Response String: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                NSArray *jsonResponeDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                handler(jsonResponeDict,NO,nil);
            }else{
                handler(nil,YES,SomethingWrong);
                
            }
        }
                                   });
    }]resume];

}
@end
