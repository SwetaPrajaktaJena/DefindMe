//
//  UserRgistrationService.h
//  DefindMe
//
//  Created by Sumit Mahto on 23/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"
#import <UIKit/UIKit.h>

@interface UserRgistrationService : WebServiceBaseClass
@property (strong, nonatomic) NSMutableData *receivedData;
@property (strong, nonatomic)NSString *strImageData;
+(UserRgistrationService*)sharedInstance;
-(void)callForRegistrationEmailId:(NSString *)strEmail password:(NSString *)strPswd genderVal:(NSString *)strGender deviceToken:(NSString *)strDevicetoken UserName:(NSString *)strName UserImage:(UIImage *)imageName withLocation:(NSString *)strLocation withDob:(NSString *)strdob withCompletionHandler:(CompletionHandler)handler;
@end
