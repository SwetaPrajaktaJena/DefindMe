//
//  GetFollowingServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetFollowingServices : WebServiceBaseClass
@property (nonatomic, strong)NSString * strmyId;
@property (nonatomic, strong)NSString * strfrndId;
+(GetFollowingServices *)sharedInstance;
-(void)getfollowinPostswithCompletionHandler:(CompletionHandler)handler;

@end
