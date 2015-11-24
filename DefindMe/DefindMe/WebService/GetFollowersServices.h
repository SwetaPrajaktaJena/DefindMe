//
//  GetFollowersServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 02/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetFollowersServices : WebServiceBaseClass
@property (nonatomic, strong)NSString * strmyId;
+(GetFollowersServices *)sharedInstance;
-(void)getfollowersPostswithCompletionHandler:(CompletionHandler)handler;

@end
