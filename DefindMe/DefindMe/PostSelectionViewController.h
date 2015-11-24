//
//  PostSelectionViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 10/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface PostSelectionViewController : UIViewController<UIGestureRecognizerDelegate,AVAudioPlayerDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(strong, nonatomic)IBOutlet UIView * containerView;
@property(strong, nonatomic)IBOutlet UIView * postContainerView;
@property(strong, nonatomic)IBOutlet UIView * gestureView;
@property(nonatomic, strong)IBOutlet UIButton * backButton;
@property(nonatomic, strong)IBOutlet UIButton * toolTipButton;
@property(nonatomic, strong)IBOutlet UILabel * nameLabel;
@property(nonatomic, strong)IBOutlet UILabel * titleLabel;
@property(nonatomic, strong)IBOutlet UILabel * artistLabel;
@property(nonatomic, strong)IBOutlet UILabel * timeLabel;
@property(nonatomic, strong)IBOutlet UILabel * commentsCountLabel;
@property(nonatomic, strong)IBOutlet UILabel * enjoysCountLabel;
@property(nonatomic, strong)IBOutlet UILabel * repostsCountLabel;
@property(nonatomic, strong)IBOutlet UIImageView * posterImageView;
@property(nonatomic, strong)IBOutlet UIImageView * profileImageView;
@property(nonatomic, strong)IBOutlet UIButton * musicPaly;
@property(nonatomic, strong)AVAudioPlayer * audioPlayerF;
@property(nonatomic, strong)IBOutlet UITableView * detailsToolTipView;
@property(nonatomic, strong)IBOutlet UITableView * postListTableView;
@property(nonatomic, strong)IBOutlet UITextField * commentTextField;
@property(nonatomic, strong)IBOutlet UIButton * arrowButton;
@property(nonatomic, strong)IBOutlet UIButton * commentsButton;
@property(nonatomic, strong)IBOutlet UIButton * enjoysButton;
@property(nonatomic, strong)IBOutlet UIButton * repostsButton;
@property(nonatomic, strong)IBOutlet UIButton *sepEnjoyButton;
@property(nonatomic, strong)IBOutlet UIView * toolTipContainer;
@property(nonatomic, strong)NSMutableArray * optionArray;
@property(nonatomic, strong)NSMutableArray * postsArray;
-(IBAction)backButtonTapped:(id)sender;
-(IBAction)musicPlayButtonTapped:(id)sender;
-(IBAction)toolTipShown:(id)sender;
-(IBAction)arrowButtonTapped:(id)sender;
-(IBAction)commentsButtonTapped:(id)sender;
-(IBAction)enjoysButtonTapped:(id)sender;
-(IBAction)repostsButtonTapped:(id)sender;
-(IBAction)separateEnjoyButtonTappedButtonTapped:(id)sender;
@end
