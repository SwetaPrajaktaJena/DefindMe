//
//  PostDetailsService.h
//  DefindMe
//
//  Created by Sumit Mahto on 14/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface PostDetailsService : WebServiceBaseClass
@property (nonatomic, strong)NSString * enjoyStatus;
+(PostDetailsService *)sharedInstance;
-(void)getPostDetailswithMediaId:(NSString *)strMediaID withpostID:(NSString *)strPid withUserID:(NSString *)strUserId withMediaType:(NSString *)strMediaType withCompletionHandler:(CompletionHandler)handler;

@end
