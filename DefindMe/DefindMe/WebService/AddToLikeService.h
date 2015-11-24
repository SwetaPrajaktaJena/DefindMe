//
//  AddToLikeService.h
//  DefindMe
//
//  Created by Sumit Mahto on 30/06/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface AddToLikeService : WebServiceBaseClass
+(AddToLikeService *)sharedInstance;
-(void)addToLikePostswithMedia_Type:(NSString *)mediaType withMediaId:(NSString *)mediaID withUserId:(NSString *)user_id withRatings:(NSString *)ratings withPUID:(NSString *)Puid withCompletionHandler:(CompletionHandler)handler;

@end
