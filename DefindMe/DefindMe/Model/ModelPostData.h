//
//  ModelPostData.h
//  DefindMe
//
//  Created by Sumit Mahto on 06/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "ModelBaseClass.h"

@interface ModelPostData : ModelBaseClass
@property (nonatomic, assign) NSString *strUserName;
@property (nonatomic, assign) NSString *strUserImage;

-(id)initWithDictionary:(NSDictionary*)dic;
@end
