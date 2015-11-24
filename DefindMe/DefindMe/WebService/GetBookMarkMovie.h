//
//  GetBookMarkMovie.h
//  DefindMe
//
//  Created by Sumit Mahto on 19/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetBookMarkMovie : WebServiceBaseClass
+(GetBookMarkMovie *)sharedInstance;
@property (nonatomic, strong)NSString * strSearch;
-(void)bookmarkMovieServicewithCompletionHandler:(CompletionHandler)handler;

@end
