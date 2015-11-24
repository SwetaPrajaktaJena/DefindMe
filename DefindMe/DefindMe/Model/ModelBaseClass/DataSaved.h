//
//  DataSaved.h
//  DefindMe
//
//  Created by Sumit Mahto on 07/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DataSaved : NSObject
@property(nonatomic, strong)NSString * strPoster;
@property(nonatomic, strong)NSString * strProfileImage;
@property(nonatomic, strong)NSString * strName;
@property(nonatomic, strong)NSString * strTime;
@property(nonatomic, strong)NSString * strArtist;
@property(nonatomic, strong)NSString * strTitle;
@property(nonatomic, strong)NSString * strAudioUrl;
@property(nonatomic, strong)NSString * strItemId;
@property(nonatomic, strong)NSString * strmediaType;
@property(nonatomic, strong)NSString * strItemUserId;
@property(nonatomic, strong)NSString * strPostId;
@property(nonatomic, strong)NSString * strMediaId;
@property(nonatomic, strong)NSString * strenjoyStatus;
@property(nonatomic, strong)NSString * strSocialLoginID;
@property(nonatomic, strong)NSString * strSocialLoginName;
@property(nonatomic, strong)NSString * strSocialLoginToken;
@property(nonatomic, strong)NSString * deviceToken;
@property (nonatomic, strong)NSMutableDictionary * savedDataDict;
//FeedPaageDataSaved
@property (nonatomic, strong)NSDictionary * dataDic;
+(DataSaved *)sharedInstance;
-(id)initWithDictionary:(NSDictionary*)dic;
@end
