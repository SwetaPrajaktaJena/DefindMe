//
//  DiscoveryBooksServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 12/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DiscoveryBooksServices : WebServiceBaseClass
@property (nonatomic, strong)NSString * indexValue;
+(DiscoveryBooksServices *)sharedInstance;
-(void)bookPostsDetailsServicewithCompletionHandler:(CompletionHandler)handler;

@end
