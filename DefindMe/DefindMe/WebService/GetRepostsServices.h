//
//  GetRepostsServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 13/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetRepostsServices : WebServiceBaseClass
+(GetRepostsServices *)sharedInstance;
-(void)getRepostsswith:(NSString *)strpostID withPageNo:(NSString *)strpageNo withCompletionHandler:(CompletionHandler)handler;


@end
