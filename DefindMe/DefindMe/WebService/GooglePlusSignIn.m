//
//  GooglePlusSignIn.m
//  DefindMe
//
//  Created by Sumit Mahto on 27/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "GooglePlusSignIn.h"
#import "ModelUser.h"
#import "NSData+Base64.h"
@implementation GooglePlusSignIn
@synthesize strImageData;
+(GooglePlusSignIn*)sharedInstance{
    static GooglePlusSignIn *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[GooglePlusSignIn alloc] initWithService:LOG_IN];
    });
    return loginService;
    
}
-(void)callGooglePlusSignInServiceForEmail:(NSString *)strEmail UserID:(NSString *)strUID deviceToken:(NSString *)devicetoken name:(NSString *)strName location:(NSString *)strLocation dob:(NSString *)strDOB gender:(NSString *)strGender profileImage:(UIImage *)imageName withCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    NSData *imageData = UIImagePNGRepresentation(imageName);
    strImageData = [imageData base64EncodedString];
    
    [dik setObject:strEmail forKey:@"Email"];
    [dik setObject:strUID forKey:@"FbId"];
    [dik setObject:devicetoken forKey:@"DeviceToken"];
    [dik setObject:strName forKey:@"Name"];
    [dik setObject:strLocation forKey:@"Location"];
    [dik setObject:strDOB forKey:@"DOB"];
    [dik setObject:strGender forKey:@"Sex"];
    [dik setObject:strImageData forKey:@"image"];
    NSLog(@"Login Req:%@",dik);
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.defindme.com/webservices/users/registration"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
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
