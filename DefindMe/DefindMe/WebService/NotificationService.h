//
//  NotificationService.h
//  DefindMe
//
//  Created by Sumit Mahto on 20/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface NotificationService : WebServiceBaseClass

+(NotificationService*)sharedInstance;
-(void)callNotificationServiceForUSerName:(NSString *)name andComments:(NSString *)comments timePassed:(NSString *)time withCompletionHandler:(CompletionHandler)handler;
@end
