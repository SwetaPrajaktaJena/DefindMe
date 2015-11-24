//
//  LikeAndDislikesService.m
//  DefindMe
//
//  Created by Sumit Mahto on 12/05/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "LikeAndDislikesService.h"
#import "ModelUser.h"
@implementation LikeAndDislikesService
+(LikeAndDislikesService*)sharedInstance{
    static LikeAndDislikesService *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[LikeAndDislikesService alloc] initWithService:LOG_IN];
    });
    return loginService;
    
}
-(void)callLoginServiceForUserId:(NSString *)strUserId andItemId:(NSString *)strItemId type:(NSString *)mediaType userItemId:(NSString *)userItemId likeDislikes:(NSString *)likeDislike withCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    [dik setObject:strUserId forKey:@"uid"];
    [dik setObject:strItemId forKey:@"iid"];
    [dik setObject:mediaType forKey:@"type"];
    [dik setObject:strItemId forKey:@"iuid"];
    [dik setObject:mediaType forKey:@"type"];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.defindme.com/webservices/posts/postLikeDislike/"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
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
                    if ([[jsonResponeDict objectForKey:@"status"] isEqualToString:@"success"]) {
                        NSDictionary *dicResponceData = [NSDictionary dictionaryWithDictionary:[jsonResponeDict objectForKey:@"data"]];
                        ModelUser *user = [[ModelUser alloc] initWithDictionary:dicResponceData];
                        handler(user,NO,[jsonResponeDict objectForKey:@"message"]);
                        
                    }
                    else{
                        handler(nil,YES,[jsonResponeDict objectForKey:@"message"]);
                    }
                }else{
                    handler(nil,YES,SomethingWrong);
                    
                    
                }
            }
        });
        
    }];
}
@end
