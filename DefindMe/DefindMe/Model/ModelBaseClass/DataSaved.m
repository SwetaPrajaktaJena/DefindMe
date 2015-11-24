//
//  DataSaved.m
//  DefindMe
//
//  Created by Sumit Mahto on 07/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "DataSaved.h"

@implementation DataSaved
+(DataSaved *)sharedInstance{
    static DataSaved * data =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data=[[DataSaved alloc]init];
    });
    return data;
}
-(id)initWithDictionary:(NSDictionary*)dic{
    if (self = [super init]) {
        if ([dic objectForKey:@"Post"]&& ![[dic objectForKey:@"Post"]isKindOfClass:[NSNull class]]) {
            self.dataDic = [dic objectForKey:@"Post"];
        }else{
            self.dataDic =nil;
        }
       
    }
    return self;
}
@end
