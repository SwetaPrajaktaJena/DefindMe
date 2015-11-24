//
//  ImaeDataModule.m
//  DefindMe
//
//  Created by Sumit Mahto on 12/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "ImaeDataModule.h"

@implementation ImaeDataModule
+(ImaeDataModule *)sharedInstance{
    static ImaeDataModule * data =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data=[[ImaeDataModule alloc]init];
    });
    return data;
}
@end
