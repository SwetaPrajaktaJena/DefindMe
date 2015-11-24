//
//  ProfileImageUploadWebservice.m
//  DefindMe
//
//  Created by Sumit Mahto on 17/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "ProfileImageUploadWebservice.h"
#import "ModelUser.h"
#import "LoginService.h"
#import "NSData+Base64.h"
@implementation ProfileImageUploadWebservice
@synthesize alubums;
+(ProfileImageUploadWebservice *)sharedInstance{
    static ProfileImageUploadWebservice *loginService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginService=[[ProfileImageUploadWebservice alloc] initWithService:LOG_IN];
    });
    return loginService;
}
-(void)callLoginServiceForTags:(NSString *)strTags andUID:(NSString *)strUId content:(NSString *)strContent feed:(NSString *)strFeed privacy:(NSString *)strPrivacy albumID:(NSString *)stralbumId fullimage:(UIImage *)strfullimage file:(UIImage *)strFile withCompletionHandler:(CompletionHandler)handler{
  
    //
   /* NSString *urlString = @"http://dev.digiinteracts.com/defindme/website/webservices/images/postNewImage/4946";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSMutableData *body = [NSMutableData data];
    
    
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    // file 1
    NSData *imageDataF= UIImageJPEGRepresentation(strFile, 90);
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Disposition: attachment; name=\"userfile\"; filename=\".jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageDataF]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    //file 2
    NSData *imageDataS= UIImageJPEGRepresentation(strfullimage, 90);
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Disposition: attachment; name=\"userfile\"; filename=\".jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageDataS]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Text parameter1
    NSString *param1 =strTags;
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"parameter1\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:param1] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Another text parameter
    NSString *param2 = strUId;
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"parameter2\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:param2] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    // Another text parameter
    NSString *param3 = strContent;
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"parameter2\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:param2] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Another text parameter
    NSString *param4 = strFeed;
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"parameter2\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:param2] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Another text parameter
    NSString *param5 = strPrivacy;
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"parameter2\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:param2] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Another text parameter
    NSString *param6 = stralbumId;
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"parameter2\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:param2] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Another text parameter
    
    // close form
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // set request body
    [request setHTTPBody:body];
    
    //return and test
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", returnString);
*/
 /*   //ImageFileUpload
    //NSString *str=[NSString stringWithFormat:@"http://dev.digiinteracts.com/defindme/website/webservices/images/postNewImage/4946"];
    NSString *urlString =[NSString stringWithFormat:@"http://dev.digiinteracts.com/defindme/website/webservices/images/postNewImage/4946"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSMutableData *body = [NSMutableData data];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"a.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imgData]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    //  parameter username
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"username\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[userName.text dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //  parameter token
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"email\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[eMail.text dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    // parameter method
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"pass\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[passWord.text dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //parameter method
    NSLog(@"%@",countryCode);
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"country\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[countryCode dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // close form
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    // NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
    NSlog(@"%@",dict);
    //*/
  /*  NSData *imageData = UIImagePNGRepresentation(strfullimage);
    
    NSString * strImageData = [imageData base64EncodedString];
    
    NSData *imageDatafile = UIImagePNGRepresentation(strFile);
    
    NSString * strImageDatafile = [imageDatafile base64EncodedString];
    
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
    
    [dik setObject:strTags forKey:@"tags"];
    
    [dik setObject:strUId forKey:@"uid"];
    
    [dik setObject:strContent forKey:@"content"];
    
    [dik setObject:strFeed forKey:@"feed"];
    
    [dik setObject:strPrivacy forKey:@"privacy"];
    
    [dik setObject:stralbumId forKey:@"album_id"];
    
    [dik setObject:strImageDatafile forKey:@"file"];
    
    NSLog(@"Login Req:%@",dik);
    
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    
    NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://dev.digiinteracts.com/defindme/website/webservices/images/postNewImage/4946"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    
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
}*/
//Image With File
//NSString *str=[NSString stringWithFormat:@"%@registration.php",appdel.baseUrl];
NSString *urlString = [NSString stringWithFormat:@"%@",@"http://www.defindme.com/webservices/images/postNewImage/4946"];
 NSData *imageDataF = UIImageJPEGRepresentation(strFile,100);
    NSData *imageDataS=UIImageJPEGRepresentation(strfullimage,100);
NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
[request setURL:[NSURL URLWithString:urlString]];
[request setHTTPMethod:@"POST"];
NSMutableData *body = [NSMutableData data];
NSString *boundary = @"---------------------------14737809831466499882746641449";
NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
[request addValue:contentType forHTTPHeaderField: @"Content-Type"];

[body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"a.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[NSData dataWithData:imageDataF]];
[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

[body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"Content-Disposition: form-data; name=\"full_image\"; filename=\"a.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[NSData dataWithData:imageDataS]];
[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

//  parameter username

[body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"tags\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];

[body appendData:[strTags dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];


//  parameter token
[body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"uid\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];

[body appendData:[strUId dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];


// parameter method
[body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"content\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];

[body appendData:[strContent dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];


//parameter method

[body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"feed\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];

[body appendData:[strFeed dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
[body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"privacy\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
[body appendData:[strPrivacy dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
 
[body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"album_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
[body appendData:[stralbumId dataUsingEncoding:NSUTF8StringEncoding]];
[body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];


// close form
[body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];


// setting the body of the post to the reqeust
[request setHTTPBody:body];


NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
   
 NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",returnString
          );

    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableLeaves error:nil];
NSLog(@"%@",dict);
//
}
@end
