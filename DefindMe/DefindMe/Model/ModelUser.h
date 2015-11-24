//
//  ModelUser.h
//  DefindMe
//
//  Created by Sumit Mahto on 21/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelUser : ModelBaseClass

@property (nonatomic, assign) NSString *strUserId;
@property (nonatomic, assign) NSString *strName;
@property (nonatomic, assign) NSString *strProfileType;
@property (nonatomic, assign) NSString *strAvtar;
@property (nonatomic, assign) NSString *strEmail;
@property (nonatomic, assign) NSString *strPassword;
@property (nonatomic, assign) NSString *strGenderVal;
@property (nonatomic, assign) NSString *strFirstName;
@property (nonatomic, assign) NSString *strLastName;
@property (nonatomic, assign) NSString *strLocation;
@property (nonatomic, assign) NSString *strDOB;
@property (nonatomic, assign) NSString *aryExample;
@property (nonatomic, strong) NSString *strTag;
@property (nonatomic, strong) NSString *struid;
@property (nonatomic, strong) NSString *strContent;
@property (nonatomic, strong) NSString *strFeed;
@property (nonatomic, strong) NSString *strPrivacy;
@property (nonatomic, strong) NSString *strRecommend_id;
@property (nonatomic, strong) NSString *strParent_id;
@property (nonatomic, strong) NSString *strImage;
@property (nonatomic, strong) NSString *strfileImage;
@property (nonatomic, strong) NSString *strfullImage;
@property (nonatomic, strong) NSString *stralbumId;
@property (nonatomic, strong) NSString *strMediaType;
@property (nonatomic, strong) NSString *strmedia_id;
@property (nonatomic, strong) NSString *struser_id;
@property (nonatomic, strong) NSString * strMyId;
@property (nonatomic, strong) NSString * strfrndId;
@property (nonatomic, strong) NSString * strCmntUserID;
@property (nonatomic, strong) NSString * strCmntItemID;
@property (nonatomic, strong) NSString * strCmntMediaType;
@property (nonatomic, strong) NSString * strCmntItemUserId;
@property (nonatomic, strong) NSString * strCmntCommentText;
@property (nonatomic, strong) NSString * strLikesDislikesText;
@property (nonatomic) BOOL *isExample;
@property (nonatomic,strong)NSString * strrepostUserId;
@property (nonatomic,strong)NSString * strPostDetailsUserId;
@property (nonatomic, strong)NSString * strSocialNetworkId;
@property (nonatomic, strong)NSString * strsocialName;

-(id)initWithDictionary:(NSDictionary*)dic;

@end
