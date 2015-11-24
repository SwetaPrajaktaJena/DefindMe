//
//  CheckEmailIDService.m
//  DefindMe
//
//  Created by Sumit Mahto on 27/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "CheckEmailIDService.h"
#import "LoginService.h"
@implementation CheckEmailIDService
+(CheckEmailIDService *)sharedInstance{
    static CheckEmailIDService *discoveryService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        discoveryService=[[CheckEmailIDService alloc] initWithService:LOG_IN];
    });
    return discoveryService;
}

-(void)callCheckForEmail:(NSString *)strEmail withCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    [dik setValue:strEmail forKey:@"Email"];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.defindme.com/webservices/users/checkEmail"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    NSData *RequestPostData = [NSData dataWithBytes:[postParams UTF8String] length:[postParams length]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:RequestPostData];
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
