//
//  RePostService.h
//  DefindMe
//
//  Created by Sumit Mahto on 13/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface RePostService : WebServiceBaseClass
+(RePostService *)sharedInstance;
-(void)repostUserID:(NSString *)struID withPostID:(NSString *)strPostId withCompletionHandler:(CompletionHandler)handler;

@end
