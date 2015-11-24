      //
//  NewPostService.m
//  DefindMe
//
//  Created by Sumit Mahto on 13/05/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "NewPostService.h"
#import "ModelUser.h"
@implementation NewPostService
+(NewPostService*)sharedInstance{
    static NewPostService *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[NewPostService alloc] initWithService:LOG_IN];
    });
    return loginService;
}
-(void)callLoginServiceForTags:(NSString *)strTags andUID:(NSString *)strUId content:(NSString *)strContent feed:(NSString *)strFeed privacy:(NSString *)strPrivacy recommendID:(NSString *)strRecommendId parentId:(NSString *)strParentId withCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    [dik setObject:strTags forKey:@"tags"];
    [dik setObject:strUId forKey:@"uid"];
    [dik setObject:strContent forKey:@"content"];
    [dik setObject:strFeed forKey:@"feed"];
    [dik setObject:strPrivacy forKey:@"privacy"];
    [dik setObject:strRecommendId forKey:@"recommend_id"];
    [dik setObject:strParentId forKey:@"parent_id"];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.defindme.com/webservices/posts/newPost"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
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
                    NSLog(@"NewPost: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                    NSDictionary *jsonResponeDict=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                    if ([[jsonResponeDict objectForKey:@"status"] isEqualToString:@"Success"]) {
                        NSDictionary *dicResponceData = [NSDictionary dictionaryWithDictionary:[jsonResponeDict objectForKey:@"data"]];
                        ModelUser *user = [[ModelUser alloc] initWithDictionary:dicResponceData];
                        handler(user,NO,[jsonResponeDict objectForKey:@"status"]);
                        
                    }
                    else{
                        handler(nil,YES,[jsonResponeDict objectForKey:@"status"]);
                    }
                }else{
                    handler(nil,YES,SomethingWrong);
                    
                    
                }
            }
        });
        
    }];

}
@end
