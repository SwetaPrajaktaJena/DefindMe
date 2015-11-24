//
//  LikesPostService.h
//  DefindMe
//
//  Created by Sumit Mahto on 09/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface LikesPostService : WebServiceBaseClass
+(LikesPostService *)sharedInstance;
-(void)likesPostwithUserID:(NSString *)struID withItemID:(NSString *)strItemId withMediaType:(NSString *)strMediaType withItemUSerID:(NSString *)strItemUserId withLikesDisLikes:(NSString *)strLikesDisLikes withPostUrl:(NSString *)strURL withCompletionHandler:(CompletionHandler)handler;

@end
