//
//  FeedPageIconIamge.m
//  DefindMe
//
//  Created by Sumit Mahto on 23/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "FeedPageIconIamge.h"
#import "ModelUser.h"
@implementation FeedPageIconIamge
+(FeedPageIconIamge *)sharedInstance{
    static FeedPageIconIamge*loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[FeedPageIconIamge alloc] initWithService:LOG_IN];
    });
    return loginService;
}
-(void)feedPageIconImagewithCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://itunes.apple.com/lookup?id=294006335"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    NSData *RequestPostData = [NSData dataWithBytes:[postParams UTF8String] length:[postParams length]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:RequestPostData];
    NSOperationQueue *queue=[NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (connectionError) {
                handler(nil,YES,ConnectionErrorMsg);
                
            }else{
                if (data.length >0) {
                    NSError *error;
                    NSLog(@"Response String: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                    NSDictionary *jsonResponeDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                    handler(jsonResponeDict,NO,nil);
                }else{
                    handler(nil,YES,SomethingWrong);
                    
                    
                }
            }
        });
        
    }];

}
@end
