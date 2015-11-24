//
//  FeedViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 02/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "UIImageView+WebCache.h"
@interface FeedViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,AVAudioPlayerDelegate,UIScrollViewDelegate,SDWebImageManagerDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *feedCollectionView;
@property (strong, nonatomic) IBOutlet UIButton * arrowButton;
@property(nonatomic,strong)NSMutableArray * discoverMusicArray;
@property(nonatomic,strong)NSMutableArray * discoverVedioArray;
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
@property(nonatomic,strong)NSMutableArray * postIDArray;
@property(nonatomic,strong)NSMutableArray * itemIDArray;

//@property(nonatomic,strong)NSString * artistName;
@property (nonatomic, strong)NSString * update;
@property(nonatomic,strong)NSString * collectionName;
@property(nonatomic,strong)NSString * date;
@property (strong, nonatomic) IBOutlet UITableView * leftTableView;
@property (strong, nonatomic) IBOutlet UITableView * rightTableview;
@property (strong, nonatomic) IBOutlet UITableView * tooltipTableView;
@property (strong, nonatomic) IBOutlet UIView * gestureView;
@property (nonatomic, strong)AVAudioPlayer * audioPlayerF;
@property (nonatomic, strong)AVAudioPlayer * audioPlayerS;
@property (nonatomic, assign)BOOL left;
@property (nonatomic, assign)BOOL right;
@property (nonatomic, strong)NSString * mediaType;
@property (nonatomic, strong)NSString * nwFeed;
@property (nonatomic, copy) void (^completionHandler)(void);
-(IBAction)arrowButtonTapped:(id)sender;
-(void)buttonPressedAction:(UIButton *)sender;
@end
