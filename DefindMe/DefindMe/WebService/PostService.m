      //
//  PostService.m
//  DefindMe
//
//  Created by Sumit Mahto on 21/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "PostService.h"
#import "LoginService.h"
@implementation PostService
+(PostService *)sharedInstance{
    static PostService *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[PostService alloc] initWithService:LOG_IN];
    });
    return loginService;
    
 
}
-(void)callForPostwithCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",[LoginService sharedInstance].uId);
    NSString * url;
    if ([self.strChangeStatus isEqualToString:@"feed"]) {
        url=[NSString stringWithFormat:@"%@%@%@%@",@"http://www.defindme.com/webservices/posts/getStreamIphone/",[LoginService sharedInstance].uId,@"/1/",self.indexValue];
    }
    if ([self.strChangeStatus isEqualToString:@"change"]) {
     url=[NSString stringWithFormat:@"%@%@%@%@",@"http://www.defindme.com/webservices/posts/getStreamIphone/",[PostService sharedInstance].userID,@"/1/",self.indexValue];
    }
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
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
     
   // }];
  }] resume];
}

@end
