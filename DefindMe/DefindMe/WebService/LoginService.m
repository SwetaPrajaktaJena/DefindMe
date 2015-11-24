//
//  LoginService.m
//  DefindMe
//
//  Created by Sumit Mahto on 14/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "LoginService.h"
#import "ModelUser.h"
@implementation LoginService
@synthesize uId;
@synthesize strImage;
@synthesize strName;
+(LoginService*)sharedInstance{
    static LoginService *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[LoginService alloc] initWithService:LOG_IN];
    });
    return loginService;
    
}
-(void)callLoginServiceForEmail:(NSString *)strEmail andPassword:(NSString *)strPassword deviceToken:(NSString *)devicetoken deviceType:(NSString *)deviceType withCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    [dik setObject:strEmail forKey:@"Email"];
    [dik setObject:strPassword forKey:@"Pass"];
    [dik setObject:devicetoken forKey:@"DeviceToken"];
    [dik setObject:deviceType  forKey:@"DeviceType"];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.defindme.com/webservices/users/login"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
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
                                if ([[jsonResponeDict objectForKey:@"status"] isEqualToString:@"success"]) {
                                    NSDictionary *dicResponceData = [NSDictionary dictionaryWithDictionary:[jsonResponeDict objectForKey:@"data"]];
                                    self.uId=[dicResponceData objectForKey:@"user_id"];
                                    self.strName=[dicResponceData objectForKey:@"name"];
                                    self.strImage=[dicResponceData objectForKey:@"avatar"];
                                    NSLog(@"%@",self.uId);
                                     NSLog(@"%@",self.strName);
                                     NSLog(@"%@",self.strImage);
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
                    
                    // do stuff
                    
                }] resume];
   /* [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
    }];*/
}
@end
