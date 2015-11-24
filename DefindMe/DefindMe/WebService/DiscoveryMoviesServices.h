//
//  DiscoveryMoviesServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 12/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DiscoveryMoviesServices : WebServiceBaseClass
@property (nonatomic, strong)NSString * indexValue;
+(DiscoveryMoviesServices *)sharedInstance;
-(void)moviePostsDetailsServicewithCompletionHandler:(CompletionHandler)handler;
@end
