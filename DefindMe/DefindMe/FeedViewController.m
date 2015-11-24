
//
//  FeedViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 02/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//
#import "FeedViewController.h"
#import "SWRevealViewController.h"
#import "LeftMenuViewController.h"
#import "PostLeftTableViewCell.h"
#import "PostRightTableViewCell.h"
#import "PostViewController.h"
#import "PostService.h"
#import "MyProfileViewController.h"
#import "FeedPageIconIamge.h"
#import "ModelUser.h"
#import <QuartzCore/QuartzCore.h>
#import "PostSelectionViewController.h"
#import "UserRgistrationService.h"
#import "BookMarkAddWebservice.h"
#import "LoginService.h"
#import "AddToLikeService.h"
#import "DataSaved.h"
#import "feedPageData.h"
#import "FeedPageDataSavedService.h"
#import "DBManager.h"
//#import "UIImageView+WebCache.h"

@interface FeedViewController ()<SWRevealViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *cellSizes;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong)UIImageView * imageV;
@property (nonatomic, retain) UIView *leftBarButtonView ;
@property (nonatomic, strong)UIImage * imageF;
@property (nonatomic, assign)CGSize * imageSize;
@property (nonatomic, assign)CGFloat  imageWidth;
@property (nonatomic, assign)CGFloat  imageHeight;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong)UIImage * imageC;
@property (nonatomic)CGSize  rowsize;
@property (nonatomic, strong)DBManager * dbmanager;
@property (nonatomic, strong)NSMutableArray * mainDataArray;
@property (nonatomic, strong)NSMutableArray * userDataArray;
@property (nonatomic, strong)NSMutableArray * mediaDataArray;
@property (nonatomic, strong)NSString * strAudioUrl;
@property (nonatomic, assign) NSInteger tagV;
@property (nonatomic, assign) NSInteger tagBookMark;
@property (nonatomic, assign)BOOL play;
@property (nonatomic, strong)NSString * mediaId;
@property (nonatomic, assign)NSInteger indexValue;
@property (nonatomic, strong)NSMutableArray * musicPostDataArray;
@property (nonatomic, strong)NSMutableArray * musicMediaDataArray;
@property (nonatomic, strong)NSMutableArray * mediaIdArray;
@property (nonatomic, strong)NSMutableArray * mediaTitleArray;
@property (nonatomic, strong)NSMutableArray * mediaArtistArray;
@property (nonatomic, strong)NSMutableArray * dataArray;
//ImageIssue
@property (nonatomic, assign)BOOL updatebool;
@property (nonatomic, strong)NSMutableArray * leftArray;
@property (nonatomic, strong)NSMutableArray * rihttArray;
@end

@implementation FeedViewController
@synthesize arrowButton;
@synthesize discoverVedioArray;
@synthesize discoverMusicArray;
@synthesize imageV;
@synthesize imageSize;
@synthesize imageHeight;
@synthesize imageWidth;
@synthesize leftBarButtonView;
@synthesize rightTableview;
@synthesize leftTableView;
@synthesize tooltipTableView;
@synthesize tooltipArray;
@synthesize gestureView;
@synthesize userImageArray;
@synthesize userNameArray;
@synthesize contentArray;
@synthesize timeElapsedArray;
@synthesize artistNameArray;
@synthesize date;
@synthesize collectionName;
@synthesize idArray;
@synthesize idValArray;
@synthesize activityView;
@synthesize posterArray;
@synthesize releaseDate;
@synthesize postName;
@synthesize feedCollectionView;
@synthesize imageC;
@synthesize update;
@synthesize rowsize;
@synthesize audioPlayerF;
@synthesize audioPlayerS;
@synthesize strAudioUrl;
@synthesize left;
@synthesize right;
@synthesize play;
@synthesize tagV;
@synthesize tagBookMark;
@synthesize postIDArray;
@synthesize indexValue;
@synthesize mainDataArray;
@synthesize userDataArray;
@synthesize mediaDataArray;
@synthesize mediaIdArray;
@synthesize mediaTitleArray;
@synthesize dbmanager;
@synthesize dataArray;
@synthesize leftArray;
@synthesize rihttArray;
-(void)viewDidLoad{
    [super viewDidLoad];
    [self flushCache];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor grayColor]];
    navLabel.font = [UIFont fontWithName:@"Lato-Bold" size:20];
    navLabel.text = @"Feed";
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0.5f, 40, 25)];
    [self.backButton setImage:[UIImage imageNamed:@"row reorder.png"] forState:UIControlStateNormal];
    SWRevealViewController *revealController = [self revealViewController];
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    UIBarButtonItem *negativeSpacer1 = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil action:nil];
    negativeSpacer1.width = -9.5f;
    
    self.leftBarButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 58.5, 30)];
    [self.leftBarButtonView addSubview:self.backButton];
    [self.backButton addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.leftBarButtonView];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer1,leftBarButton, nil]];
       self.tooltipArray=[[NSMutableArray alloc]initWithObjects:@"Add to likes",@"Add to dislikes",@"Bookmark",@"Repost",@"Enjoy",@"Buy on iTunes",nil];
    [self.leftTableView registerNib:[UINib nibWithNibName:@"PostLeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"CEll"];
    //[self.feedCollectionView registerNib:[UINib nibWithNibName:@"FeedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    
     [self.rightTableview registerNib:[UINib nibWithNibName:@"PostRightTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    self.view.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.tooltipTableView.hidden=YES;
    self.gestureView.hidden=YES;
    self.play=YES;
    self.updatebool=YES;
     self.indexValue=10;
      [SDWebImageManager.sharedManager.imageDownloader setValue:@"DefindMe" forHTTPHeaderField:@"AppName"];
    SDWebImageManager.sharedManager.imageDownloader.executionOrder = SDWebImageDownloaderLIFOExecutionOrder;
     dataArray=[[DBManager manager] getallrecord];
    [self fetchedData];
      self.automaticallyAdjustsScrollViewInsets = NO;
        }
- (void)flushCache
{
    [SDWebImageManager.sharedManager.imageCache clearMemory];
    [SDWebImageManager.sharedManager.imageCache clearDisk];
}
    //[self.arrowButton addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside]
-(void)viewWillAppear:(BOOL)animated{
   [self.navigationController setNavigationBarHidden:NO animated:NO];
   
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:tooltipTableView]) {
        return 6;

    }
    if ([tableView isEqual:leftTableView]) {
        return [self.leftArray count];
    }
    else{
       return [rihttArray count];
    }
    
    
}
-(void)fetchedData{
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor grayColor];
    activityView.center=self.view.center;
    
    [activityView startAnimating];
    
    [self.view addSubview:activityView];
    activityView.hidesWhenStopped = YES;
    [activityView performSelector:@selector(stopAnimation) withObject:nil afterDelay:3.0];
    
    [PostService sharedInstance].strChangeStatus=@"feed";
    [PostService sharedInstance].indexValue=[NSString stringWithFormat: @"%ld", (long)self.indexValue];
    [[PostService sharedInstance] callForPostwithCompletionHandler:^(id result, BOOL isError, NSString *strMsg){
        NSLog(@"Result Dic :%@", result);
        if (isError) {
            //alertview
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else{
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                if (![result isKindOfClass:[NSNull class]]) {
                    //fetchhing copy......
                                    NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                    leftArray=[NSMutableArray array];
                    rihttArray=[NSMutableArray array];
                    
                                    NSLog(@"Result Dic :%@", resultDic);
                                    [[DBManager manager] deleteAllrecord];
                                    if (![[resultDic valueForKeyPath:@"Posts"] isKindOfClass:[NSNull class]]) {
                                           self.mainDataArray=[result objectForKey:@"Posts"];
                                        for (int i=0;i<[self.mainDataArray count];i++) {
                                            NSString * userName;
                                            NSString * userImage;
                                            NSString * artistName;
                                            NSString * posterName;
                                            NSString * posterUrl;
                                            NSString * postDate;
                                            NSString * comments;
                                            NSString * uid;
                                            NSString * pid;
                                            NSString * mid;
                                            NSString * mkind;
                                            NSString * audioUrl;
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"User"] objectForKey:@"name"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"User"] objectForKey:@"name"]isKindOfClass:[NSNull class]]) {
                                                userName =[[[self.mainDataArray objectAtIndex:i] objectForKey:@"User"] objectForKey:@"name"];
                                            }else{
                                                userName = @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"User"] objectForKey:@"avatar"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"User"] objectForKey:@"avatar"]isKindOfClass:[NSNull class]]) {
                                                userImage =[[[self.mainDataArray objectAtIndex:i] objectForKey:@"User"] objectForKey:@"avatar"];
                                            }else{
                                                userImage = @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"artistName"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"artistName"]isKindOfClass:[NSNull class]]) {
                                                artistName=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"artistName"];
                                            }
                                            else if ([[[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"volumeInfo"] objectForKey:@"Authors"] objectAtIndex:0]&& ![[[[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"volumeInfo"] objectForKey:@"Authors"] objectAtIndex:0]isKindOfClass:[NSNull class]]){
                                                artistName = [[[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"volumeInfo"] objectForKey:@"Authors"] objectAtIndex:0];
                                            }
                                            else{
                                                artistName = @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"trackName"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"trackName"]isKindOfClass:[NSNull class]]) {
                                                posterName=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"trackName"];
                                            }
                                           else if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"title"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"title"]isKindOfClass:[NSNull class]]) {
                                                posterName=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"title"];
                                            }
                                            else if ([[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"volumeInfo"] objectForKey:@"title"] && ![[[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"volumeInfo"] objectForKey:@"title"] isKindOfClass:[NSNull class]]){
                                                posterName = [[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"volumeInfo"] objectForKey:@"title"] ;
                                            }else{
                                                posterName = @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"artworkUrl100"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"artworkUrl100"]isKindOfClass:[NSNull class]]) {
                                                posterUrl=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"artworkUrl100"];
                                            }
                                            else if ([[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"posters"] objectForKey:@"original"]&& ![[[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"posters"] objectForKey:@"original"]isKindOfClass:[NSNull class]]){
                                                 posterUrl =[[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"posters"] objectForKey:@"original"];
                                                NSRange r1 = [posterUrl rangeOfString:@"movie"];
                                                NSString *substr = [posterUrl substringFromIndex:r1.location];
                                                   posterUrl=[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr];
                                                
                                            }
                                            else if ([[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"imageLinks"] objectForKey:@"large"]&& ![[[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"imageLinks"] objectForKey:@"large"]isKindOfClass:[NSNull class]]){
                                                posterUrl =[[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"imageLinks"] objectForKey:@"large"];                                     }
                                            else if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"photo"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"photo"]isKindOfClass:[NSNull class]]) {
                                                NSString * strurl=[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"photo"],@"_f"];
                                                posterUrl=strurl;
                                            }
                                            else{
                                                posterUrl = @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"postdate"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"postdate"]isKindOfClass:[NSNull class]]){
                                                postDate=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"postdate"];
                                                
                                            }
                                            else{
                                                postDate= @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"content"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"content"]isKindOfClass:[NSNull class]]){
                                                comments=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"content"];
                                                
                                            }
                                            else{
                                                comments= @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"id"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"id"]isKindOfClass:[NSNull class]]){
                                                pid=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"id"];
                                                
                                            }
                                            else{
                                                pid= @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"mid"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"mid"]isKindOfClass:[NSNull class]]){
                                               mid=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Post"]objectForKey:@"mid"];
                                                
                                            }
                                            else{
                                                mid= @"";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"kind"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"kind"]isKindOfClass:[NSNull class]]){
                                                mkind=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"kind"];
                                                
                                            }
                                            else{
                                                mkind= @"1";
                                            }
                                            if ([[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"previewUrl"]&& ![[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"previewUrl"]isKindOfClass:[NSNull class]]){
                                                audioUrl=[[[self.mainDataArray objectAtIndex:i] objectForKey:@"Media"]objectForKey:@"previewUrl"];
                                                
                                            }
                                            else{
                                                audioUrl= @"";
                                            }
                                            [[DBManager manager] insertdataWithUserName:userName UserImage:userImage ArtistName:artistName PosterName:posterName PosterImage:posterUrl PostDate:postDate Comments:comments UserId:uid PostId:pid MediaId:mid MediaKind:mkind AudioUrl:audioUrl];
                                        
                                            
                                        }
                                        dataArray=[[DBManager manager] getallrecord];
                                        [dataArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                                            if (idx%2==0)
                                            {
                                                [leftArray addObject:object];
                                            }
                                            else
                                            {
                                                [rihttArray addObject:object];
                                            }
                                        }];
                                        NSLog(@"*******%@",dataArray);
                                        self.leftTableView.delegate=self;
                                        self.leftTableView.dataSource=self;
                                        self.rightTableview.delegate=self;
                                        self.rightTableview.dataSource=self;
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            [self.leftTableView reloadData];
                                            [self.rightTableview reloadData];
                                        });
                                        
                                    
  
                                    }
                                    else{
                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Click on Arrow to add Data" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                        [alert show];
                                    }
                                }
                
            }
        }
    //finish..........
     
           
    }];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIdF = @"CEll";
    static NSString* cellIdS = @"CELL";
    static NSString* cellIdT = @"Cell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdT];
    PostLeftTableViewCell * cellF=[leftTableView dequeueReusableCellWithIdentifier:cellIdF];
    PostRightTableViewCell * cellS=[rightTableview dequeueReusableCellWithIdentifier:cellIdS];
        if ([tableView isEqual:leftTableView]) {
        if (cellF==nil) {
            cellF=[[PostLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdF];
            //cellF.vedioButton.tag=indexPath.row;
        }
    
            cellF.selectedBackgroundView.backgroundColor=[UIColor clearColor];
            if (![[self.leftArray objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                [cellF.postImage setContentMode:UIViewContentModeScaleToFill];
               cellF.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
                cellF.postImage.layer.masksToBounds = YES;
                cellF.settingButton.tag=indexPath.row;
                
      [cellF.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                cellF.selectionButton.tag=indexPath.row;
        [cellF.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        cellF.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
       // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
        cellF.profileButton.tag=indexPath.row;
        [cellF.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
        cellF.iconImage.layer.cornerRadius =17;
         cellF.iconImage.layer.masksToBounds=YES;
                cellF.posterTopConstraint.constant=30;
                cellF.iconButtonHieghtConstraint.constant=8;
                cellF.commentbuttom.constant=1;
                [cellF.vedioButton setHidden:YES];
                cellF.topView.hidden=NO;
                if (leftArray.count > indexPath.row) {
                FeedPageDataSavedService * feedlefdata=[leftArray objectAtIndex:indexPath.row];
                if (feedlefdata.name) {
                    cellF.userNameLabel.text=feedlefdata.name;
                }
                else{
                    cellF.userNameLabel.text=@"";
                }
                if (feedlefdata.strPostDate) {
                    cellF.timeLabel.text=feedlefdata.strPostDate;
                }
                else{
                    cellF.timeLabel.text=@"";
                }
                if (feedlefdata.strArtistName) {
                    cellF.artstName.text=feedlefdata.strArtistName;
                }
                else{
                    cellF.artstName.text=@"";
                }
                if (feedlefdata.strTitle) {
                    cellF.collectionNAME.text=feedlefdata.strTitle;
                }
                else{
                    cellF.collectionNAME.text=@"";
                }
                if (feedlefdata.media_Id) {
                    if (indexPath.row== tagBookMark) {
                        [BookMarkAddWebservice sharedInstance].mediaId=feedlefdata.media_Id;
                    }
                }
                if(feedlefdata.mediaKind){
                    if ([feedlefdata.mediaKind isEqual:@"song"]) {
                         [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
                       [BookMarkAddWebservice sharedInstance].mediaType=@"1";
                        [cellF.vedioButton setHidden:NO];
                        cellF.commentbuttom.constant=1;
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.commentLabelHeightConstraint.constant=1;
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,255)];
                        leftTableView.rowHeight=255;
                        cellF.commentbuttom.constant=5;
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.commentLabelHeightConstraint.constant=1;
                    }
                    if ([feedlefdata.mediaKind isEqual:@"Movie"]) {
                        [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
                        [cellF.vedioButton setHidden:YES];
                        self.leftTableView.rowHeight=307;
                        cellF.posterHeightConstraint.constant=210;
                        [BookMarkAddWebservice sharedInstance].mediaType=@"2";
                    }
                    if ([feedlefdata.mediaKind isEqual:@"books#volume"]) {
                         [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
                        [cellF.vedioButton setHidden:YES];
                        self.leftTableView.rowHeight=307;
                        [BookMarkAddWebservice sharedInstance].mediaType=@"3";
                    }
                    if ([feedlefdata.mediaKind isEqual:@"Photo"]) {
                         [cellF.contentView setFrame:CGRectMake(0, 0, 156,240)];
                        [cellF.vedioButton setHidden:YES];
                        self.leftTableView.rowHeight=240;
                        cellF.posterTopConstraint.constant=0;
                        cellF.iconButtonHieghtConstraint.constant=0;
                        cellF.posterHeightConstraint.constant=180;
                        cellF.commentbuttom.constant=1;
                        cellF.commentLabelHeightConstraint.constant=1;
                        [BookMarkAddWebservice sharedInstance].mediaType=@"1";
                    }
                }
                if (feedlefdata.strContent) {
                    if ([feedlefdata.mediaKind isEqualToString:@"song"]) {
                        NSString * str=feedlefdata.strContent;
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,270)];
                        cellF.contentLabel.text=[feedlefdata.strContent substringWithRange: NSMakeRange(0, [feedlefdata.strContent rangeOfString: @"<"].location)];
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cellF.commentLabelHeightConstraint.constant=17;
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.commentbuttom.constant=7;
                        cellF.lolevelTop.constant=0;
                        cellF.posterHeightConstraint.constant=155;
                        leftTableView.rowHeight=270;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            cellF.commentbuttom.constant=1;
                            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellF.commentLabelHeightConstraint.constant=1;
                            [cellF.contentView setFrame:CGRectMake(0, 0, 156,255)];
                            leftTableView.rowHeight=255;
                            cellF.commentbuttom.constant=5;
                            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellF.commentLabelHeightConstraint.constant=1;
                        }
                    }
                        if ([feedlefdata.mediaKind isEqualToString:@"Movie"]) {
                            NSString * str=feedlefdata.strContent;
                            [cellF.contentView setFrame:CGRectMake(0, 0, 156,320)];
                            cellF.contentLabel.text=[feedlefdata.strContent substringWithRange: NSMakeRange(0, [feedlefdata.strContent rangeOfString: @"<"].location)];
                            NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                             cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellF.commentbuttom.constant=5;
                            cellF.commentLabelHeightConstraint.constant=17;
                            cellF.lolevelTop.constant=0;
                            
                            leftTableView.rowHeight=320;
                            if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                                [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
                                cellF.commentbuttom.constant=2;
                                cellF.commentLabelHeightConstraint.constant=1;
                                leftTableView.rowHeight=307;
                                cellF.contentLabel.backgroundColor=[UIColor clearColor];
                            }

                        }

                    if ([feedlefdata.mediaKind isEqualToString:@"books#volume"]) {
                        NSString * str=feedlefdata.strContent;
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,320)];
                        cellF.contentLabel.text=[feedlefdata.strContent substringWithRange: NSMakeRange(0, [feedlefdata.strContent rangeOfString: @"<"].location)];
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.commentbuttom.constant=5;
                        cellF.commentLabelHeightConstraint.constant=17;
                        cellF.lolevelTop.constant=0;
                        leftTableView.rowHeight=320;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
                            cellF.commentbuttom.constant=2;
                            cellF.commentLabelHeightConstraint.constant=1;
                            leftTableView.rowHeight=307;
                            cellF.contentLabel.backgroundColor=[UIColor clearColor];
                        }

                    }
                    if ([feedlefdata.mediaKind isEqualToString:@"Photo"]) {
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,240)];
                        [cellF.vedioButton setHidden:YES];
                        self.leftTableView.rowHeight=240;
                        cellF.posterTopConstraint.constant=0;
                        cellF.iconButtonHieghtConstraint.constant=0;
                        cellF.posterHeightConstraint.constant=180;
                        cellF.commentbuttom.constant=1;
                        cellF.commentLabelHeightConstraint.constant=1;
                        
                    }
                }
                if (feedlefdata.avatar) {
                    NSString * strURL=[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",feedlefdata.avatar,@"_i"];
                    [cellF.iconImage setImageWithURL:[NSURL URLWithString:strURL] placeholderImage:[UIImage  imageNamed:@"profile-icon.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                     {
                         //[weakcell.actIndicator stopAnimating];
                         if(image)
                         {
                             [cellF.iconImage  setImage:image];
                         }
                         else
                         {
                             //[cell.imageView  setImage:[UIImage  imageNamed:@"icon_gnb_table.png"]];
                         }
                     }];

                    
                }
                if (feedlefdata.strposterURL) {
                    [cellF.postImage setImageWithURL:[NSURL URLWithString:feedlefdata.strposterURL] placeholderImage:[UIImage  imageNamed:@"profile-icon.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                     {
                         //[weakcell.actIndicator stopAnimating];
                         if(image)
                         {
                             [cellF.postImage setImage:image];
                         }
                         else
                         {
                             //[cell.imageView  setImage:[UIImage  imageNamed:@"icon_gnb_table.png"]];
                         }
                     }];
                    
  
                }
            }
            

            
                        //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
            
                left=YES;
                right=NO;
            //  }
            cellF.vedioButton.tag=indexPath.row;
        
            if ([audioPlayerF play]) {
            if (indexPath.row == tagV) {
                [cellF.vedioButton setBackgroundImage:[UIImage imageNamed:@"stop button"] forState:UIControlStateNormal];
                play=NO;
            }
            
            else{
                [cellF.vedioButton setSelected:NO];
                [cellF.vedioButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
            
                
            }
        }
            else{
                if (indexPath.row == tagV) {
                     [cellF.vedioButton setSelected:NO];
                    [cellF.vedioButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
                
                }
            }
        [cellF.vedioButton addTarget:self action:@selector(buttonPressedAction:) forControlEvents:UIControlEventTouchUpInside];
                        [cellF.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            //AudioPlaerPlay.....
            }
        return cellF;


}
    else if ([tableView isEqual:rightTableview]){
    if (cellS== nil) {
    cellS=[[PostRightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdS];
      // [cellS.profileButton setImage:[UIImage imageNamed:[userImageArray objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
       
    }
        cellS.upperContainerView.hidden=NO;
    cellS.selectedBackgroundView.backgroundColor=[UIColor clearColor];
        [cellS.postImage setContentMode:UIViewContentModeScaleToFill];
        cellS.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        cellS.postImage.clipsToBounds = YES;

        cellS.iconImage.layer.cornerRadius = 17;
        cellS.iconImage.layer.masksToBounds=YES;
        cellS.settingButton.tag=indexPath.row;
        cellS.selectionButton.tag=indexPath.row;
        [cellS.selectionButton addTarget:self action:@selector(rihtSelectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        if (![[self.rihttArray objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            cellS.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
            cellS.profileButton.tag=indexPath.row;
            [cellS.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
            [cellS.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
            cellS.posterTopConstraint.constant=30;
            cellF.iconButtonHieghtConstraint.constant=8;
            cellS.commentbuttom.constant=1;
            [cellS.vedioButton setHidden:YES];
            cellF.topView.hidden=NO;
            if (self.rihttArray.count > indexPath.row) {
               FeedPageDataSavedService * feedlefdata=[rihttArray objectAtIndex:indexPath.row];
            
            if (feedlefdata.name) {
                cellS.userNameLabel.text=feedlefdata.name;
            }
            else{
                cellS.userNameLabel.text=@"";
            }
            if (feedlefdata.strPostDate) {
                cellS.timeLabel.text=feedlefdata.strPostDate;
            }
            else{
                cellS.timeLabel.text=@"";
            }
            if (feedlefdata.strArtistName) {
                cellS.artstName.text=feedlefdata.strArtistName;
            }
            else{
                cellS.artstName.text=@"";
            }
            if (feedlefdata.strTitle) {
                cellS.collectionNAME.text=feedlefdata.strTitle;
            }
            else{
                cellS.collectionNAME.text=@"";
            }
            if (feedlefdata.media_Id) {
                if (indexPath.row== tagBookMark) {
                    [BookMarkAddWebservice sharedInstance].mediaId=feedlefdata.media_Id;
                }
            }
            if(feedlefdata.mediaKind){
                if ([feedlefdata.mediaKind isEqual:@"song"]) {
                     [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
                    [BookMarkAddWebservice sharedInstance].mediaType=@"1";
                    [cellS.vedioButton setHidden:NO];
                    cellS.commentbuttom.constant=1;
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.commentLabelHeightConstraint.constant=1;
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,255)];
                    rightTableview.rowHeight=255;
                    cellS.commentbuttom.constant=5;
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.commentLabelHeightConstraint.constant=1;
                }
                if ([feedlefdata.mediaKind isEqual:@"Movie"]) {
                    [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                    [cellS.vedioButton setHidden:YES];
                    self.rightTableview.rowHeight=307;
                    cellS.posterHeightConstraint.constant=210;
                    [BookMarkAddWebservice sharedInstance].mediaType=@"2";
                }
                if ([feedlefdata.mediaKind isEqual:@"books#volume"]) {
                    [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                    [cellS.vedioButton setHidden:YES];
                    self.rightTableview.rowHeight=307;
                    [BookMarkAddWebservice sharedInstance].mediaType=@"3";
                }
                if ([feedlefdata.mediaKind isEqual:@"Photo"]) {
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,240)];
                    [cellS.vedioButton setHidden:YES];
                    self.rightTableview.rowHeight=240;
                    cellS.posterTopConstraint.constant=0;
                    //cellS.iconButtonHieghtConstraint.constant=0;
                    cellS.posterHeightConstraint.constant=180;
                    cellS.commentbuttom.constant=1;
                    cellS.commentLabelHeightConstraint.constant=1;
                    [BookMarkAddWebservice sharedInstance].mediaType=@"1";
                }
            }
            if (feedlefdata.strContent) {
                if ([feedlefdata.mediaKind isEqualToString:@"song"]) {
                    NSString * str=feedlefdata.strContent;
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,270)];
                    cellS.contentLabel.text=[feedlefdata.strContent substringWithRange: NSMakeRange(0, [feedlefdata.strContent rangeOfString: @"<"].location)];
                    NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                    cellS.commentLabelHeightConstraint.constant=17;
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.commentbuttom.constant=7;
                    cellS.lolevelTop.constant=0;
                    cellS.posterHeightConstraint.constant=155;
                    rightTableview.rowHeight=270;
                    if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                        cellS.commentbuttom.constant=1;
                        cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellS.commentLabelHeightConstraint.constant=1;
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,255)];
                        rightTableview.rowHeight=255;
                        cellS.commentbuttom.constant=5;
                        cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellS.commentLabelHeightConstraint.constant=1;
                    }
                }
                if ([feedlefdata.mediaKind isEqualToString:@"Movie"]) {
                    NSString * str=feedlefdata.strContent;
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,320)];
                    cellS.contentLabel.text=[feedlefdata.strContent substringWithRange: NSMakeRange(0, [feedlefdata.strContent rangeOfString: @"<"].location)];
                    NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.commentbuttom.constant=5;
                    cellS.commentLabelHeightConstraint.constant=17;
                    cellS.lolevelTop.constant=0;
                    
                    rightTableview.rowHeight=320;
                    if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                        cellS.commentbuttom.constant=2;
                        cellS.commentLabelHeightConstraint.constant=1;
                        rightTableview.rowHeight=307;
                        cellS.contentLabel.backgroundColor=[UIColor clearColor];
                    }
                    
                }
                
                if ([feedlefdata.mediaKind isEqualToString:@"books#volume"]) {
                    NSString * str=feedlefdata.strContent;
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,320)];
                    cellS.contentLabel.text=[feedlefdata.strContent substringWithRange: NSMakeRange(0, [feedlefdata.strContent rangeOfString: @"<"].location)];
                    NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.commentbuttom.constant=5;
                    cellS.commentLabelHeightConstraint.constant=17;
                    cellS.lolevelTop.constant=0;
                   rightTableview.rowHeight=320;
                    if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                        cellS.commentbuttom.constant=2;
                        cellS.commentLabelHeightConstraint.constant=1;
                        rightTableview.rowHeight=307;
                        cellS.contentLabel.backgroundColor=[UIColor clearColor];
                    }
                    
                }
                if ([feedlefdata.mediaKind isEqualToString:@"Photo"]) {
                    cellS.commentbuttom.constant=0;
                    cellS.contentLabel.backgroundColor=[UIColor clearColor];
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,240)];
                    [cellS.vedioButton setHidden:YES];
                    self.rightTableview.rowHeight=240;
                    cellS.upperContainerHeightConstraint.constant=0;
                    cellS.posterTopConstraint.constant=0;
                    cellS.posterHeightConstraint.constant=183;
                    cellS.upperContainerView.hidden=YES;
                    cellS.upperContainerHeightConstraint.constant=0;
                    
                }
              

            }
            if (feedlefdata.avatar) {
                NSString * strURL=[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",feedlefdata.avatar,@"_i"];
                [cellS.iconImage setImageWithURL:[NSURL URLWithString:strURL] placeholderImage:[UIImage  imageNamed:@"profile-icon.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                 {
                     //[weakcell.actIndicator stopAnimating];
                     if(image)
                     {
                         [cellS.iconImage  setImage:image];
                     }
                     else
                     {
                         //[cell.imageView  setImage:[UIImage  imageNamed:@"icon_gnb_table.png"]];
                     }
                 }];
                
                
            }
            if (feedlefdata.strposterURL) {
                [cellS.postImage setImageWithURL:[NSURL URLWithString:feedlefdata.strposterURL] placeholderImage:[UIImage  imageNamed:@"profile-icon.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                 {
                     //[weakcell.actIndicator stopAnimating];
                     if(image)
                     {
                         [cellS.postImage setImage:image];
                     }
                     else
                     {
                         //[cell.imageView  setImage:[UIImage  imageNamed:@"icon_gnb_table.png"]];
                     }
                 }];
                
                
            }
        }

        left=NO;
        right=YES;
        cellS.vedioButton.tag=indexPath.row;
        
        if ([audioPlayerS play]) {
            if (indexPath.row == tagV) {
                [cellS.vedioButton setBackgroundImage:[UIImage imageNamed:@"stop button"] forState:UIControlStateNormal];
                play=NO;
            }
            
            else{
                [cellS.vedioButton setSelected:NO];
                [cellS.vedioButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
                
                
            }
        }
        else{
            if (indexPath.row == tagV) {
                [cellS.vedioButton setSelected:NO];
                [cellS.vedioButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
                
            }
        }
        [cellS.vedioButton addTarget:self action:@selector(musicPlayButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
       // [cellS.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        //Audi
        }
    return cellS;
    }
    
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
    cell.textLabel.textColor=[UIColor grayColor];
    cell.textLabel.text=[tooltipArray objectAtIndex:indexPath.row];
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap) ];
    [self.gestureView addGestureRecognizer:singleFingerTap];
        return cell;
    

    
    
}

-(void)settingsButtonTapped:(UIButton *)sender{
    tagBookMark=sender.tag;
    [self.audioPlayerF stop];
    [self.audioPlayerS stop];
    if(left){
        
        FeedPageDataSavedService * feedleftData=[self.leftArray objectAtIndex:sender.tag];
        if (feedleftData.media_Id) {
            
                [BookMarkAddWebservice sharedInstance].mediaId=feedleftData.media_Id;
            
        }
        if ([feedleftData.mediaKind isEqualToString:@"song"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"1";
        }
        if ([feedleftData.mediaKind isEqualToString:@"Movie"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"2";
        }
        if ([feedleftData.mediaKind isEqualToString:@"books#volume"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"3";
        }
        if ([feedleftData.mediaKind isEqualToString:@"Photo"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"1";
        }
    }
    if(right){
        
        FeedPageDataSavedService * feedleftData=[self.rihttArray objectAtIndex:sender.tag];
        if (feedleftData.media_Id) {
            
            [BookMarkAddWebservice sharedInstance].mediaId=feedleftData.media_Id;
            
        }
        if ([feedleftData.mediaKind isEqualToString:@"song"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"1";
        }
        if ([feedleftData.mediaKind isEqualToString:@"Movie"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"2";
        }
        if ([feedleftData.mediaKind isEqualToString:@"books#volume"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"3";
        }
        if ([feedleftData.mediaKind isEqualToString:@"Photo"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"1";
        }
    }

    self.tooltipTableView.hidden=NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tooltipTableView reloadData];
        
    });

    self.gestureView.hidden=NO;
    
}
-(void)buttonPressedAction:(UIButton *)sender{
                 if (![[self.leftArray objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
                     FeedPageDataSavedService * feedData=[self.leftArray objectAtIndex:sender.tag];
                self.strAudioUrl= feedData.strmpthriURL;
                NSString* resourcePath = strAudioUrl;
                NSData *_objectData = [NSData dataWithContentsOfURL:[NSURL URLWithString:resourcePath]];
                NSError *error;
                audioPlayerF = [[AVAudioPlayer alloc] initWithData:_objectData error:&error];
                audioPlayerF.numberOfLoops = 1;
                
                if (audioPlayerF == nil){
                    NSLog([error description]);
                    [sender setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
                }
                else{
                    
                    if (play) {
                        [audioPlayerF play];
                        [sender setBackgroundImage:[UIImage imageNamed:@"stop button"] forState:UIControlStateNormal];
                        tagV=sender.tag;
                        play=NO;
                        
                    }
                    else{
                        audioPlayerF=nil;
                        [sender setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
                        play=YES;
                    }
                    
                }
                
            }
        
    
    
}

-(void)musicPlayButtonTapped:(UIButton *)sender{
   
    if (![[self.rihttArray objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
        FeedPageDataSavedService * feedData=[self.rihttArray objectAtIndex:sender.tag];
        self.strAudioUrl=feedData.strmpthriURL;
        NSString* resourcePath = strAudioUrl;
        NSData *_objectData = [NSData dataWithContentsOfURL:[NSURL URLWithString:resourcePath]];
        NSError *error;
        audioPlayerS = [[AVAudioPlayer alloc] initWithData:_objectData error:&error];
        audioPlayerS.numberOfLoops = 1;
        if (audioPlayerS == nil)
            NSLog([error description]);
        
        else{
            if (play) {
                [audioPlayerS play];
                tagV=sender.tag;
                play=NO;
                [sender setBackgroundImage:[UIImage imageNamed:@"stop button"] forState:UIControlStateNormal];
            }
            else{
                audioPlayerS=nil;
                play=YES;
                [sender setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
            }
        }
    }
}
-(void)selectionButtonTapped:(UIButton *)sender{
    [self.audioPlayerF stop];
    [self.audioPlayerS stop];
        FeedPageDataSavedService * feedlefdata=[leftArray objectAtIndex:sender.tag];
    
         [DataSaved sharedInstance].strArtist=feedlefdata.strArtistName;
         [DataSaved sharedInstance].strTitle=feedlefdata.strTitle;
         [DataSaved sharedInstance].strName=feedlefdata.name;
         [DataSaved sharedInstance].strTime=feedlefdata.strPostDate;
         [DataSaved sharedInstance].strProfileImage=feedlefdata.avatar;
         [DataSaved sharedInstance].strPoster=feedlefdata.strposterURL;
         [DataSaved sharedInstance].strAudioUrl=feedlefdata.strmpthriURL;
         [DataSaved sharedInstance].strPostId=feedlefdata.post_Id;
         [DataSaved sharedInstance].strItemUserId=[LoginService sharedInstance].uId;
         [DataSaved sharedInstance].strMediaId=feedlefdata.media_Id;
         [DataSaved sharedInstance].strItemId=feedlefdata.strid;
     if ([feedlefdata.mediaKind isEqualToString:@"song"]) {
          [DataSaved sharedInstance].strmediaType=@"1";
     }
    if ([feedlefdata.mediaKind isEqualToString:@"Movie"]) {
        [DataSaved sharedInstance].strmediaType=@"2";
    }
    if ([feedlefdata.mediaKind isEqualToString:@"books#volume"]) {
        [DataSaved sharedInstance].strmediaType=@"3";
    }
    if ([feedlefdata.mediaKind isEqualToString:@"Photo"]) {
         [DataSaved sharedInstance].strmediaType=@"1";
    }
      PostSelectionViewController * selectionVC=[[PostSelectionViewController alloc]initWithNibName:@"PostSelectionViewController" bundle:nil];
    [self.navigationController pushViewController:selectionVC animated:NO];
}
-(void)rihtSelectionButtonTapped:(UIButton *)sender{
    [self.audioPlayerF stop];
    [self.audioPlayerS stop];
    FeedPageDataSavedService * feedlefdata=[rihttArray objectAtIndex:sender.tag];
    [DataSaved sharedInstance].strArtist=feedlefdata.strArtistName;
    [DataSaved sharedInstance].strTitle=feedlefdata.strTitle;
    [DataSaved sharedInstance].strName=feedlefdata.name;
    [DataSaved sharedInstance].strTime=feedlefdata.strPostDate;
    [DataSaved sharedInstance].strProfileImage=feedlefdata.avatar;
    [DataSaved sharedInstance].strPoster=feedlefdata.strposterURL;
    [DataSaved sharedInstance].strAudioUrl=feedlefdata.strmpthriURL;
    [DataSaved sharedInstance].strPostId=feedlefdata.post_Id;
    [DataSaved sharedInstance].strItemUserId=[LoginService sharedInstance].uId;
    [DataSaved sharedInstance].strMediaId=feedlefdata.media_Id;
    [DataSaved sharedInstance].strItemId=feedlefdata.strid;
    if ([feedlefdata.mediaKind isEqualToString:@"song"]) {
        [DataSaved sharedInstance].strmediaType=@"1";
    }
    if ([feedlefdata.mediaKind isEqualToString:@"Movie"]) {
        [DataSaved sharedInstance].strmediaType=@"2";
    }
    if ([feedlefdata.mediaKind isEqualToString:@"books#volume"]) {
        [DataSaved sharedInstance].strmediaType=@"3";
    }
    if ([feedlefdata.mediaKind isEqualToString:@"Photo"]) {
        [DataSaved sharedInstance].strmediaType=@"1";
    }
    PostSelectionViewController * selectionVC=[[PostSelectionViewController alloc]initWithNibName:@"PostSelectionViewController" bundle:nil];
    [self.navigationController pushViewController:selectionVC animated:NO];

}

-(void)stopAnimation{
    [activityView stopAnimating];
}

-(void)handleSingleTap{
    self.gestureView.hidden=YES;
    self.tooltipTableView.hidden=YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:tooltipTableView]) {

        NSLog(@"%@",[BookMarkAddWebservice sharedInstance].mediaType);
        NSLog(@"%@",[BookMarkAddWebservice sharedInstance].mediaId);
        if (indexPath.row==2) {
            [[BookMarkAddWebservice sharedInstance] bookMarkPostswithMedia_Type:[BookMarkAddWebservice sharedInstance].mediaType withMediaId:[BookMarkAddWebservice sharedInstance].mediaId withUserId:[LoginService sharedInstance].uId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
                
             {
                 NSLog(@"Result Dic :%@", result);
                 
                 
                 if (isError) {
                     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                     [alert show];
                 }
                 else{
                     if ([result isKindOfClass:[ModelUser class]]) {
                                             }else{
                         //Create Alert for error
                     }
                 }
                 
             }];
        
        /*if ([cell.textLabel.text isEqualToString:@"Bookmark"]) {
         
        }*/
        
         self.tooltipTableView.hidden=YES;
        }
        if (indexPath.row==0) {
            [[AddToLikeService sharedInstance] addToLikePostswithMedia_Type:[BookMarkAddWebservice sharedInstance].mediaType withMediaId:[BookMarkAddWebservice sharedInstance].mediaId withUserId:[LoginService sharedInstance].uId withRatings:@"1" withPUID:@"4" withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
                if (isError) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                    [alert show];
                }
                else{
                    if ([result isKindOfClass:[ModelUser class]]) {
                    }else{
                        //Create Alert for error
                    }
                }
            }];
        }
        }
        
        }
-(void)settingButtonTapped:(UIButton *)sender{
    self.gestureView.hidden=NO;
    self.tooltipTableView.hidden=NO;
}
-(IBAction)profileButtonTapped:(id)sender{
    MyProfileViewController * profileVC=[[MyProfileViewController alloc]initWithNibName:@"MyProfileViewController" bundle:nil];
    /*if (left) {
        NSString * strImageName=[self.imagemult1 objectAtIndex:button.tag];
        profileVC.strImage=strImageName;
        
    }
    if (right) {
        NSString * strImageName=[self.imagemult2 objectAtIndex:button.tag];
        profileVC.strImage=strImageName;
    }*/
    profileVC.strUID=[LoginService sharedInstance].uId;
    
    [self.navigationController pushViewController:profileVC animated:NO];
}
-(IBAction)arrowButtonTapped:(id)sender{
    [self.audioPlayerF stop];
    [self.audioPlayerS stop];
    PostViewController * postVc=[[PostViewController alloc]initWithNibName:@"PostViewController" bundle:nil];
    [self.navigationController pushViewController:postVc animated:NO];
}
-(void)addToLikeButtonTap:(id)sender{
    
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    NSInteger currentOffset = scrollView.contentOffset.y;
    NSInteger maximumOffset = scrollView.contentSize.height- scrollView.frame.size.height;
    if (maximumOffset - currentOffset <= 0) {
        indexValue=indexValue+10;
        [self fetchedData];
            }
    if (currentOffset<=0) {
         indexValue=10;
         NSLog(@"%@",@"#####");
    }
  
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UITableView *slaveTable = nil;
    
    if (self.leftTableView == scrollView) {
        slaveTable = self.rightTableview;
    } else if (self.rightTableview == scrollView) {
        slaveTable = self.leftTableView;
    }
  
    [slaveTable setContentOffset:scrollView.contentOffset];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
