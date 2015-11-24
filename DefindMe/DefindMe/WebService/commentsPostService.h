//
//  commentsPostService.h
//  DefindMe
//
//  Created by Sumit Mahto on 09/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface commentsPostService : WebServiceBaseClass
+(commentsPostService *)sharedInstance;
-(void)commentwithUserID:(NSString *)struID withItemID:(NSString *)strItemId withMediaType:(NSString *)strMediaType withItemUSerID:(NSString *)strItemUserId withCommentContent:(NSString *)strComment withPosterURL:(NSString *)strPosterUrl withCompletionHandler:(CompletionHandler)handler;

@end
