//
//  PhotoLibraryServices.m
//  DefindMe
//
//  Created by Sumit Mahto on 20/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "PhotoLibraryServices.h"
#import "LoginService.h"
@implementation PhotoLibraryServices
@synthesize alubumId;
@synthesize totalImages;
@synthesize userID;
+(PhotoLibraryServices*)sharedInstance{
    static PhotoLibraryServices *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[PhotoLibraryServices alloc] initWithService:LOG_IN];
    });
    return loginService;
}
-(void)GetUserAlbumServiceidwithCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    NSLog(@"Login Req:%@",dik);
   // NSError *error = nil;
    //NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    //NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString * url=[NSString stringWithFormat:@"%@%@%@%@%@%@%@",@"http://www.defindme.com/webservices/medias/getAlbumImages/",alubumId,@"/",self.userID,@"/1/",totalImages,@"/"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:0.0];
    //NSData *RequestPostData = [NSData dataWithBytes:[postParams UTF8String] length:[postParams length]];
    [request setHTTPMethod:@"GET"];
    // [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // [request setHTTPBody:RequestPostData];
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
                handler(jsonResponeDict,NO,nil);
            }else{
                handler(nil,YES,SomethingWrong);
                
            }
        }
                    });
    }]resume];
 
}
@end