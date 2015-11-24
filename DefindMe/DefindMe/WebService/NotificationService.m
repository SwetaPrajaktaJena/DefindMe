//
//  NotificationService.m
//  DefindMe
//
//  Created by Sumit Mahto on 20/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "NotificationService.h"
#import "LoginService.h"
@implementation NotificationService
+(NotificationService*)sharedInstance{
    
    static NotificationService *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[NotificationService alloc] initWithService:NOTIFICATION_DATA];
    });
    return loginService;
    
}
-(void)callNotificationServiceForUSerName:(NSString *)name andComments:(NSString *)comments timePassed:(NSString *)time withCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
       NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
     NSString * url=[NSString stringWithFormat:@"%@%@",@"http://defindme.com/webservices/medias/getUserNotification/",[LoginService sharedInstance].uId];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSData *RequestPostData = [NSData dataWithBytes:[postParams UTF8String] length:[postParams length]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:RequestPostData];
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
