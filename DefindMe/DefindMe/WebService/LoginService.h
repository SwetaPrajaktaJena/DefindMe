//
//  LoginService.h
//  DefindMe
//
//  Created by Sumit Mahto on 14/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface LoginService : WebServiceBaseClass
@property(nonatomic, strong)NSString * uId;
@property(nonatomic, strong)NSString * strImage;
@property(nonatomic, strong)NSString * strName;
+(LoginService*)sharedInstance;

-(void)callLoginServiceForEmail:(NSString *)strEmail andPassword:(NSString *)strPassword deviceToken:(NSString *)devicetoken deviceType:(NSString *)deviceType withCompletionHandler:(CompletionHandler)handler;


@end
