//
//  PostLeftTableViewCell.h
//  DefindMe
//
//  Created by Sumit Mahto on 03/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostLeftTableViewCell : UITableViewCell
@property (nonatomic, strong)IBOutlet UIImageView * postImage;
@property (nonatomic, strong)IBOutlet UIView * upperContainerView;
@property (nonatomic, strong)IBOutlet UIView * lowerContainerView;
@property (nonatomic, strong)IBOutlet UIButton * iconButton;
@property (nonatomic, strong)IBOutlet UIButton * settingButton;
@property (nonatomic, strong)IBOutlet UIButton * profileButton;
@property (nonatomic, strong)IBOutlet UIButton * vedioButton;
@property (nonatomic, strong)IBOutlet UIButton * profilePseudoButton;
@property (nonatomic, strong)IBOutlet UIButton * selectionButton;
@property (nonatomic, strong)IBOutlet UILabel * userNameLabel;
@property (nonatomic, strong)IBOutlet UILabel * timeLabel;
@property (nonatomic, strong)IBOutlet UILabel * contentLabel;
@property (nonatomic, strong)IBOutlet UIImageView * iconImage;
@property (nonatomic, strong)IBOutlet UILabel * artstName;
@property (nonatomic, strong)IBOutlet UILabel * collectionNAME;
@property (nonatomic, strong)IBOutlet UILabel * releaseDateLabel;
@property (nonatomic, strong)IBOutlet NSLayoutConstraint * commentHeight;
@property (nonatomic, strong)IBOutlet NSLayoutConstraint * lolevelTop;
@property (nonatomic, strong)IBOutlet NSLayoutConstraint * commentbuttom;
@property (nonatomic, strong)IBOutlet NSLayoutConstraint * posterButtom;
@property (nonatomic, strong)NSString * mediaType;
@property (nonatomic, strong)IBOutlet UIView * dwnView;
@property (nonatomic, strong)IBOutlet UIView * topView;
@property (nonatomic, strong)IBOutlet NSLayoutConstraint * commentLabelHeightConstraint;
@property (nonatomic, strong)IBOutlet NSLayoutConstraint * posterHeightConstraint;
@property (nonatomic, strong)IBOutlet NSLayoutConstraint * posterTopConstraint;
@property (nonatomic,strong)IBOutlet NSLayoutConstraint * iconButtonHieghtConstraint;
-(IBAction)profileButtonTapped:(id)sender;
@end
