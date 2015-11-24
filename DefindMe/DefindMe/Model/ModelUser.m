//
//  ModelUser.m
//  DefindMe
//
//  Created by Sumit Mahto on 21/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "ModelUser.h"

@implementation ModelUser
@synthesize strImage;

-(id)initWithDictionary:(NSDictionary*)dic{
    if (self = [super init]) {
        
        if ([dic objectForKey:@"user_id"]&& ![[dic objectForKey:@"user_id"]isKindOfClass:[NSNull class]]) {
            self.strUserId = [dic objectForKey:@"user_id"];
        }else{
            self.strUserId = @"";
        }
        if ([dic objectForKey:@"name"]&& ![[dic objectForKey:@"name"]isKindOfClass:[NSNull class]]) {
            self.strName = [dic objectForKey:@"name"];
        }else{
            self.strName = @"";
        }
        if ([dic objectForKey:@"profile_type"]&& ![[dic objectForKey:@"profile_type"]isKindOfClass:[NSNull class]]) {
            self.strProfileType = [dic objectForKey:@"profile_type"];
        }else{
            self.strProfileType = @"";
        }
        if ([dic objectForKey:@"avatar"]&& ![[dic objectForKey:@"avatar"]isKindOfClass:[NSNull class]]) {
            self.strAvtar = [dic objectForKey:@"avatar"];
        }else{
            self.strAvtar = @"";
        }
        if ([dic objectForKey:@"email"]&& ![[dic objectForKey:@"email"]isKindOfClass:[NSNull class]]) {
            self.strEmail = [dic objectForKey:@"email"];
        }else{
            self.strEmail = @"";
        }
        if ([dic objectForKey:@"password"]&& ![[dic objectForKey:@"password"]isKindOfClass:[NSNull class]]) {
            self.strPassword = [dic objectForKey:@"password"];
        }else{
            self.strPassword = @"";
        }
        if ([dic objectForKey:@"name"]&& ![[dic objectForKey:@"name"]isKindOfClass:[NSNull class]]) {
            self.strFirstName = [dic objectForKey:@"name"];
        }else{
            self.strFirstName = @"";
        }
        if ([dic objectForKey:@"last_name"]&& ![[dic objectForKey:@"last_name"]isKindOfClass:[NSNull class]]) {
            self.strLastName= [dic objectForKey:@"last_name"];
        }else{
            self.strLastName = @"";
        }
        if ([dic objectForKey:@"location"]&& ![[dic objectForKey:@"location"]isKindOfClass:[NSNull class]]) {
            self.strLocation= [dic objectForKey:@"location"];
        }else{
            self.strLocation= @"";
        }
        if ([dic objectForKey:@"dob"]&& ![[dic objectForKey:@"dob"]isKindOfClass:[NSNull class]]) {
            self.strDOB = [dic objectForKey:@"dob"];
        }else{
            self.strDOB = @"";
        }
        if ([dic objectForKey:@"gender"]&& ![[dic objectForKey:@"gender"]isKindOfClass:[NSNull class]]) {
            self.strGenderVal = [dic objectForKey:@"gender"];
        }else{
            self.strGenderVal = @"";
        }
        if ([dic objectForKey:@"tags"]&& ![[dic objectForKey:@"tags"]isKindOfClass:[NSNull class]]) {
            self.strTag = [dic objectForKey:@"tags"];
        }else{
            self.strTag = @"";
        }
        
        if ([dic objectForKey:@"uid"]&& ![[dic objectForKey:@"uid"]isKindOfClass:[NSNull class]]) {
            self.struid = [dic objectForKey:@"uid"];
        }else{
            self.struid = @"";
        }
        if ([dic objectForKey:@"content"]&& ![[dic objectForKey:@"content"]isKindOfClass:[NSNull class]]) {
            self.strContent= [dic objectForKey:@"content"];
        }else{
            self.strContent = @"";
        }
        if ([dic objectForKey:@"feed"]&& ![[dic objectForKey:@"feed"]isKindOfClass:[NSNull class]]) {
            self.strFeed = [dic objectForKey:@"feed"];
        }else{
            self.strFeed = @"";
        }
        if ([dic objectForKey:@"privacy"]&& ![[dic objectForKey:@"privacy"]isKindOfClass:[NSNull class]]) {
            self.strPrivacy = [dic objectForKey:@"privacy"];
        }else{
            self.strPrivacy = @"";
        }
        if ([dic objectForKey:@"recommend_id"]&& ![[dic objectForKey:@"recommend_id"]isKindOfClass:[NSNull class]]) {
            self.strPrivacy = [dic objectForKey:@"recommend_id"];
        }else{
            self.strPrivacy = @"";
        }

        if ([dic objectForKey:@"parent_id"]&& ![[dic objectForKey:@"parent_id"]isKindOfClass:[NSNull class]]) {
            self.strParent_id = [dic objectForKey:@"parent_id"];
        }else{
            self.strParent_id = @"";
        }
        if ([dic objectForKey:@"file"]&& ![[dic objectForKey:@"file"]isKindOfClass:[NSNull class]]) {
            self.strfileImage = [dic objectForKey:@"file"];
        }else{
            self.strfileImage = @"";
        }
        if ([dic objectForKey:@"full_image"]&& ![[dic objectForKey:@"full_image"]isKindOfClass:[NSNull class]]) {
            self.strfullImage = [dic objectForKey:@"full_image"];
        }else{
            self.strfullImage = @"";
        }
        if ([dic objectForKey:@"media_type"]&& ![[dic objectForKey:@"media_type"]isKindOfClass:[NSNull class]]) {
            self.stralbumId = [dic objectForKey:@"media_type"];
        }else{
            self.stralbumId = @"";
        }
        if ([dic objectForKey:@"media_id"]&& ![[dic objectForKey:@"media_id"]isKindOfClass:[NSNull class]]) {
            self.stralbumId = [dic objectForKey:@"media_id"];
        }else{
            self.stralbumId = @"";
        }
        if ([dic objectForKey:@"user_id"]&& ![[dic objectForKey:@"user_id"]isKindOfClass:[NSNull class]]) {
            self.stralbumId = [dic objectForKey:@"user_id"];
        }else{
            self.stralbumId = @"";
        }
        if ([dic objectForKey:@"uid"]&& ![[dic objectForKey:@"uid"]isKindOfClass:[NSNull class]]) {
            self.strMyId = [dic objectForKey:@"uid"];
        }else{
            self.strMyId = @"";
        }
        if ([dic objectForKey:@"fid"]&& ![[dic objectForKey:@"fid"]isKindOfClass:[NSNull class]]) {
            self.strfrndId = [dic objectForKey:@"fid"];
        }else{
            self.strfrndId = @"";
        }
        if ([dic objectForKey:@"UserId"]&& ![[dic objectForKey:@"UserId"]isKindOfClass:[NSNull class]]) {
            self.strCmntUserID = [dic objectForKey:@"UserId"];
        }else{
            self.strCmntUserID = @"";
        }

        if ([dic objectForKey:@"ItemId"]&& ![[dic objectForKey:@"ItemId"]isKindOfClass:[NSNull class]]) {
            self.strCmntItemID = [dic objectForKey:@"ItemId"];
        }else{
            self.strCmntItemID = @"";
        }
        if ([dic objectForKey:@"Type"]&& ![[dic objectForKey:@"Type"]isKindOfClass:[NSNull class]]) {
            self.strCmntMediaType = [dic objectForKey:@"Type"];
        }else{
            self.strCmntMediaType = @"";
        }
        if ([dic objectForKey:@"ItemUserId"]&& ![[dic objectForKey:@"ItemUserId"]isKindOfClass:[NSNull class]]) {
            self.strCmntItemUserId = [dic objectForKey:@""];
        }else{
            self.strCmntItemUserId = @"";
        }
        if ([dic objectForKey:@"Comment"]&& ![[dic objectForKey:@"Comment"]isKindOfClass:[NSNull class]]) {
            self.strCmntCommentText = [dic objectForKey:@"ItemUserId"];
        }else{
            self.strCmntCommentText = @"";
        }
        if ([dic objectForKey:@"LikeDislike"]&& ![[dic objectForKey:@"LikeDislike"]isKindOfClass:[NSNull class]]) {
            self.strLikesDislikesText = [dic objectForKey:@"LikeDislike"];
        }else{
            self.strLikesDislikesText = @"";
        }
        if ([dic objectForKey:@"post_id"]&& ![[dic objectForKey:@"post_id"]isKindOfClass:[NSNull class]]) {
            self.strrepostUserId = [dic objectForKey:@"post_id"];
        }else{
            self.strrepostUserId = @"";
        }
        if ([dic objectForKey:@"pid"]&& ![[dic objectForKey:@"pid"]isKindOfClass:[NSNull class]]) {
            self.strPostDetailsUserId = [dic objectForKey:@"pid"];
        }else{
            self.strPostDetailsUserId= @"";
        }
          if ([dic objectForKey:@"FbId"]&& ![[dic objectForKey:@"FbId"]isKindOfClass:[NSNull class]]) {
            self.strSocialNetworkId = [dic objectForKey:@"FbId"];
        }else{
            self.strSocialNetworkId= @"";
        }
        if ([dic objectForKey:@"Name"]&& ![[dic objectForKey:@"Name"]isKindOfClass:[NSNull class]]) {
            self.strsocialName = [dic objectForKey:@"Name"];
        }else{
            self.strsocialName = @"";
        }
    }
    
    return self;
}

@end
