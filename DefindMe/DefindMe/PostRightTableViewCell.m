//
//  PostRightTableViewCell.m
//  DefindMe
//
//  Created by Sumit Mahto on 03/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "PostRightTableViewCell.h"

@implementation PostRightTableViewCell
@synthesize contentLabel;
@synthesize iconButton;
@synthesize posterTopConstraint;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)prepareForReuse {
    self.postImage.image=nil;
    
    [super prepareForReuse];
}
@end
