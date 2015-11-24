//
//  MediaModule.h
//  DefindMe
//
//  Created by Sumit Mahto on 13/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "ModelBaseClass.h"

@interface MediaModule : ModelBaseClass
@property (nonatomic, strong)NSString * mediaKind;
@property (nonatomic, strong)NSString * mediaTitle;
@property (nonatomic, strong)NSMutableDictionary * posterDict;
@property (nonatomic, strong)NSString * imagestr;
@property (nonatomic, strong)NSMutableDictionary * booktitleDict;
@property (nonatomic, strong)NSMutableDictionary * bookImageDict;
@end
