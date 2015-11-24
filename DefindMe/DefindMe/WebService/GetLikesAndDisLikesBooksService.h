//
//  GetLikesAndDisLikesBooksService.h
//  DefindMe
//
//  Created by Sumit Mahto on 31/06/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetLikesAndDisLikesBooksService : WebServiceBaseClass
@property (nonatomic, strong)NSString * booksLike;
@property (nonatomic, strong)NSString * strSearch;
+(GetLikesAndDisLikesBooksService *)sharedInstance;
-(void)getLikePostswithCompletionHandler:(CompletionHandler)handler;

@end
