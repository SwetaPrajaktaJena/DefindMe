//
//  DeletePostServices.m
//  DefindMe
//
//  Created by Sumit Mahto on 13/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "DeletePostServices.h"
#import "ModelUser.h"
@implementation DeletePostServices
+(DeletePostServices *)sharedInstance{
    static DeletePostServices *bookService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bookService=[[DeletePostServices alloc] initWithService:LOG_IN];
    });
    return bookService;
}
-(void)deletePostUserID:(NSString *)strPostId withCompletionHandler:(CompletionHandler)handler{
    
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    
    [dik setObject:strPostId forKey:@"post_id"];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.defindme.com/webservices/posts/deletePost"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
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
                    NSLog(@"DeletePost: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
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
        
    }]resume];
}
@end
