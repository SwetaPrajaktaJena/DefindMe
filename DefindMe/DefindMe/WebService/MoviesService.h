//
//  MoviesService.h
//  DefindMe
//
//  Created by Sumit Mahto on 29/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface MoviesService : WebServiceBaseClass
@property (nonatomic, strong)NSString * strSearch;
+(MoviesService*)sharedInstance;
-(void)moviesServicewithCompletionHandler:(CompletionHandler)handler;
@end
