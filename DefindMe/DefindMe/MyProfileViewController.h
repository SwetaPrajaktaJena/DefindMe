//
//  MyProfileViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 07/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface MyProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UISearchBarDelegate,AVAudioPlayerDelegate,UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UISearchDisplayDelegate>
@property (nonatomic, strong)IBOutlet UISearchDisplayController * testsearchBar;
@property (nonatomic, strong)IBOutlet UIView * profileContainer;
@property (nonatomic, strong)IBOutlet UIView * buttonContainer;
@property (nonatomic, strong)IBOutlet UIView * likesContainer;
@property (nonatomic, strong)IBOutlet UITableView * leftTableView;
@property (nonatomic, strong)IBOutlet UITableView * rightTableView;
@property (nonatomic, strong)IBOutlet UIButton * followingButton;
@property (nonatomic, strong)IBOutlet UIButton * backButton;
@property (nonatomic, strong)IBOutlet UIButton * moreButton;
@property (nonatomic, strong)IBOutlet UIView * firstSeparator;
@property (nonatomic, strong)IBOutlet UIView * secondSeparator;
@property (nonatomic, strong)IBOutlet UIButton * selectionButton;
@property (nonatomic, strong)IBOutlet UIButton * feedButton;
@property (nonatomic, strong)IBOutlet UIButton * followersButton;
@property (nonatomic, strong)IBOutlet UIImageView * profileImage;
@property (nonatomic, strong)IBOutlet UILabel * nameLabel;
@property (nonatomic, strong)IBOutlet UILabel * locationLabel;
@property(nonatomic,strong)NSMutableArray * discoverMusicArray;
@property(nonatomic,strong)NSMutableArray * discoverVedioArray;
@property(nonatomic,strong)NSMutableArray * userImageArray;
@property(nonatomic,strong)NSMutableArray * userNameArray;
@property(nonatomic,strong)NSMutableArray * timeElapsedArray;
@property(nonatomic,strong)NSMutableArray * contentArray;
@property(nonatomic,strong)NSMutableArray * tooltipArray;
@property(nonatomic,strong)NSMutableArray * idArray;
@property(nonatomic,strong)NSMutableArray * idValArray;
@property(nonatomic,strong)NSMutableArray * phototitleArray;
@property(nonatomic,strong)NSMutableArray * posterArray;
@property(nonatomic,strong)NSMutableArray * postName;
@property(nonatomic,strong)NSMutableArray * artistNameArray;
@property(nonatomic,strong)NSMutableArray * releaseDate;
@property(nonatomic,strong)NSMutableArray * mediaKind;
@property (nonatomic, strong)AVAudioPlayer * audioPlayerF;
@property (nonatomic, strong)AVAudioPlayer * audioPlayerS;
@property (nonatomic, strong)NSString * status;
@property (nonatomic, strong)NSString * strImage;
@property (strong,nonatomic)IBOutlet UIButton * likesButton;
@property (strong, nonatomic)IBOutlet UIButton * photosButton;
@property (strong, nonatomic)IBOutlet UIView * likeView;
//LikePage
@property (nonatomic, strong)IBOutlet UITableView * listTable;
@property (nonatomic, strong)IBOutlet UIView * containerView;
@property (nonatomic, strong)IBOutlet UIButton * musicButton;
@property (nonatomic, strong)IBOutlet UIButton * moviesButton;
@property (nonatomic, strong)IBOutlet UIButton * booksButton;
@property (nonatomic, strong)IBOutlet UISearchBar * searchbar;
@property(nonatomic,strong)NSMutableArray * iconImageArray;
@property(nonatomic,strong)NSMutableArray * titleArray;
@property(nonatomic,strong)NSMutableArray * nameArray;
@property(nonatomic,strong)NSMutableDictionary * UserDataArray;
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
@property (nonatomic, strong)IBOutlet UICollectionView * photosCollectionView;
@property (nonatomic, strong)IBOutlet UIView * navigationContainer;
@property (nonatomic, strong)IBOutlet UIView * photosContainer;
@property (nonatomic, strong)IBOutlet UIView * swipeGestureView;
@property (nonatomic, strong)UIImage * profileImageParse;
@property (nonatomic, strong)IBOutlet UIButton * photosTransButton;
@property (nonatomic, strong)IBOutlet UIButton * LikesTransButton;
@property (nonatomic, strong)IBOutlet UILabel * feedLabel;
@property (nonatomic, strong)IBOutlet UILabel * photosLabel;
@property (nonatomic, strong)IBOutlet UILabel * likesLabel;
@property (nonatomic, strong)IBOutlet UILabel * musicLabel;
@property (nonatomic, strong)IBOutlet UILabel * MoviesLabel;
@property (nonatomic, strong)IBOutlet UILabel * booksLabel;
@property (nonatomic, strong)IBOutlet UIView * photosTouchView;
@property (nonatomic, strong)NSString * strUID;
@property (nonatomic, strong)NSString * strUserName;
@property(nonatomic, strong)IBOutlet UILabel * followersCount;
@property (nonatomic, assign)BOOL search;
@property (nonatomic, strong)IBOutlet UIView * topView;
@property (nonatomic, strong)IBOutlet UIView * imageView;
@property (nonatomic, strong)IBOutlet UIImageView * picImageView;
-(IBAction)searchButtonTapped:(id)sender;
-(IBAction)musicButtonTapped:(id)sender;
-(IBAction)moviesButtonTapped:(id)sender;
-(IBAction)booksButtonTapped:(id)sender;
-(IBAction)likesButtonTapped:(id)sender;
-(IBAction)dislikeButtonTapped:(id)sender;
-(IBAction)followingButtonTapped:(id)sender;
-(IBAction)followersButtonTapped:(id)sender;
-(IBAction)backButtonTapped:(id)sender;
-(IBAction)moreButtonTapped:(id)sender;
-(IBAction)selectionButtonTapped:(id)sender;
-(IBAction)likeButtonTapped:(id)sender;
-(IBAction)photosButtonTapped:(id)sender;
-(IBAction)feedButtonTapped:(id)sender;
-(IBAction)touchButtonTapped:(id)sender;
@end
