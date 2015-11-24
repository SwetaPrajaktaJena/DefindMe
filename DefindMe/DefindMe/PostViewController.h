//
//  PostViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 03/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface PostViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UITextFieldDelegate>
@property (nonatomic, strong)IBOutlet UITableView * listTable;
@property (nonatomic, strong)IBOutlet UIView * containerView;
@property (nonatomic, strong)IBOutlet UIButton * musicButton;
@property (nonatomic, strong)IBOutlet UIButton * moviesButton;
@property (nonatomic, strong)IBOutlet UIButton * booksButton;
@property (nonatomic, strong)IBOutlet UISearchBar * searchbar;
@property(nonatomic,strong)NSMutableArray * iconImageArray;
@property(nonatomic,strong)NSMutableArray * titleArray;
@property(nonatomic,strong)NSMutableArray * nameArray;
@property(nonatomic,strong)IBOutlet UIButton * searchButton;
@property(nonatomic,strong)IBOutlet UIButton * searchIconButton;
@property(nonatomic, strong)IBOutlet UILabel * searchLabel;
@property(nonatomic, strong)IBOutlet UIView * gestureView;
@property(nonatomic, strong)IBOutlet UIView * tooltipView;
@property (nonatomic, strong)IBOutlet UIButton * likeButton;
@property (nonatomic, strong)IBOutlet UIButton * dislikeButton;
@property (nonatomic, strong)AVAudioPlayer * audioPlayer;
@property (nonatomic,assign)BOOL bulMusic;
@property (nonatomic,assign)BOOL bulMovie;
@property (nonatomic,assign)BOOL bulBooks;
@property (nonatomic, strong)NSString * strTitle;
@property (nonatomic, strong)NSString * strName;
@property (nonatomic, strong)NSString * strDate;
@property (nonatomic, strong)NSString * strtrackId;
@property (nonatomic, strong)NSString * strMedia;
@property (nonatomic, strong)NSString * strLikeAndDislike;
@property (nonatomic, strong)NSString * strContent;
@property (nonatomic, strong)UIImage * varImage;
@property (nonatomic, strong)IBOutlet UITextField * searchtextField;
-(IBAction)searchButtonTapped:(id)sender;
-(IBAction)musicButtonTapped:(id)sender;
-(IBAction)moviesButtonTapped:(id)sender;
-(IBAction)booksButtonTapped:(id)sender;
-(IBAction)likeButtonTapped:(id)sender;
-(IBAction)dislikeButtonTapped:(id)sender;
@end
