//
//  GetEnjoysPostsService.h
//  DefindMe
//
//  Created by Sumit Mahto on 09/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetEnjoysPostsService : WebServiceBaseClass
+(GetEnjoysPostsService *)sharedInstance;
-(void)getenjoyswith:(NSString *)strpostID withUseID:(NSString *)strUID withPageNo:(NSString *)strpageNo withCompletionHandler:(CompletionHandler)handler;

@end
