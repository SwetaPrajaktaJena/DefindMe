//
//  YouMightLikeBookService.h
//  DefindMe
//
//  Created by Sumit Mahto on 21/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface YouMightLikeBookService : WebServiceBaseClass
+(YouMightLikeBookService *)sharedInstance;
-(void)getMightLikePostswithCompletionHandler:(CompletionHandler)handler;

@end
