//
//  LogoutWebServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 18/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface LogoutWebServices : WebServiceBaseClass
+(LogoutWebServices*)sharedInstance;
-(void)LogOutId:(NSString *)strUserId withCompletionHandler:(CompletionHandler)handler;

@end
