//
//  postTableViewCell.m
//  DefindMe
//
//  Created by Sumit Mahto on 03/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "postTableViewCell.h"

@implementation postTableViewCell
@synthesize iconImage;
@synthesize playButton;
@synthesize timeLabel;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)prepareForReuse{
    
}
@end
