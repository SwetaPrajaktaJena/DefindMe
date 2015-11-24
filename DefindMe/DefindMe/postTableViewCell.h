//
//  postTableViewCell.h
//  DefindMe
//
//  Created by Sumit Mahto on 03/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface postTableViewCell : UITableViewCell
@property (nonatomic, strong)IBOutlet UIImageView * iconImage;
@property (nonatomic, strong)IBOutlet UILabel * headerLabel;
@property (nonatomic, strong)IBOutlet UILabel * nameLabel;
@property (nonatomic, strong)IBOutlet UIButton * playButton;
@property (nonatomic, strong)IBOutlet UIButton * playerButton;
@property (nonatomic, strong)IBOutlet UILabel * timeLabel;
@end
