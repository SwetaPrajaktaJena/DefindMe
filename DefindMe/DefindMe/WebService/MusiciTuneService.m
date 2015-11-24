//
//  MusiciTuneService.m
//  DefindMe
//
//  Created by Sumit Mahto on 21/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "MusiciTuneService.h"

@implementation MusiciTuneService
@synthesize strSearch;
+(MusiciTuneService*)sharedInstance{
    
    static MusiciTuneService *musicService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       musicService=[[MusiciTuneService alloc] initWithService:LOG_IN];
    });
    return musicService;
    
}
-(void)musicServicewithCompletionHandler:(CompletionHandler)handler{
     //NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString * url=[NSString stringWithFormat:@"%@%@",@"http://itunes.apple.com/search?media=music&limit=20&term=",strSearch];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:0.0];
    //NSData *RequestPostData = [NSData dataWithBytes:[postParams UTF8String] length:[postParams length]];
    [request setHTTPMethod:@"GET"];
    //[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request setHTTPBody:RequestPostData];
    NSOperationQueue *queue=[NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
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
    }];

}
@end
