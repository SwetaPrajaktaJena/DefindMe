//
//  PostLeftTableViewCell.m
//  DefindMe
//
//  Created by Sumit Mahto on 03/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "PostLeftTableViewCell.h"

@implementation PostLeftTableViewCell
@synthesize postImage;
@synthesize artstName;
@synthesize mediaType;
@synthesize dwnView;
@synthesize iconButton;
@synthesize posterTopConstraint;
- (void)awakeFromNib {
    // Initialization code
    
}
- (id)initWithFrame:(CGRect)frame
    reuseIdentifier:(NSString *)reuseIdentifier
{
   
    
    return self;
}
- (void)prepareForReuse {
    self.postImage.image=nil;
    
    [super prepareForReuse];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}
    
-(IBAction)profileButtonTapped:(id)sender{
    
}
@end
