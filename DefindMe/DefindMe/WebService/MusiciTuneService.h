//
//  MusiciTuneService.h
//  DefindMe
//
//  Created by Sumit Mahto on 21/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface MusiciTuneService : WebServiceBaseClass
+(MusiciTuneService*)sharedInstance;
@property (nonatomic, strong)NSString * strSearch;
-(void)musicServicewithCompletionHandler:(CompletionHandler)handler;

@end
