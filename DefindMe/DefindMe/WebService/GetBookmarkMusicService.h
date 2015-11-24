//
//  GetBookmarkMusicService.h
//  DefindMe
//
//  Created by Sumit Mahto on 19/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetBookmarkMusicService : WebServiceBaseClass
+(GetBookmarkMusicService *)sharedInstance;
@property (nonatomic, strong)NSString * strSearch;
-(void)bookmarkMusicServicewithCompletionHandler:(CompletionHandler)handler;

@end
