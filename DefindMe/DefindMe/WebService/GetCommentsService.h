//
//  GetCommentsService.h
//  DefindMe
//
//  Created by Sumit Mahto on 09/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetCommentsService : WebServiceBaseClass
+(GetCommentsService *)sharedInstance;
-(void)getcommentswith:(NSString *)strpostID withUseID:(NSString *)strUID withPageNo:(NSString *)strpageNo withCompletionHandler:(CompletionHandler)handler;

@end
