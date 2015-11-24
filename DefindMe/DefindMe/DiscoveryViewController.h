//
//  DiscoveryViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface DiscoveryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,AVAudioPlayerDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray * discoverMusicArray;
@property(nonatomic,strong)NSMutableArray * discoverVedioArray;
@property (strong, nonatomic) IBOutlet UITableView * leftTableView;
@property (strong, nonatomic) IBOutlet UITableView * rightTableview;
@property (strong, nonatomic) IBOutlet UIButton * popularButton;
@property (strong, nonatomic) IBOutlet UIButton * moviesButton;
@property (strong, nonatomic) IBOutlet UIButton * booksButton;
@property (strong, nonatomic) IBOutlet UIButton * musicButton;
@property (strong, nonatomic) IBOutlet UIView * optionButtonContainer;
@property (strong, nonatomic) IBOutlet UIView * popularView;
@property (strong, nonatomic) IBOutlet UIView * musicView;
@property (strong, nonatomic) IBOutlet UIView * booksView;
@property (strong, nonatomic) IBOutlet UIView * movieView;
@property(nonatomic,strong)NSMutableArray * userImageArray;
@property(nonatomic,strong)NSMutableArray * userNameArray;
@property(nonatomic,strong)NSMutableArray * timeElapsedArray;
@property(nonatomic,strong)NSMutableArray * contentArray;
@property(nonatomic,strong)NSMutableArray * tooltipArray;
@property(nonatomic,strong)NSMutableArray * idArray;
@property(nonatomic,strong)NSMutableArray * idValArray;
@property(nonatomic,strong)NSMutableArray * posterArray;
@property(nonatomic,strong)NSMutableArray * postName;
@property(nonatomic,strong)NSMutableArray * artistNameArray;
@property(nonatomic,strong)NSMutableArray * releaseDate;
@property(nonatomic,strong)NSMutableArray * mediaKind;
@property (nonatomic, strong)NSMutableArray * postsArray;
@property (nonatomic, assign)BOOL left;
@property (nonatomic, assign)BOOL right;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong)NSMutableArray * postsmult1;
@property (nonatomic, strong)NSMutableArray * postsmult2;
@property (nonatomic, strong)IBOutlet UIImageView * imagView;
@property (nonatomic, strong)AVAudioPlayer * audioPlayerF;
@property (nonatomic, strong)AVAudioPlayer * audioPlayerS;
@property (nonatomic, strong)IBOutlet UITableView * tooltipTableView;
@property (nonatomic, strong)IBOutlet UIView * gestureView;
@property (nonatomic, strong)NSString * SelectedUserId;
@property (nonatomic, strong)NSString * strUserName;
@property (nonatomic, strong)NSMutableArray * popularImagesFstArray;
@property (nonatomic, strong)NSMutableArray * musicImagesFstArray;
@property (nonatomic, strong)NSMutableArray * moviesImagesFstArray;
@property (nonatomic, strong)NSMutableArray * booksImagesFstArray;

@property (nonatomic, strong)NSMutableArray * popularImagesSndArray;
@property (nonatomic, strong)NSMutableArray * musicImagesSndArray;
@property (nonatomic, strong)NSMutableArray * moviesImagesSndArray;
@property (nonatomic, strong)NSMutableArray * booksImagesSndArray;

-(IBAction)popularButtonTapped:(id)sender;
-(IBAction)musicButtonTapped:(id)sender;
-(IBAction)moviesButtonTapped:(id)sender;
-(IBAction)booksButtonbTapped:(id)sender;
@end
