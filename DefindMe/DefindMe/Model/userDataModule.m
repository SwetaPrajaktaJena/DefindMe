//
//  userDataModule.m
//  DefindMe
//
//  Created by Sumit Mahto on 12/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "userDataModule.h"

@implementation userDataModule
+(userDataModule *)sharedInstance{
    static userDataModule * data =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data=[[userDataModule alloc]init];
    });
    return data;
}
-(id)initWithDictionary:(NSDictionary*)dic{
     if (self = [super init]) {
         if ([dic objectForKey:@"name"]&& ![[dic objectForKey:@"name"]isKindOfClass:[NSNull class]]) {
             self.strUserName= [dic objectForKey:@"name"];
         }else{
             self.strUserName = @"";
         }
         if ([dic objectForKey:@"avatar"]&& ![[dic objectForKey:@"avatar"]isKindOfClass:[NSNull class]]) {
             self.strImage= [dic objectForKey:@"avatar"];
         }else{
             self.strImage = @"";
         }
             }
    return self;
}
@end
