//
//  ProfileImageUploadWebservice.h
//  DefindMe
//
//  Created by Sumit Mahto on 17/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"
#import <UIKit/UIKit.h>
@interface ProfileImageUploadWebservice : WebServiceBaseClass
@property (nonatomic, strong)NSMutableArray * alubums;
+(ProfileImageUploadWebservice *)sharedInstance;

-(void)callLoginServiceForTags:(NSString *)strTags andUID:(NSString *)strUId content:(NSString *)strContent feed:(NSString *)strFeed privacy:(NSString *)strPrivacy albumID:(NSString *)stralbumId fullimage:(UIImage *)strfullimage file:(UIImage *)strFile withCompletionHandler:(CompletionHandler)handler;

@end
