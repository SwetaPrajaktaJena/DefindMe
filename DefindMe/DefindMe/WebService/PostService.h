//
//  PostService.h
//  DefindMe
//
//  Created by Sumit Mahto on 21/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface PostService : WebServiceBaseClass
@property(nonatomic,strong)NSMutableArray * idArray;
@property (nonatomic, strong)NSString * strChangeStatus;
@property (nonatomic, strong)NSString * userID;
@property (nonatomic, strong)NSString * indexValue;
+(PostService*)sharedInstance;

-(void)callForPostwithCompletionHandler:(CompletionHandler)handler;
-(void)callForPostMusicId:(NSString *)id withCompletionHandler:(CompletionHandler)handler;
@end
