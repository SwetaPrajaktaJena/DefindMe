//
//  BooksiTuneService.h
//  DefindMe
//
//  Created by Sumit Mahto on 22/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface BooksiTuneService : WebServiceBaseClass
+(BooksiTuneService *)sharedInstance;
@property (nonatomic, strong)NSString * strSearch;
-(void)bookServicewithCompletionHandler:(CompletionHandler)handler;
@end
