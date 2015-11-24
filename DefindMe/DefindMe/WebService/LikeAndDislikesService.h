//
//  LikeAndDislikesService.h
//  DefindMe
//
//  Created by Sumit Mahto on 12/05/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface LikeAndDislikesService : WebServiceBaseClass
+(LikeAndDislikesService*)sharedInstance;

-(void)callLoginServiceForUserId:(NSString *)strUserId andItemId:(NSString *)strItemId type:(NSString *)mediaType userItemId:(NSString *)userItemId likeDislikes:(NSString *)likeDislike withCompletionHandler:(CompletionHandler)handler;

@end
