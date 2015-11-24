//
//  userDataModule.h
//  DefindMe
//
//  Created by Sumit Mahto on 12/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "ModelBaseClass.h"

@interface userDataModule : ModelBaseClass
@property (nonatomic, assign) NSString *strUserName;
@property (nonatomic, strong)NSString * strImage;
-(id)initWithDictionary:(NSDictionary*)dic;
@end
