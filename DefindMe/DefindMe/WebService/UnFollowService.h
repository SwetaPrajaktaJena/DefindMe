//
//  UnFollowService.h
//  DefindMe
//
//  Created by Sumit Mahto on 02/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface UnFollowService : WebServiceBaseClass
+(UnFollowService *)sharedInstance;
-(void)unfollowUSerId:(NSString *)userID withLoginUSerId:(NSString *)LoginID withCompletionHandler:(CompletionHandler)handler;

@end
