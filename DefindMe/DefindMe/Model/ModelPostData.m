//
//  ModelPostData.m
//  DefindMe
//
//  Created by Sumit Mahto on 06/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "ModelPostData.h"

@implementation ModelPostData
-(id)initWithDictionary:(NSDictionary*)dic{
    if (self = [super init]) {
        
        if ([dic objectForKey:@"user_id"]&& ![[dic objectForKey:@"user_id"]isKindOfClass:[NSNull class]]) {
            self.strUserName = [dic objectForKey:@"user_id"];
        }else{
            self.strUserName = @"";
        }
        if ([dic objectForKey:@"name"]&& ![[dic objectForKey:@"name"]isKindOfClass:[NSNull class]]) {
            self.strUserImage = [dic objectForKey:@"name"];
        }else{
            self.strUserImage = @"";
        }
    }
    return self;
}
@end
