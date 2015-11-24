//
//  PostModule.h
//  DefindMe
//
//  Created by Sumit Mahto on 13/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "ModelBaseClass.h"

@interface PostModule : ModelBaseClass
@property (nonatomic, assign) NSString *strUserId;
@property (nonatomic, assign) NSString *postId;
@property (nonatomic, strong)NSString *postTitle;
@property (nonatomic, strong)NSString *postDate;
@property (nonatomic, strong)NSString *mediaId;
@property (nonatomic, strong)NSString *contentStr;
@property (nonatomic, strong)NSString *parentId;
@end
