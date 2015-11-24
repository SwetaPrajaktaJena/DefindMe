//
//  DiscoveryDetailsService.h
//  DefindMe
//
//  Created by Sumit Mahto on 29/05/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DiscoveryDetailsService : WebServiceBaseClass
+(DiscoveryDetailsService *)sharedInstance;
@property (nonatomic, strong)NSString * strSearch;
@property (nonatomic, strong)NSString * indexValue;
//-(void)musicPostsDetailsServicewithCompletionHandler:(CompletionHandler)handler;
-(void)allPostsDetailsServicewithCompletionHandler:(CompletionHandler)handler;
@end
