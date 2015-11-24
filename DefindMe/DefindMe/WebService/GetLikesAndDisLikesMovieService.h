//
//  GetLikesAndDisLikesMovieService.h
//  DefindMe
//
//  Created by Sumit Mahto on 31/06/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetLikesAndDisLikesMovieService : WebServiceBaseClass
@property (nonatomic, strong)NSString * moviesLike;
@property (nonatomic, strong)NSString * strSearch;
+(GetLikesAndDisLikesMovieService *)sharedInstance;
-(void)getLikePostswithCompletionHandler:(CompletionHandler)handler;

@end
