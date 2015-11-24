//
//  GetLikesAndDisLikesMusicService.h
//  DefindMe
//
//  Created by Sumit Mahto on 31/06/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetLikesAndDisLikesMusicService : WebServiceBaseClass
@property (nonatomic, strong)NSString * musiclike;
@property (nonatomic, strong)NSString * strSearch;
+(GetLikesAndDisLikesMusicService *)sharedInstance;
-(void)getLikePostswithCompletionHandler:(CompletionHandler)handler;


@end
