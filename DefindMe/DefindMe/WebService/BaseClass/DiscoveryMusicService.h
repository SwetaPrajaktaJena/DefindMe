//
//  DiscoveryMusicService.h
//  DefindMe
//
//  Created by Sumit Mahto on 12/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DiscoveryMusicService : WebServiceBaseClass
@property (nonatomic, strong)NSString * indexValue;
+(DiscoveryMusicService *)sharedInstance;
-(void)musicPostsDetailsServicewithCompletionHandler:(CompletionHandler)handler;
@end
