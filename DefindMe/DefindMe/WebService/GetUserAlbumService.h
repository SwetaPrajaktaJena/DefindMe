//
//  GetUserAlbumService.h
//  DefindMe
//
//  Created by Sumit Mahto on 18/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"
#import <UIKit/UIKit.h>
@interface GetUserAlbumService : WebServiceBaseClass
+(GetUserAlbumService *)sharedInstance;
-(void)GetUserAlbumServiceid:(NSString *)strUserId withCompletionHandler:(CompletionHandler)handler;

@end
