//
//  DeletePostServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 13/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface DeletePostServices : WebServiceBaseClass
+(DeletePostServices *)sharedInstance;
-(void)deletePostUserID:(NSString *)strPostId withCompletionHandler:(CompletionHandler)handler;


@end
