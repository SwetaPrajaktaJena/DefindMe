//
//  MatchesLeftTableViewCell.h
//  DefindMe
//
//  Created by Sumit Mahto on 08/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MatchesLeftTableViewCell : UITableViewCell
@property (nonatomic, strong)IBOutlet UIImageView * profileImage;
@property (nonatomic, strong)IBOutlet UIView * dataView;
@property (nonatomic, strong)IBOutlet UIButton * followersButton;
@property (nonatomic, strong)IBOutlet UILabel * nameLabel;
@property (nonatomic, strong)IBOutlet UILabel * locationLabel;
@property (nonatomic, strong)IBOutlet UILabel * percentageLabel;
@property (nonatomic, strong)IBOutlet UIButton * selectionButton;

@end
