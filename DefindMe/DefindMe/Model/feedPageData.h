//
//  feedPageData.h
//  DefindMe
//
//  Created by Sumit Mahto on 25/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "ModelBaseClass.h"

@interface feedPageData : ModelBaseClass
@property (nonatomic, strong)NSString * post_Id;
@property (nonatomic, strong)NSString * media_Id;
@property (nonatomic, strong)NSString * uid;
@property (nonatomic, strong)NSString * content;
@property (nonatomic, strong)NSString * name;
@property (nonatomic, strong)NSString * avatar;
@property (nonatomic, strong)NSString * strid;
@property (nonatomic, strong)NSString * strPostId;
@property (nonatomic, strong)NSString * strPostDate;
@property (nonatomic, strong)NSString * strmpthriURL;
@property (nonatomic, strong)NSString * strposterURL;
@property (nonatomic, strong)NSString * mediaKind;
@property (nonatomic, strong)NSString * strMediaId;
@property (nonatomic, strong)NSString * strContent;
@property (nonatomic, strong)NSString * strArtistName;
@property (nonatomic, strong)NSString * strTitle;
-(id)initWithDictionary:(NSDictionary*)dic;
-(id)initWithUserDataDictionary:(NSDictionary *)dic;
-(id)initWithDictionaryMediaData:(NSDictionary *)dic;
-(id)initWithDictionaryMediaPosterData:(NSDictionary *)dic;
@end
