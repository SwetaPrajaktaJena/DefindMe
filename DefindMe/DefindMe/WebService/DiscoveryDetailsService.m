//
//  DiscoveryDetailsService.m
//  DefindMe
//
//  Created by Sumit Mahto on 29/05/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "DiscoveryDetailsService.h"
#import "LoginService.h"
@implementation DiscoveryDetailsService
+(DiscoveryDetailsService *)sharedInstance{
    static DiscoveryDetailsService *discoveryService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        discoveryService=[[DiscoveryDetailsService alloc] initWithService:LOG_IN];
            });
    return discoveryService;
}


-(void)allPostsDetailsServicewithCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString * url =[NSString stringWithFormat:@"%@%@%@%@",@"http://www.defindme.com/webservices/medias/getDiscovery/",[LoginService sharedInstance].uId,@"/7/1/",self.indexValue];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    //NSData *RequestPostData = [NSData dataWithBytes:[postParams UTF8String] length:[postParams length]];
    [request setHTTPMethod:@"GET"];
    //[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request setHTTPBody:RequestPostData];
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
               NSDictionary *jsonResponeDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                //  self.idArray=[jsonResponeDict objectForKey:@"Posts.Post.m_id"];
                handler(jsonResponeDict,NO,nil);
            }
            else{
                handler(nil,YES,SomethingWrong);
                
            }
        }
        
                    });
                    
     }] resume];

}

@end
