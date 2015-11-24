//
//  PostFollowingService.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface PostFollowingService : WebServiceBaseClass
+(PostFollowingService *)sharedInstance;
-(void)addTofollowingPostswithMyId:(NSString *)myId withFriendsId:(NSString *)frndID withCompletionHandler:(CompletionHandler)handler;

@end
