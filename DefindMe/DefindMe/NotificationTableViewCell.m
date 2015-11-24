//
//  NotificationTableViewCell.m
//  DefindMe
//
//  Created by Sumit Mahto on 06/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "NotificationTableViewCell.h"

@implementation NotificationTableViewCell
@synthesize iconImage;
@synthesize addButton;
@synthesize addValue;
- (void)awakeFromNib {
    // Initialization code
    addValue=YES;
}
-(IBAction)addButtonTapped:(id)sender{
    if (addValue) {

    [self.addButton.layer setBorderColor:[[UIColor clearColor] CGColor]];
    addButton.backgroundColor=[UIColor colorWithRed:(184/255.f) green:(233/255.f) blue:(134/255.f) alpha:1.f];
            iconImage.image=[UIImage imageNamed:@"right-1.png"];
        addValue=NO;
    }
     else {
         addValue=YES;
         addButton.backgroundColor=[UIColor clearColor];

        [addButton.layer setBorderColor:[[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] CGColor]];
        iconImage.image=[UIImage imageNamed:@"plus sign 1X.png"];
    }

    }
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
