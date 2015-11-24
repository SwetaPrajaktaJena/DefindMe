//
//  GetLikesAndDisLikesBooksService.m
//  DefindMe
//
//  Created by Sumit Mahto on 31/06/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "GetLikesAndDisLikesBooksService.h"
#import "LoginService.h"
@implementation GetLikesAndDisLikesBooksService
@synthesize strSearch;
+(GetLikesAndDisLikesBooksService *)sharedInstance{
    static GetLikesAndDisLikesBooksService *bookService=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bookService=[[GetLikesAndDisLikesBooksService alloc] initWithService:LOG_IN];
    });
    return bookService;
}

-(void)getLikePostswithCompletionHandler:(CompletionHandler)handler{
    NSMutableDictionary *dik = [[NSMutableDictionary alloc]init];
        
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dik options:0 error:&error];
    //NSString *postParams = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString * url=[NSString stringWithFormat:@"%@%@%@%@",@"http://www.defindme.com/webservices/medias/getLikesIphone/",self.booksLike,@"/3/1/10/",strSearch];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:0.0];
    //NSData *RequestPostData = [NSData dataWithBytes:[postParams UTF8String] length:[postParams length]];
    [request setHTTPMethod:@"GET"];
    //[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[request setHTTPBody:RequestPostData];
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
                handler(jsonResponeDict,NO,nil);
            }else{
                handler(nil,YES,SomethingWrong);
                
            }
        }
                    });
    }]resume];
    
}

@end
