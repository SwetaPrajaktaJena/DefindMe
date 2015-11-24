//
//  UserRgistrationService.m
//  DefindMe
//
//  Created by Sumit Mahto on 23/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "UserRgistrationService.h"
#import "ModelUser.h"
#import <UIKit/UIKit.h>
#import "NSData+Base64.h"
@implementation UserRgistrationService
@synthesize strImageData;
+(UserRgistrationService*)sharedInstance{
    static UserRgistrationService *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[UserRgistrationService alloc] initWithService:LOG_IN];
    });
    return loginService;
}
-(void)callForRegistrationEmailId:(NSString *)strEmail password:(NSString *)strPswd genderVal:(NSString *)strGender deviceToken:(NSString *)strDevicetoken UserName:(NSString *)strName UserImage:(UIImage *)imageName withLocation:(NSString *)strLocation withDob:(NSString *)strdob withCompletionHandler:(CompletionHandler)handler{
     NSData *imageData = UIImagePNGRepresentation(imageName);
   strImageData = [imageData base64EncodedString];
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    [dik setObject:strName forKey:@"Name"];
    [dik setObject:strGender forKey:@"Sex"];
    [dik setObject:strEmail forKey:@"Email"];
    [dik setObject:strPswd forKey:@"Pass"];
    [dik setObject:strDevicetoken forKey:@"DeviceToken"];
    [dik setObject:strImageData forKey:@"image"];
    [dik setObject:strLocation forKey:@"location"];
    [dik setObject:strdob forKey:@"dob"];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.defindme.com/webservices/users/registration"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
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
