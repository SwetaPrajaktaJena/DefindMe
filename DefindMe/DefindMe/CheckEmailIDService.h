//
//  CheckEmailIDService.h
//  DefindMe
//
//  Created by Sumit Mahto on 27/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface CheckEmailIDService : WebServiceBaseClass
+(CheckEmailIDService*)sharedInstance;

-(void)callCheckForEmail:(NSString *)strEmail withCompletionHandler:(CompletionHandler)handler;


@end
