//
//  LikesPostService.m
//  DefindMe
//
//  Created by Sumit Mahto on 09/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "LikesPostService.h"
#import "ModelUser.h"
@implementation LikesPostService
+(LikesPostService *)sharedInstance{
    static LikesPostService *bookService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bookService=[[LikesPostService alloc] initWithService:LOG_IN];
    });
    return bookService;
}
-(void)likesPostwithUserID:(NSString *)struID withItemID:(NSString *)strItemId withMediaType:(NSString *)strMediaType withItemUSerID:(NSString *)strItemUserId withLikesDisLikes:(NSString *)strLikesDisLikes withPostUrl:(NSString *)strURL withCompletionHandler:(CompletionHandler)handler{
    
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    [dik setObject:struID forKey:@"UserId"];
    [dik setObject:strItemId forKey:@"ItemId"];
    [dik setObject:strMediaType forKey:@"Type"];
    [dik setObject:strItemUserId forKey:@"ItemUserId"];
    [dik setObject:strLikesDisLikes forKey:@"LikeDislike"];
    [dik setObject:strURL forKey:@"poster_url"];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.defindme.com/webservices/posts/postLikeDislike"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
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
