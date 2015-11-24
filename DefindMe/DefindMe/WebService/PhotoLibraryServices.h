//
//  PhotoLibraryServices.h
//  DefindMe
//
//  Created by Sumit Mahto on 20/06/1937 SAKA.
//  Copyright (c) 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface PhotoLibraryServices : WebServiceBaseClass
@property (nonatomic, strong)NSString * userID;
@property (nonatomic, strong)NSString * alubumId;
@property (nonatomic, strong)NSString * totalImages;
+(PhotoLibraryServices *)sharedInstance;
-(void)GetUserAlbumServiceidwithCompletionHandler:(CompletionHandler)handler;

@end
