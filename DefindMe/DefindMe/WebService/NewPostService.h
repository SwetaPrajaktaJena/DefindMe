//
//  NewPostService.h
//  DefindMe
//
//  Created by Sumit Mahto on 13/05/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface NewPostService : WebServiceBaseClass
+(NewPostService*)sharedInstance;

-(void)callLoginServiceForTags:(NSString *)strTags andUID:(NSString *)strUId content:(NSString *)strContent feed:(NSString *)strFeed privacy:(NSString *)strPrivacy recommendID:(NSString *)strRecommendId parentId:(NSString *)strParentId withCompletionHandler:(CompletionHandler)handler;

@end
