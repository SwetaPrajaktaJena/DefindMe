//
//  BookMarkFetchDataServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 19/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface BookMarkFetchDataServices : WebServiceBaseClass
+(BookMarkFetchDataServices *)sharedInstance;
-(void)bookMarkPostswithMedia_Type:(NSString *)mediaType withMediaId:(NSString *)mediaID withUserId:(NSString *)user_id withCompletionHandler:(CompletionHandler)handler;

@end
