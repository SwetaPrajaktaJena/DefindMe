//
//  BookMarkAddWebservice.h
//  DefindMe
//
//  Created by Sumit Mahto on 18/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface BookMarkAddWebservice : WebServiceBaseClass
@property (nonatomic, strong)NSString * mediaType;
@property (nonatomic, strong)NSString * mediaId;
+(BookMarkAddWebservice *)sharedInstance;
-(void)bookMarkPostswithMedia_Type:(NSString *)mediaType withMediaId:(NSString *)mediaID withUserId:(NSString *)user_id withCompletionHandler:(CompletionHandler)handler;

@end
