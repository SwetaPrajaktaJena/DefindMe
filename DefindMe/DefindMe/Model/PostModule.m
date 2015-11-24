//
//  PostModule.m
//  DefindMe
//
//  Created by Sumit Mahto on 13/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "PostModule.h"

@implementation PostModule
-(id)initWithDictionary:(NSDictionary*)dic{
    if (self = [super init]) {
        
        if ([dic objectForKey:@"id"]&& ![[dic objectForKey:@"id"]isKindOfClass:[NSNull class]]) {
            self.postId = [dic objectForKey:@"id"];
        }else{
            self.postId = @"";
        }
        if ([dic objectForKey:@"uid"]&& ![[dic objectForKey:@"uid"]isKindOfClass:[NSNull class]]) {
            self.strUserId = [dic objectForKey:@"uid"];
        }else{
            self.strUserId= @"";
        }
        if ([dic objectForKey:@"m_id"]&& ![[dic objectForKey:@"m_id"]isKindOfClass:[NSNull class]]) {
            self.mediaId = [dic objectForKey:@"m_id"];
        }else{
            self.mediaId= @"";
        }
        if ([dic objectForKey:@"content"]&& ![[dic objectForKey:@"content"]isKindOfClass:[NSNull class]]) {
            self.contentStr = [dic objectForKey:@"content"];
        }else{
            self.contentStr= @"";
        }
        if ([dic objectForKey:@"postdate"]&& ![[dic objectForKey:@"postdate"]isKindOfClass:[NSNull class]]) {
            self.postDate = [dic objectForKey:@"postdate"];
        }else{
            self.postDate= @"";
        }
        if ([dic objectForKey:@"postdate"]&& ![[dic objectForKey:@"postdate"]isKindOfClass:[NSNull class]]) {
            self.postDate = [dic objectForKey:@"postdate"];
        }else{
            self.postDate= @"";
        }
        if ([dic objectForKey:@"parent_id"]&& ![[dic objectForKey:@"parent_id"]isKindOfClass:[NSNull class]]) {
            self.parentId = [dic objectForKey:@"parent_id"];
        }else{
            self.parentId= @"";
        }
    }
    return self;
}
@end
