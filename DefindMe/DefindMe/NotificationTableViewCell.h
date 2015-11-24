//
//  NotificationTableViewCell.h
//  DefindMe
//
//  Created by Sumit Mahto on 06/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationTableViewCell : UITableViewCell
@property (nonatomic, strong)IBOutlet UIImageView * profileImage ;
@property (nonatomic, strong)IBOutlet UILabel * nameLabel;
@property (nonatomic, strong)IBOutlet UILabel * commentsLabel;
@property (nonatomic, strong)IBOutlet UILabel * timeLabel;
@property (nonatomic, strong)IBOutlet UIButton * addButton;
@property (nonatomic, strong)IBOutlet UIButton * profileButton;
@property (nonatomic, strong)IBOutlet UIButton * selectionButton;
@property (nonatomic, strong)IBOutlet UIImageView * iconImage ;
@property (nonatomic, assign)BOOL addValue;
@end
