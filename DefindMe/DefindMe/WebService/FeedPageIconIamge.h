//
//  FeedPageIconIamge.h
//  DefindMe
//
//  Created by Sumit Mahto on 23/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface FeedPageIconIamge : WebServiceBaseClass
+(FeedPageIconIamge*)sharedInstance;

-(void)feedPageIconImagewithCompletionHandler:(CompletionHandler)handler;

@end
