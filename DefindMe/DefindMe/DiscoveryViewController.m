//
//  DiscoveryViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "SWRevealViewController.h"
#import "MyProfileViewController.h"
#import "PostRightTableViewCell.h"
#import "PostLeftTableViewCell.h"
#import "PostSelectionViewController.h"
#import "PostService.h"
#import "DiscoveryDetailsService.h"
#import "DiscoveryMusicService.h"
#import "DiscoveryBooksServices.h"
#import "DiscoveryMoviesServices.h"
#import "FeedViewController.h"
#import "AddToLikeService.h"
#import "BookMarkAddWebservice.h"
#import "LoginService.h"
#import "ModelUser.h"
#import "DataSaved.h"
@interface DiscoveryViewController ()
@property (nonatomic, strong) NSMutableArray *cellSizes;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, retain) UIView *leftBarButtonView ;
@property (nonatomic, strong)NSMutableArray * imagemult1;
@property (nonatomic, strong)NSMutableArray * imagemult2;
@property (nonatomic, strong)NSMutableArray * postermult1;
@property (nonatomic, strong)NSMutableArray * postermult2;
@property (nonatomic, strong)NSMutableArray * namemult1;
@property (nonatomic, strong)NSMutableArray * namemult2;
@property (nonatomic, strong)NSMutableArray * postNamemult1;
@property (nonatomic, strong)NSMutableArray * postNamemult2;
@property (nonatomic, strong)NSMutableArray * rlsDatemult1;
@property (nonatomic, strong)NSMutableArray * rlsDatemult2;
@property (nonatomic, strong)NSMutableArray * timeElapsedmult1;
@property (nonatomic, strong)NSMutableArray * timeElapsedmult2;
@property (nonatomic, strong)NSMutableArray * commentsmult1;
@property (nonatomic, strong)NSMutableArray * commentsmult2;
@property (nonatomic, strong)NSMutableArray * artistNamemult1;
@property (nonatomic, strong)NSMutableArray * artistNamemult2;
@property (nonatomic, strong)NSMutableArray * mediaKindmult1;
@property (nonatomic, strong)NSMutableArray * mediaKindmult2;
@property (nonatomic, assign)NSInteger commentTag;
@property (nonatomic, assign)NSInteger commentTags;
@property (nonatomic, strong)NSMutableArray * strURLArray;
@property (nonatomic, strong)NSMutableArray * strURLArraymult1;
@property (nonatomic, strong)NSMutableArray * strURLArraymult2;
@property (nonatomic, strong)NSString * strAudioUrl;
@property (nonatomic, assign)BOOL play;
@property (nonatomic, assign)BOOL papularbool;
@property (nonatomic, assign)BOOL musicbool;
@property (nonatomic, assign)BOOL moviesbool;
@property (nonatomic, assign)BOOL booksbool;
@property (nonatomic, strong)NSMutableArray * musicPostmult1;
@property (nonatomic, strong)NSMutableArray * musicPostmult2;
@property (nonatomic, strong)NSMutableArray * moviesPostmult1;
@property (nonatomic, strong)NSMutableArray * moviesPostmult2;
@property (nonatomic, strong)NSMutableArray * booksPostmult1;
@property (nonatomic, strong)NSMutableArray * booksPostmult2;
@property (nonatomic, assign) NSInteger tagV;
@property (nonatomic, assign)NSInteger  profileTagValue;
@property (nonatomic, strong)NSMutableArray * posterCopyMult1;
@property (nonatomic, assign)NSInteger papularindexValue;
@property (nonatomic,assign)NSInteger musicindexValue;
@property (nonatomic, assign)NSInteger moviesindexValue;
@property (nonatomic, assign)NSInteger booksindexValue;
@end

@implementation DiscoveryViewController
@synthesize discoverMusicArray;
@synthesize discoverVedioArray;
@synthesize leftTableView;
@synthesize rightTableview;
@synthesize optionButtonContainer;
@synthesize musicButton;
@synthesize moviesButton;
@synthesize booksButton;
@synthesize popularButton;
@synthesize musicView;
@synthesize movieView;
@synthesize booksView;
@synthesize popularView;
@synthesize imagemult1;
@synthesize imagemult2;
@synthesize namemult1;
@synthesize namemult2;
@synthesize artistNamemult1;
@synthesize artistNamemult2;
@synthesize postermult1;
@synthesize postermult2;
@synthesize postNamemult1;
@synthesize postNamemult2;
@synthesize timeElapsedmult1;
@synthesize timeElapsedmult2;
@synthesize commentsmult1;
@synthesize commentsmult2;
@synthesize rlsDatemult1;
@synthesize rlsDatemult2;
@synthesize mediaKind;
@synthesize mediaKindmult1;
@synthesize mediaKindmult2;
@synthesize commentTag;
@synthesize commentTags;
@synthesize audioPlayerF;
@synthesize audioPlayerS; 
@synthesize strURLArray;
@synthesize strURLArraymult1;
@synthesize strURLArraymult2;
@synthesize strAudioUrl;
@synthesize left;
@synthesize right;
@synthesize play;
@synthesize idArray;
@synthesize userImageArray;
@synthesize userNameArray;
@synthesize posterArray;
@synthesize postName;
@synthesize releaseDate;
@synthesize artistNameArray;
@synthesize contentArray;
@synthesize timeElapsedArray;
@synthesize activityView;
@synthesize postsArray;
@synthesize postsmult1;
@synthesize postsmult2;
@synthesize moviesbool;
@synthesize musicbool;
@synthesize booksbool;
@synthesize papularbool;
@synthesize musicPostmult1;
@synthesize musicPostmult2;
@synthesize moviesPostmult1;
@synthesize moviesPostmult2;
@synthesize booksPostmult1;
@synthesize booksPostmult2;
@synthesize tagV;
@synthesize tooltipTableView;
@synthesize gestureView;
@synthesize tooltipArray;
@synthesize SelectedUserId;
@synthesize strUserName;
@synthesize profileTagValue;
@synthesize posterCopyMult1;
@synthesize popularImagesFstArray;
@synthesize popularImagesSndArray;
@synthesize musicImagesFstArray;
@synthesize musicImagesSndArray;
@synthesize moviesImagesFstArray;
@synthesize moviesImagesSndArray;
@synthesize booksImagesFstArray;
@synthesize booksImagesSndArray;
@synthesize papularindexValue;
@synthesize booksindexValue;
@synthesize musicindexValue;
@synthesize moviesindexValue;
- (void)viewDidLoad {
    [super viewDidLoad];
   [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor grayColor]];
    navLabel.font = [UIFont fontWithName:@"Lato-Bold" size:20];
    navLabel.text = @"Discovery";
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0.5f, 40, 25)];
    [self.backButton setImage:[UIImage imageNamed:@"arrow-1"] forState:UIControlStateNormal];
    SWRevealViewController *revealController = [self revealViewController];
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    UIBarButtonItem *negativeSpacer1 = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil action:nil];
    negativeSpacer1.width = -9.5f;
    
    self.leftBarButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 58.5, 30)];
    [self.leftBarButtonView addSubview:self.backButton];
    [self.backButton addTarget:self action:@selector(pushFeed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.leftBarButtonView];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer1,leftBarButton, nil]];
    UIView *viewWithButtons = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 25)];

    //Button customiztaion
     UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0 , 0.5f, 20, 25)];
    [rightButton setImage:[UIImage imageNamed:@"search icon"] forState:UIControlStateNormal];
    //Button customiztaion
    [viewWithButtons addSubview:rightButton];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:viewWithButtons];

    //[self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer1,rightBarButton, nil]];
    discoverMusicArray =[[NSMutableArray alloc]initWithObjects:@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 2.png",@"group 4.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 2.png",@"group 4.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 2.png",@"group 4.png",nil];
    discoverVedioArray =[[NSMutableArray alloc]initWithObjects:@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 2.png",@"group 4.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 2.png",@"group 4.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 2.png",@"group 4.png",nil];
    self.tooltipArray=[[NSMutableArray alloc]initWithObjects:@"Add to likes",@"Add to dislikes",@"Bookmark",@"Repost",@"Enjoy",@"Buy on iTunes",nil];
    self.tooltipTableView.hidden=YES;
    self.gestureView.hidden=YES;
    //Arrays initialization
       [self.leftTableView registerNib:[UINib nibWithNibName:@"PostLeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"CEll"];
    
    [self.rightTableview registerNib:[UINib nibWithNibName:@"PostRightTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    self.view.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    [self.popularButton setTitle:@"Popular" forState:UIControlStateNormal];
    [self.musicButton setTitle:@"Music" forState:UIControlStateNormal];
    [self.moviesButton setTitle:@"Movies" forState:UIControlStateNormal];
    [self.booksButton setTitle:@"Books" forState:UIControlStateNormal];
    [self.popularButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
   [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    self.popularView.backgroundColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f) blue:(241/255.f) alpha:1.0f];
    self.musicView.backgroundColor=[UIColor colorWithRed:(125/255.f) green:(128/255.f) blue:(145/255.f) alpha:1.0f];
    self.movieView.backgroundColor=[UIColor colorWithRed:(125/255.f) green:(128/255.f) blue:(145/255.f) alpha:1.0f];
    self.booksView.backgroundColor=[UIColor colorWithRed:(125/255.f) green:(128/255.f) blue:(145/255.f) alpha:1.0f];
    self.popularButton.titleLabel.textColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f) blue:(241/255.f) alpha:1.0f];
    self.papularindexValue=10;
    self.musicindexValue=10;
    self.moviesindexValue=10;
    self.booksindexValue=10;
        [self popularButtonTapped:self.popularButton];
    self.left=NO;
    self.right=NO;
        // Do any additional setup after loading the view from its nib.
}
-(void)pushFeed{
    FeedViewController * feedVC=[[FeedViewController alloc]initWithNibName:@"FeedViewController" bundle:nil];
    [self.navigationController pushViewController:feedVC animated:NO];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];

   // [self updateLayoutForOrientation:[UIApplication sharedApplication].statusBarOrientation];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (papularbool) {
    if ([tableView isEqual:leftTableView]) {
        return [postsmult1 count];
    }
    else{
        return [postsmult2 count];
    }
    }
    if (moviesbool) {
        if ([tableView isEqual:leftTableView]) {
            return [moviesPostmult1 count];
        }
        else{
            return [moviesPostmult2 count];
        }
    }
    if (musicbool) {
        if ([tableView isEqual:leftTableView]) {
            return [musicPostmult1 count];
        }
        else{
            return [musicPostmult2 count];
        }
    }
    else{
        if ([tableView isEqual:leftTableView]) {
            return [booksPostmult1 count];
        }
        else{
            return [booksPostmult2 count];
        }
    }
    if ([tableView isEqual:tooltipTableView]) {
        return [tooltipArray count];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PostLeftTableViewCell * cellF= [tableView dequeueReusableCellWithIdentifier:@"CEll"];
    PostRightTableViewCell * cellS=[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    static NSString* cellIdT = @"Cell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdT];
    
    if ([tableView isEqual:leftTableView]) {
        
        if (!cellF) {
            cellF=[[PostLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CEll"];
        }
        //papular*********************
        __weak typeof(cellF) weakcellF = cellF;

        if (papularbool) {
            if ([postsmult1 count]>indexPath.row) {
            if (![[postsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                [cellF.postImage setContentMode:UIViewContentModeScaleToFill];
                cellF.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
                cellF.postImage.layer.masksToBounds = YES;
                [cellF.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                cellF.selectionButton.tag=indexPath.row;
                [cellF.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                cellF.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
                // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
                  //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                cellF.iconImage.layer.cornerRadius =17;
                cellF.iconImage.layer.masksToBounds=YES;
                if (![[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
                cellF.userNameLabel.text=[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"];
                }
               
                cellF.timeLabel.text=[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"];
               
               
            }
            }
            //cellF.iconImage.image=[UIImage imageWithData:[imageContainer objectAtIndex:indexPath.row]];
            if (postsmult1.count > indexPath.row) {
            if (![[self.postsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                if ([[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"]) {
                    cellF.artstName.text=[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"artistName"];
                    cellF.collectionNAME.text=[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"trackName"];
                    NSScanner *scanner = [NSScanner scannerWithString:[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"releaseDate"]];
                    NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                    NSString * result;
                    [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                    cellF.releaseDateLabel.text=result;
                    cellF.commentbuttom.constant=1;
                    //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                    if (indexPath.row == profileTagValue) {
                        self.SelectedUserId=[[[self.postermult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"];
                    }
                         if (![[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"] isKindOfClass:[NSNull class]]) {
                             [weakcellF.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"profile-icon.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellF.iconImage  setImage:image];
                                 }
                                
                             }];
                        }
                       
                        if (self.postsmult1.count > indexPath.row) {
                            if (![[self.postsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                                 [weakcellF.postImage setImageWithURL:[NSURL URLWithString:[[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                 {
                                     if(image)
                                     {
                                         [weakcellF.postImage  setImage:image];
                                     }
                                     else
                                     {
                                         [weakcellF.postImage  setImage:[UIImage  imageNamed:@"pic 1.png"]];
                                     }
                                     
                                 }];

                                
                            }
                            
                        }
                        
                    [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
                      [cellF.vedioButton setHidden:NO];
                    if (![[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]isKindOfClass:[NSNull class]]) {
                        NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                        UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                        
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,270)];
                        cellF.contentLabel.text=[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cView.tag=indexPath.row;
                        
                        cellF.commentLabelHeightConstraint.constant=17;
                        
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.commentbuttom.constant=7;
                        cellF.lolevelTop.constant=0;
                        cellF.posterHeightConstraint.constant=155;
                        leftTableView.rowHeight=270;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            commentTags=indexPath.row;
                            cView.backgroundColor=[UIColor clearColor];
                            cellF.commentbuttom.constant=1;
                            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellF.commentLabelHeightConstraint.constant=1;
                            [cellF.contentView setFrame:CGRectMake(0, 0, 156,255)];
                            [cView removeFromSuperview];
                            leftTableView.rowHeight=255;
                            cellF.commentbuttom.constant=5;
                            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellF.commentLabelHeightConstraint.constant=1;
                            
                        }
                    }
                }
                if ([[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"2"]) {
                    if (![[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"] isKindOfClass:[NSNull class]]) {
                        //cellF.artstName.text=[[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"]objectAtIndex:0]objectForKey:@"name"];
                        cellF.collectionNAME.text=[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];
                        NSScanner *scanner = [NSScanner scannerWithString:[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"]];
                        NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                        NSString * result;
                        [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                        cellF.releaseDateLabel.text=result;
                        
                              if (![[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"]isKindOfClass:[NSNull class]]) {
                                [weakcellF.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"profile-icon.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                 {
                                     if(image)
                                     {
                                         [weakcellF.iconImage  setImage:image];
                                     }
                                     
                                 }];

                            }
                        
                            if (postsmult1.count > indexPath.row) {
                                NSDictionary * postersDict=[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"];
   
                                                       if ([[postersDict valueForKey:@"posters" ] isKindOfClass:[NSDictionary class]]) {
                                NSString * movieStr=[[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
                                NSRange r1 = [movieStr rangeOfString:@"movie"];
                                NSString *substr = [movieStr substringFromIndex:r1.location];
                                [weakcellF.postImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                                            {
                                                                if(image)
                                                                {
                                                                    [weakcellF.postImage  setImage:image];
                                                                }
                                                                else
                                                                {
                                                                    [weakcellF.postImage  setImage:[UIImage  imageNamed:@"pic 1.png"]];
                                                                }
                                                                
                                                            }];
                                                           

                            }
                            else{
                                NSString * movieStr=[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"];
                                NSRange r1 = [movieStr rangeOfString:@"movie"];
                                NSString *substr = [movieStr substringFromIndex:r1.location];
                                
                                [weakcellF.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                 {
                                     if(image)
                                     {
                                         [weakcellF.postImage  setImage:image];
                                     }
                                     else
                                     {
                                         [weakcellF.postImage  setImage:[UIImage  imageNamed:@"pic 1.png"]];
                                     }
                                     
                                 }];
                                
                               
                            }
                            }
                            
                        [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,270)];
                        [cellF.vedioButton setHidden:YES];
                        self.leftTableView.rowHeight=270;
                        cellF.posterHeightConstraint.constant=173;
                        if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                            NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                             [cellF.contentView setFrame:CGRectMake(0, 0, 156,290)];
                            cellF.contentLabel.text=[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellF.commentbuttom.constant=5;
                            cellF.commentLabelHeightConstraint.constant=17;
                            cellF.lolevelTop.constant=0;
                            leftTableView.rowHeight=290;
                            if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                                commentTags=indexPath.row;
                                [cellF.contentView setFrame:CGRectMake(0, 0, 156,267)];
                                cellF.commentbuttom.constant=0;
                                cellF.commentLabelHeightConstraint.constant=0;
                                leftTableView.rowHeight=267;
                                cellF.contentLabel.backgroundColor=[UIColor clearColor];
                            }
                        }
                    }
                }
                if ([[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"3"] ) {
                    cellF.artstName.text=[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"authors"];
                    cellF.collectionNAME.text=[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];
                    
                    if (![[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"] isKindOfClass:[NSNull class]]) {
                            [weakcellF.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"profile-icon.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellF.iconImage  setImage:image];
                                 }
                                 
                             }];

                        }
                          if (self.postsmult1.count > indexPath.row) {
                            if (![[self.postsmult1 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                                NSURL *urlO;
                                if (![[NSURL URLWithString:[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]] isKindOfClass:[NSNull class]]) {
                                      [weakcellF.postImage setImageWithURL:[NSURL URLWithString:[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                     {
                                         if(image)
                                         {
                                             [weakcellF.postImage  setImage:image];
                                         }
                                         
                                     }];
                                }
                                else{
                                    
                                    [weakcellF.postImage setImageWithURL:[NSURL URLWithString:[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"thumbnail"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                     {
                                         if(image)
                                         {
                                             [weakcellF.postImage  setImage:image];
                                         }
                                         
                                     }];
                                }
                                
                                                        }
                      
                        
                    [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
                    [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
                    self.leftTableView.rowHeight=307;
                    cellF.posterHeightConstraint.constant=210;
                    [cellF.vedioButton setHidden:YES];
                    cellF.mediaType=@"Book";
                    if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                        NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                        UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                        
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,320)];
                        cellF.contentLabel.text=[[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.postsmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cView.tag=indexPath.row;
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.commentbuttom.constant=5;
                        cellF.commentLabelHeightConstraint.constant=17;
                        cellF.lolevelTop.constant=0;
                        leftTableView.rowHeight=320;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            commentTags=indexPath.row;
                            [cellF.contentView setFrame:CGRectMake(0, 0, 156,305)];
                            cellF.commentbuttom.constant=2;
                            cellF.commentLabelHeightConstraint.constant=1;
                            leftTableView.rowHeight=305;
                            cellF.contentLabel.backgroundColor=[UIColor clearColor];
                        }
                    }
                    
                }
            }
            }
            else{
                cellF.artstName.text=@"Sunny";
                cellF.releaseDateLabel.text=@"2015";
                cellF.collectionNAME.text=@"Human Live Nuit Hypnotique";
                [cellF.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                [cellF.vedioButton setHidden:YES];
            }
            
            //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
            left=YES;
            right=NO;
            
            cellF.vedioButton.tag=indexPath.row;
            cellF.profileButton.tag=indexPath.row;
            [cellF.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
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
        
        }
        //Music*********************************************
        if (musicbool) {
            if (musicPostmult1.count>indexPath.row) {
            if (![[musicPostmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                [cellF.postImage setContentMode:UIViewContentModeScaleToFill];
                cellF.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
                cellF.postImage.layer.masksToBounds = YES;
               // [cellF.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                [cellF.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                cellF.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
                // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
                  //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                cellF.iconImage.layer.cornerRadius =17;
                cellF.iconImage.layer.masksToBounds=YES;
                if (![[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"]) {
                   cellF.userNameLabel.text=[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"];
                }
                if (![[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"] isKindOfClass:[NSNull class]]) {
                    cellF.timeLabel.text=[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"];
                }
                
                
                  [cellF.vedioButton setHidden:NO];
            }
            }
            //cellF.iconImage.image=[UIImage imageWithData:[imageContainer objectAtIndex:indexPath.row]];
            if (self.musicPostmult1.count >indexPath.row) {
            if (![[self.musicPostmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                if ([[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"]) {
                    if (![[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"artistName"] isKindOfClass:[NSNull class]]) {
                         cellF.artstName.text=[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"artistName"];
                    }
                    if (![[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"trackName"] isKindOfClass:[NSNull class]]) {
                       cellF.collectionNAME.text=[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"trackName"];
                    }
                    
                    NSScanner *scanner = [NSScanner scannerWithString:[[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"releaseDate"]];
                    NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                    NSString * result;
                    [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                    cellF.releaseDateLabel.text=result;
                    cellF.commentbuttom.constant=1;
                    //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                    if (indexPath.row == profileTagValue) {
                        self.SelectedUserId=[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"id"];
                    }
                           if ([[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"]) {
                           
                            [weakcellF.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellF.iconImage  setImage:image];
                                 }
                                 
                             }];

                        }
                         if (self.musicPostmult1.count > indexPath.row) {
                            if (![[self.musicPostmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                                [weakcellF.postImage setImageWithURL:[NSURL URLWithString:[[[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                 {
                                     if(image)
                                     {
                                         [weakcellF.postImage  setImage:image];
                                     }
                                     
                                 }];
                            }                             }
                                                   }
                    
                       
                    [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
                    [cellF.vedioButton setHidden:NO];
                    if (![[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]isKindOfClass:[NSNull class]]) {
                        NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                        UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                        
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,270)];
                        if (![[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] isKindOfClass:[NSNull class]]) {
                            cellF.contentLabel.text=[[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] substringWithRange: NSMakeRange(0, [[[[self.musicPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];

                        }
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cView.tag=indexPath.row;
                        
                        cellF.commentLabelHeightConstraint.constant=17;
                        
                        cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellF.commentbuttom.constant=7;
                        cellF.lolevelTop.constant=0;
                        cellF.posterHeightConstraint.constant=155;
                        leftTableView.rowHeight=270;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            commentTags=indexPath.row;
                            cView.backgroundColor=[UIColor clearColor];
                            cellF.commentbuttom.constant=1;
                            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellF.commentLabelHeightConstraint.constant=1;
                            [cellF.contentView setFrame:CGRectMake(0, 0, 156,255)];
                            [cView removeFromSuperview];
                            leftTableView.rowHeight=255;
                            cellF.commentbuttom.constant=5;
                            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellF.commentLabelHeightConstraint.constant=1;
                            
                        }
                    }
                }
 
        }
            }
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

        }
        //Movies*************************************************************
        if (moviesbool) {
            if (![[moviesPostmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                [cellF.postImage setContentMode:UIViewContentModeScaleToFill];
                cellF.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
                cellF.postImage.layer.masksToBounds = YES;
                // [cellF.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                [cellF.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                cellF.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
                // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
                cellF.profileButton.tag=indexPath.row;
                [cellF.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                cellF.iconImage.layer.cornerRadius =17;
                cellF.iconImage.layer.masksToBounds=YES;
                if (![[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
                    cellF.userNameLabel.text=[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"];
  
                }
                if (![[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"] isKindOfClass:[NSNull class]]) {
                  cellF.timeLabel.text=[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"];
                }
               
                           }
        if ([[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"media_type"] isEqualToString:@"2"]) {
                //cellF.artstName.text=[[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"]objectAtIndex:0]objectForKey:@"name"];
            if (![[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"] isKindOfClass:[NSNull class]]) {
                cellF.collectionNAME.text=[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];
                
            }
            if (![[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"]isKindOfClass:[NSNull class]]) {
                NSScanner *scanner = [NSScanner scannerWithString:[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"]];
                NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                NSString * result;
                [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                cellF.releaseDateLabel.text=result;
                
            }
                    if (indexPath.row == profileTagValue) {
                        if (![[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
                            self.SelectedUserId=[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"];
 
                        }
                           }
                //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                        if ([[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"]) {
                          [weakcellF.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                         {
                             if(image)
                             {
                                 [weakcellF.iconImage  setImage:image];
                             }
                             
                         }];
                    }
                    if ([self.moviesPostmult1 objectAtIndex:indexPath.row]) {
                    if (![[[self.moviesPostmult1 objectAtIndex:indexPath.row] objectForKey:@"Media"] isKindOfClass:[NSNull class]]) {
    
                    if (![[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"] isKindOfClass:[NSNull class]]) {
                        NSDictionary * postersDict=[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"];
                        if ([[postersDict valueForKey:@"posters" ] isKindOfClass:[NSDictionary class]]) {
                            NSString * movieStr=[[[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
                            NSRange r1 = [movieStr rangeOfString:@"movie"];
                            NSString *substr = [movieStr substringFromIndex:r1.location];
                            
                            [weakcellF.postImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellF.postImage  setImage:image];
                                 }
                                 
                             }];
                            
                        }
                        else{
                            NSString * movieStr=[[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"];
                            NSRange r1 = [movieStr rangeOfString:@"movie"];
                            NSString *substr = [movieStr substringFromIndex:r1.location];
                            
                            [weakcellF.postImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellF.postImage  setImage:image];
                                 }
                                 
                             }];
                        }
                    }
                    }
                    }
            
            
                [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
                [cellF.vedioButton setHidden:YES];
                self.leftTableView.rowHeight=307;
                cellF.posterHeightConstraint.constant=210;
                if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                    NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                    UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                    
                    [cellF.contentView setFrame:CGRectMake(0, 0, 156,320)];
                    cellF.contentLabel.text=[[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.moviesPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                    cellF.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellF.commentbuttom.constant=5;
                    cellF.commentLabelHeightConstraint.constant=17;
                    cellF.lolevelTop.constant=0;
                    leftTableView.rowHeight=320;
                    if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                        commentTags=indexPath.row;
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
                        cellF.commentbuttom.constant=0;
                        cellF.commentLabelHeightConstraint.constant=0;
                        leftTableView.rowHeight=307;
                        cellF.contentLabel.backgroundColor=[UIColor clearColor];
                    }
                }
        }
        }
        //Books*************************************************************
        if (booksbool) {
            if ([self.booksPostmult1 objectAtIndex:indexPath.row]) {
            if (![[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"] isKindOfClass:[NSNull class]]) {
            if (![[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"authors"] isKindOfClass:[NSNull class]]) {
                 cellF.artstName.text=[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"authors"];
            }
            cellF.collectionNAME.text=[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];

              if (indexPath.row == profileTagValue) {
                self.SelectedUserId=[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"];
            }
            }
            if ([[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"]) {
                [weakcellF.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                 {
                     if(image)
                     {
                         [weakcellF.iconImage  setImage:image];
                     }
                     
                 }];
            }
           
            if (indexPath.row == profileTagValue) {
                self.SelectedUserId=[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"];
            }
              if (self.booksPostmult1.count > indexPath.row) {
            if (![[self.booksPostmult1 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
    
                if ([[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]) {
                     [weakcellF.postImage setImageWithURL:[NSURL URLWithString:[[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                     {
                         if(image)
                         {
                             [weakcellF.postImage  setImage:image];
                         }
                         
                     }];

                }
                            }
                       }
        
                   [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
        [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
        self.leftTableView.rowHeight=307;
        cellF.posterHeightConstraint.constant=210;
        [cellF.vedioButton setHidden:YES];
        cellF.mediaType=@"Book";
        if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
            UILabel *cView = (UILabel *)[cellF viewWithTag:1];
            
            [cellF.contentView setFrame:CGRectMake(0, 0, 156,320)];
            cellF.contentLabel.text=[[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.booksPostmult1 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
            NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
            cView.tag=indexPath.row;
            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
            cellF.contentLabel.backgroundColor=[UIColor whiteColor];
            cellF.commentbuttom.constant=5;
            cellF.commentLabelHeightConstraint.constant=17;
            cellF.lolevelTop.constant=0;
            leftTableView.rowHeight=320;
            if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                commentTags=indexPath.row;
                [cellF.contentView setFrame:CGRectMake(0, 0, 156,305)];
                cellF.commentbuttom.constant=2;
                cellF.commentLabelHeightConstraint.constant=1;
                leftTableView.rowHeight=305;
                cellF.contentLabel.backgroundColor=[UIColor clearColor];
            }
        }
        }
        }
        left=YES;
        right=NO;
        cellF.profileButton.tag=indexPath.row;
        [cellF.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [cellF.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        return cellF;
    
    }
    else if([tableView isEqual:rightTableview]){
        if (!cellS) {
            cellS=[[PostRightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    
        }
        __weak typeof(cellS) weakcellS = cellS;

    //Papular*****************************************************************
    if (papularbool) {
        if (papularbool) {
            if([postsmult2 count]> indexPath.row){
            if (![[postsmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                [cellS.postImage setContentMode:UIViewContentModeScaleToFill];
                cellS.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
                cellS.postImage.layer.masksToBounds = YES;
                [cellS.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                cellS.selectionButton.tag=indexPath.row;
                cellS.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
                // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
                cellS.profileButton.tag=indexPath.row;
                [cellS.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                cellS.iconImage.layer.cornerRadius =17;
                cellS.iconImage.layer.masksToBounds=YES;
               
                if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
                   cellS.userNameLabel.text=[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"];
                }
                if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"] isKindOfClass:[NSNull class]]) {
                   cellS.timeLabel.text=[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"];
                }
                
               
                
            }
            }
            //cellF.iconImage.image=[UIImage imageWithData:[imageContainer objectAtIndex:indexPath.row]];
            if (self.postsmult2.count > indexPath.row) {
            if (![[self.postsmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                if ([[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"]) {
                    if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"artistName"] isKindOfClass:[NSNull class]]) {
                       cellS.artstName.text=[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"artistName"];
                    }
                    if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"trackName"] isKindOfClass:[NSNull class]]) {
                        cellS.collectionNAME.text=[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"trackName"];
                    }
                    if (![[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"music_info"]objectForKey:@"releaseDate"] isKindOfClass:[NSNull class]]) {
                        NSScanner *scanner = [NSScanner scannerWithString:[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"music_info"]objectForKey:@"releaseDate"]];
                        NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                        NSString * result;
                        [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                        cellS.releaseDateLabel.text=result;
                        
                    }
                      cellS.commentbuttom.constant=1;
                    if (indexPath.row == profileTagValue) {
                        if (![[[[self.postermult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
                             self.SelectedUserId=[[[self.postermult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"];
                        }
                       
                    }
                    //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                        if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User" ]objectForKey:@"avatar"]isKindOfClass:[NSNull class]]) {
                             [weakcellS.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User" ]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellS.iconImage  setImage:image];
                                 }
                                 
                             }];
                            

                        }
                        
                        if ([self.postsmult2 count]>indexPath.row) {
                        if (![[self.postsmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                             [weakcellS.postImage setImageWithURL:[NSURL URLWithString:[[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellS.postImage  setImage:image];
                                 }
                                 
                             }];
                            
                          
                            
                        }
                        }
                        
                    [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
                      [cellS.vedioButton setHidden:NO];
                    if (![[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]isKindOfClass:[NSNull class]]) {
                        NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                        UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                        
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,270)];
                        if (![[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)] isKindOfClass:[NSNull class]]) {
                            cellS.contentLabel.text=[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                        }
                        
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cView.tag=indexPath.row;
                        
                        cellS.commentLabelHeightConstraint.constant=17;
                        
                        cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellS.commentbuttom.constant=7;
                        cellS.lolevelTop.constant=0;
                        cellS.posterHeightConstraint.constant=155;
                        rightTableview.rowHeight=270;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            commentTags=indexPath.row;
                            cView.backgroundColor=[UIColor clearColor];
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
                }
                if ([[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"2"]) {
                    if (![[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"] isKindOfClass:[NSNull class]]) {
                        //cellF.artstName.text=[[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"]objectAtIndex:0]objectForKey:@"name"];
                        if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"] isKindOfClass:[NSNull class]]) {
                            cellS.collectionNAME.text=[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];

                        }
                        if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"] isKindOfClass:[NSNull class]]) {
                            NSScanner *scanner = [NSScanner scannerWithString:[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"]];
                            NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                            NSString * result;
                            [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                            cellS.releaseDateLabel.text=result;
                            
                        }
                        
                        //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                               if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"]isKindOfClass:[NSNull class]]) {
                                 [weakcellS.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                 {
                                     if(image)
                                     {
                                         [weakcellS.iconImage  setImage:image];
                                     }
                                     
                                 }];
                                

                            }
                           
                            NSDictionary * postersDict;
                            if (self.postsmult2.count > indexPath.row) {
                            if (![[self.postsmult2 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                                
                                if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"] isKindOfClass:[NSNull class]]) {
                                     postersDict=[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"];
                                }
                               
                                if ([[postersDict valueForKey:@"posters" ] isKindOfClass:[NSDictionary class]]) {
                                    NSString * movieStr=[[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
                                    NSRange r1 = [movieStr rangeOfString:@"movie"];
                                    NSString *substr = [movieStr substringFromIndex:r1.location];
                
                                    [weakcellS.postImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                     {
                                         if(image)
                                         {
                                             [weakcellS.postImage  setImage:image];
                                         }
                                         
                                     }];
                                }
                                else{
                                    NSString * movieStr=[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"];
                                    NSRange r1 = [movieStr rangeOfString:@"movie"];
                                    NSString *substr = [movieStr substringFromIndex:r1.location];
                                    
                                 
                                    [weakcellS.postImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                     {
                                         if(image)
                                         {
                                             [weakcellS.postImage  setImage:image];
                                         }
                                         
                                     }];

                                }
                            }
                        }
                        [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                        [cellS.vedioButton setHidden:YES];
                        self.rightTableview.rowHeight=307;
                        cellS.posterHeightConstraint.constant=210;
                        if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                            NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                            UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                            
                            [cellS.contentView setFrame:CGRectMake(0, 0, 156,320)];
                            cellS.contentLabel.text=[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                            NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                            cView.tag=indexPath.row;
                            
                            cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellS.commentbuttom.constant=5;
                            cellS.commentLabelHeightConstraint.constant=17;
                            cellS.lolevelTop.constant=0;
                            
                            rightTableview.rowHeight=320;
                            if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                                commentTags=indexPath.row;
                                [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                                cellS.commentbuttom.constant=0;
                                cellS.commentLabelHeightConstraint.constant=0;
                                rightTableview.rowHeight=307;
                                cellS.contentLabel.backgroundColor=[UIColor clearColor];
                            }
                        }
                    }
                }
                if ([[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"3"] ) {
                    cellS.artstName.text=[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"authors"];
                    cellS.collectionNAME.text=[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];
                    NSScanner *scanner = [NSScanner scannerWithString:[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"releaseDate"]];
                    NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                    NSString * result;
                    [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                    cellS.releaseDateLabel.text=result;
                    
                    //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                           if (![[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"] isKindOfClass:[NSNull class]]) {
                            
                            [weakcellS.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellS.iconImage  setImage:image];
                                 }
                                 
                             }];
                        }
                       
                         if (self.postsmult2.count > indexPath.row) {
                            if (![[self.postsmult2 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                                NSURL *urlO;
                                if (![[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"] isKindOfClass:[NSNull class]]) {
                                    urlO=[NSURL URLWithString:[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]];
                                    [weakcellS.iconImage setImageWithURL:[NSURL URLWithString:[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                     {
                                         if(image)
                                         {
                                             [weakcellS.iconImage  setImage:image];
                                         }
                                         
                                     }];
                                   
                                }
                                else{
                                     [weakcellS.iconImage setImageWithURL:[NSURL URLWithString:[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"thumbnail"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                                     {
                                         if(image)
                                         {
                                             [weakcellS.iconImage  setImage:image];
                                         }
                                         
                                     }];
                                    
                                }
                            }
 
                        }
                        
                    
                    [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                    self.leftTableView.rowHeight=307;
                    cellS.posterHeightConstraint.constant=210;
                    [cellS.vedioButton setHidden:YES];
                    if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                        NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                        UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                        
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,320)];
                        cellS.contentLabel.text=[[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.postsmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cView.tag=indexPath.row;
                        cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellS.commentbuttom.constant=5;
                        cellS.commentLabelHeightConstraint.constant=17;
                        cellS.lolevelTop.constant=0;
                        rightTableview.rowHeight=320;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            commentTags=indexPath.row;
                            [cellS.contentView setFrame:CGRectMake(0, 0, 156,305)];
                            cellS.commentbuttom.constant=2;
                            cellS.commentLabelHeightConstraint.constant=1;
                            rightTableview.rowHeight=305;
                            cellS.contentLabel.backgroundColor=[UIColor clearColor];
                        }
                    }
                    
                }
            }
            }
           else{
                cellS.artstName.text=@"Sunny";
                cellS.releaseDateLabel.text=@"2015";
                cellS.collectionNAME.text=@"Human Live Nuit Hypnotique";
                [cellS.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                [cellS.vedioButton setHidden:YES];
            }
            
            //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
            
           
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
           
            //Audi
            
                  }

    }
    //Music***********************************************************
    if (musicbool) {
        if (self.musicPostmult2.count > indexPath.row) {
        if (![[musicPostmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            [cellS.postImage setContentMode:UIViewContentModeScaleToFill];
            cellS.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            cellS.postImage.layer.masksToBounds = YES;
            //[cellS.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            cellS.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
            // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
              //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
            cellS.iconImage.layer.cornerRadius =17;
            cellS.iconImage.layer.masksToBounds=YES;
            if (![[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
                 cellS.userNameLabel.text=[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"];
            }
            if (![[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"] isKindOfClass:[NSNull class]]) {
                cellS.timeLabel.text=[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"];

            }
                    }
        //cellF.iconImage.image=[UIImage imageWithData:[imageContainer objectAtIndex:indexPath.row]];
        
        if (![[self.musicPostmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            if ([[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"]) {
                if (![[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"artistName"] isKindOfClass:[NSNull class]]) {
                     cellS.artstName.text=[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"artistName"];
                }
                if (![[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"trackName"] isKindOfClass:[NSNull class]]) {
                    cellS.collectionNAME.text=[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"trackName"];
                }
                if (![[[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"releaseDate"] isKindOfClass:[NSNull class]]) {
                    NSScanner *scanner = [NSScanner scannerWithString:[[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"releaseDate"]];
                    NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                    NSString * result;
                    [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                    cellS.releaseDateLabel.text=result;
   
                }
                                cellS.commentbuttom.constant=1;
                //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                if (self.musicImagesSndArray.count>indexPath.row) {
                    cellS.postImage.image=[self.musicImagesSndArray objectAtIndex:indexPath.row];

                }
                if (indexPath.row == profileTagValue) {
                    self.SelectedUserId=[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"];
                }
                
                      if (![[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"] isKindOfClass:[NSNull class]]) {
                         [weakcellS.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                         {
                             if(image)
                             {
                                 [weakcellS.iconImage  setImage:image];
                             }
                             
                         }];
                        
                    }
                    
                      if (self.musicPostmult2.count > indexPath.row) {
                    if (![[self.musicPostmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                         [weakcellS.postImage setImageWithURL:[NSURL URLWithString:[[[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                         {
                             if(image)
                             {
                                 [weakcellS.postImage  setImage:image];
                             }
                             
                         }];
                                           }
                   
                    }
                    [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
                  [cellS.vedioButton setHidden:NO];
                if (![[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]isKindOfClass:[NSNull class]]) {
                    if (![[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]isKindOfClass:[NSNull class]]) {
                        NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                        UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                        
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,270)];
                        if (![[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] isKindOfClass:[NSNull class]]) {
                            cellS.contentLabel.text=[[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.musicPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                            NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                            
                        }
                               cView.tag=indexPath.row;
                        
                        cellS.commentLabelHeightConstraint.constant=17;
                        
                        cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellS.commentbuttom.constant=7;
                        cellS.lolevelTop.constant=0;
                        cellS.posterHeightConstraint.constant=155;
                        rightTableview.rowHeight=270;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            commentTags=indexPath.row;
                            cView.backgroundColor=[UIColor clearColor];
                            cellS.commentbuttom.constant=1;
                            cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellS.commentLabelHeightConstraint.constant=1;
                            [cellS.contentView setFrame:CGRectMake(0, 0, 156,255)];
                            rightTableview.rowHeight=255;
                            cellS.commentbuttom.constant=5;
                            cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                            cellS.commentLabelHeightConstraint.constant=1;
                            
                        }
                    }            }
            
        }
        }
    }
    }
    //Movies*************************************************************
        if (moviesbool) {
            if (moviesPostmult2.count >indexPath.row) {
                [cellS.postImage setContentMode:UIViewContentModeScaleToFill];
                cellS.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
                cellS.postImage.layer.masksToBounds = YES;
                // [cellF.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
              //  [cellS.selectionButton addTarget:self action:@selector(rihtSelection:) forControlEvents:UIControlEventTouchUpInside];
                cellS.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
                // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
                //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
                cellS.iconImage.layer.cornerRadius =17;
                cellS.iconImage.layer.masksToBounds=YES;
                if (![[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
                   cellS.userNameLabel.text=[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"];
                }
               
                cellS.timeLabel.text=[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"];
               
                          }
            if ([[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"media_type"] isEqualToString:@"2"]) {
                //cellF.artstName.text=[[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"]objectAtIndex:0]objectForKey:@"name"];
                if (indexPath.row == profileTagValue) {
                    
                }
                if (![[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"] isKindOfClass:[NSNull class]]) {
                  cellS.collectionNAME.text=[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];
                }
                if (![[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"] isKindOfClass:[NSNull class]]) {
                    NSScanner *scanner = [NSScanner scannerWithString:[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"]];
                    NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                    NSString * result;
                    [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                    cellS.releaseDateLabel.text=result;
                    
                }
                     //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                if (indexPath.row == profileTagValue) {
                    if (![[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"] isKindOfClass:[NSNull class]]) {
                        self.SelectedUserId=[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"id"];

                    }
                                    }
                       if (![[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"] isKindOfClass:[NSNull class]]) {
                         [weakcellS.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                         {
                             if(image)
                             {
                                 [weakcellS.iconImage  setImage:image];
                             }
                             
                         }];

                        
                    }
                    if(![[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"] isKindOfClass:[NSNull class]]){
                    NSDictionary * postersDict=[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"];
                    
                        
                        if ([[postersDict valueForKey:@"posters" ] isKindOfClass:[NSDictionary class]]) {
                        NSString * movieStr=[[[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
                        NSRange r1 = [movieStr rangeOfString:@"movie"];
                        NSString *substr = [movieStr substringFromIndex:r1.location];
                        
                            [weakcellS.postImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                             {
                                 if(image)
                                 {
                                     [weakcellS.postImage  setImage:image];
                                 }
                                 
                             }];

                        
                    }
                    else{
                        NSString * movieStr=[[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"];
                        NSRange r1 = [movieStr rangeOfString:@"movie"];
                        NSString *substr = [movieStr substringFromIndex:r1.location];
                
                        [weakcellS.postImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                         {
                             if(image)
                             {
                                 [weakcellS.postImage  setImage:image];
                             }
                             
                         }];
                    }
                    }
                                   [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                [cellS.vedioButton setHidden:YES];
                self.leftTableView.rowHeight=307;
                cellS.posterHeightConstraint.constant=210;
                if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                    NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                    UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                    
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,320)];
                    if (![[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] isKindOfClass:[NSNull class]]) {
                        cellS.contentLabel.text=[[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.moviesPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                        
                    }
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.commentbuttom.constant=5;
                    cellS.commentLabelHeightConstraint.constant=17;
                    cellS.lolevelTop.constant=0;
                    rightTableview.rowHeight=320;
                    if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                        commentTags=indexPath.row;
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                        cellS.commentbuttom.constant=0;
                        cellS.commentLabelHeightConstraint.constant=0;
                        rightTableview.rowHeight=307;
                        cellS.contentLabel.backgroundColor=[UIColor clearColor];
                    }
                }
            }
        }
    //Books*************************************************************
    if (booksbool) {
        if (booksPostmult2.count > indexPath.row) {
        if (![[booksPostmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            [cellS.postImage setContentMode:UIViewContentModeScaleToFill];
            cellS.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            cellS.postImage.layer.masksToBounds = YES;
            //[cellS.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
           // [cellS.selectionButton addTarget:self action:@selector(rihtSelection:) forControlEvents:UIControlEventTouchUpInside];            cellS.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
            // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
            cellS.profileButton.tag=indexPath.row;
            //[cellS.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
            cellS.iconImage.layer.cornerRadius =17;
            cellS.iconImage.layer.masksToBounds=YES;
            if (![[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"]isKindOfClass:[NSNull class]]) {
              cellS.userNameLabel.text=[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"name"];
            }
            if (![[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"] isKindOfClass:[NSNull class]]) {
                cellS.timeLabel.text=[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"];
            }
            
            
        }
        //ce
        if (![[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"authors"] isKindOfClass:[NSNull class]]) {
            cellS.artstName.text=[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"authors"];
        }
        if (![[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"] isKindOfClass:[NSNull class]]) {
            cellS.collectionNAME.text=[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];

        }
        
       /* NSScanner *scanner = [NSScanner scannerWithString:[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]];
        NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
        NSString * result;
        [scanner scanUpToCharactersFromSet:cs1 intoString:&result];*/
        //cellF.releaseDateLabel.text=result;
        
        //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
        if (indexPath.row == profileTagValue) {
            self.SelectedUserId=[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"id"];
        }
             if ([[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"]) {
                 
                [weakcellS.iconImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                 {
                     if(image)
                     {
                         [weakcellS.iconImage  setImage:image];
                     }
                     
                 }];
 
            }
            if (booksPostmult2.count > indexPath.row) {
            if (![[[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"] isKindOfClass:[NSNull class]]) {
                [weakcellS.postImage setImageWithURL:[NSURL URLWithString:[[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                 {
                     if(image)
                     {
                         [weakcellS.postImage  setImage:image];
                     }
                     
                 }];

                

            }
            else{
               
                [weakcellS.postImage setImageWithURL:[NSURL URLWithString:[[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"thumbnail"]] placeholderImage:[UIImage  imageNamed:@"pic 1.png"] completed:^(UIImage * image, NSError * error, SDImageCacheType cacheType)
                 {
                     if(image)
                     {
                         [weakcellS.postImage  setImage:image];
                     }
                     
                 }];
                

            }
            }
                      [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
        [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
        self.rightTableview.rowHeight=307;
        cellS.posterHeightConstraint.constant=210;
        [cellF.vedioButton setHidden:YES];
        cellF.mediaType=@"Book";
        if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
            UILabel *cView = (UILabel *)[cellF viewWithTag:1];
            
            [cellS.contentView setFrame:CGRectMake(0, 0, 156,320)];
            if (![[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] isKindOfClass:[NSNull class]]) {
                cellS.contentLabel.text=[[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"]substringWithRange: NSMakeRange(0, [[[[self.booksPostmult2 objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"content"] rangeOfString: @"<"].location)];
                
            }
              NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
            cView.tag=indexPath.row;
            cellS.contentLabel.backgroundColor=[UIColor whiteColor];
            cellS.contentLabel.backgroundColor=[UIColor whiteColor];
            cellS.commentbuttom.constant=5;
            cellS.commentLabelHeightConstraint.constant=17;
            cellS.lolevelTop.constant=0;
           rightTableview.rowHeight=320;
            if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                commentTags=indexPath.row;
                [cellS.contentView setFrame:CGRectMake(0, 0, 156,305)];
                cellS.commentbuttom.constant=2;
                cellS.commentLabelHeightConstraint.constant=1;
                rightTableview.rowHeight=305;
                cellS.contentLabel.backgroundColor=[UIColor clearColor];
            }
        }
    }
    }   left=NO;
        right=YES;

        cellS.profileButton.tag=indexPath.row;
        [cellS.profileButton addTarget:self action:@selector(rightProfileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        cellS.selectionButton.tag=indexPath.row;
         [cellS.selectionButton addTarget:self action:@selector(rihtSelection:) forControlEvents:UIControlEventTouchUpInside];
        
        return cellS;
    }
   //ToolTipTableview
    
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:tooltipTableView]) {
        UITableViewCell *cell = [tooltipTableView cellForRowAtIndexPath:indexPath];
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
-(void)buttonPressedAction:(UIButton *)sender {
    
    if (![[postsmult1 objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
        if (papularbool) {
        self.strAudioUrl=  [[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"previewUrl"];
        }
        if (musicbool) {
            self.strAudioUrl=  [[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"previewUrl"];
        }
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
    
    if (![[self.postsmult2 objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
        if (papularbool) {
            self.strAudioUrl=  [[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"previewUrl"];
        }
        if (musicbool) {
            self.strAudioUrl=  [[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"previewUrl"];
        }

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
-(void)settingsButtonTapped:(UIButton *)sender{
    [self.audioPlayerF stop];
    [self.audioPlayerS stop];
    self.tooltipTableView.hidden=NO;
 
    if(left){
        if (![[self.mediaKindmult1 objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
            if ([[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"song"]) {
                [BookMarkAddWebservice sharedInstance].mediaType=@"1";
                [BookMarkAddWebservice sharedInstance].mediaId=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"trackId"];
            }
        }
    
    if (![[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"]isKindOfClass:[NSNull class]]){
        if ([[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"Movie"]) {
            [BookMarkAddWebservice sharedInstance].mediaType=@"2";
            [BookMarkAddWebservice sharedInstance].mediaId=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"id"];
            
        }
    }
    if (![[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"]isKindOfClass:[NSNull class]]){
        if ([[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"books#volume"]){
            [BookMarkAddWebservice sharedInstance].mediaType=@"3";
            [BookMarkAddWebservice sharedInstance].mediaId=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"id"];
        }
    }
    }
    if(right){
        if (![[self.mediaKindmult2 objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
            if ([[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"song"]) {
                [BookMarkAddWebservice sharedInstance].mediaType=@"1";
                [BookMarkAddWebservice sharedInstance].mediaId=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"trackId"];
            }
        }
        if (![[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"]isKindOfClass:[NSNull class]]){
            if ([[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"Movie"]) {
                [BookMarkAddWebservice sharedInstance].mediaType=@"2";
                [BookMarkAddWebservice sharedInstance].mediaId=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"id"];
            }
        }
        if (![[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"]isKindOfClass:[NSNull class]]){
            if ([[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"books#volume"]){
                [BookMarkAddWebservice sharedInstance].mediaType=@"3";
                [BookMarkAddWebservice sharedInstance].mediaId=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"id"];
            }
        }
    }
    self.tooltipTableView.hidden=NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tooltipTableView reloadData];
        
    });
    
    self.gestureView.hidden=NO;
    
}

-(void)selectionButtonTapped:(UIButton *)sender{
    if (papularbool) {
       // [DataSaved sharedInstance].strProfileImage= [[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        NSLog(@"%@",SelectedUserId);
        if ([[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"] ) {
           [DataSaved sharedInstance].strArtist=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"artistName"];
           [DataSaved sharedInstance].strTitle=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"trackName"];
            [DataSaved sharedInstance].strName=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
            [DataSaved sharedInstance].strTime=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
            [DataSaved sharedInstance].strProfileImage=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
            [DataSaved sharedInstance].strPoster=[[[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2];
            [DataSaved sharedInstance].strAudioUrl=[[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"previewUrl"];
            [DataSaved sharedInstance].strItemId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
            [DataSaved sharedInstance].strmediaType=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
            [DataSaved sharedInstance].strItemUserId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
            [DataSaved sharedInstance].strPostId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
            [DataSaved sharedInstance].strMediaId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];


        }
        if ([[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"2"] ) {
            //[DataSaved sharedInstance].strArtist=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"artistName"];
            [DataSaved sharedInstance].strTitle=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"title"];
            [DataSaved sharedInstance].strName=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
            [DataSaved sharedInstance].strTime=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
            [DataSaved sharedInstance].strProfileImage=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
            NSString * movieStr=[[[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
            NSRange r1 = [movieStr rangeOfString:@"movie"];
            NSString *substr = [movieStr substringFromIndex:r1.location];
            
          [DataSaved sharedInstance].strPoster  =[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr];
            [DataSaved sharedInstance].strItemId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
            [DataSaved sharedInstance].strmediaType=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
            [DataSaved sharedInstance].strItemUserId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
            [DataSaved sharedInstance].strPostId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
            [DataSaved sharedInstance].strMediaId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];

            
        }
        if ([[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"3"] ) {
            [DataSaved sharedInstance].strArtist=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"authors"];
            [DataSaved sharedInstance].strTitle=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"title"];
            [DataSaved sharedInstance].strName=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
            [DataSaved sharedInstance].strTime=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
            [DataSaved sharedInstance].strProfileImage=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
            [DataSaved sharedInstance].strPoster=[[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"];
            [DataSaved sharedInstance].strItemId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
            [DataSaved sharedInstance].strmediaType=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
            [DataSaved sharedInstance].strItemUserId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
            [DataSaved sharedInstance].strPostId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
            [DataSaved sharedInstance].strMediaId=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];

        }

    }
    
    if (musicbool) {
        [DataSaved sharedInstance].strArtist=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"artistName"];
        [DataSaved sharedInstance].strTitle=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"trackName"];
        [DataSaved sharedInstance].strName=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
        [DataSaved sharedInstance].strTime=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
        [DataSaved sharedInstance].strProfileImage=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
        [DataSaved sharedInstance].strPoster=[[[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2];
        [DataSaved sharedInstance].strAudioUrl=[[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"previewUrl"];
        [DataSaved sharedInstance].strItemId=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
        [DataSaved sharedInstance].strmediaType=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
        [DataSaved sharedInstance].strItemUserId=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        [DataSaved sharedInstance].strPostId=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
        [DataSaved sharedInstance].strMediaId=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];



    }
    
    if (moviesbool) {
        //[DataSaved sharedInstance].strArtist=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"artistName"];
        [DataSaved sharedInstance].strTitle=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"title"];
        [DataSaved sharedInstance].strName=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
        [DataSaved sharedInstance].strTime=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
        [DataSaved sharedInstance].strProfileImage=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
        NSString * movieStr=[[[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
        NSRange r1 = [movieStr rangeOfString:@"movie"];
        NSString *substr = [movieStr substringFromIndex:r1.location];
        
        [DataSaved sharedInstance].strPoster  =[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr];
        [DataSaved sharedInstance].strItemId=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
        [DataSaved sharedInstance].strmediaType=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
        [DataSaved sharedInstance].strItemUserId=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        [DataSaved sharedInstance].strPostId=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
        [DataSaved sharedInstance].strMediaId=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];
        

    }
    
    if (booksbool) {
        [DataSaved sharedInstance].strArtist=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"authors"];
        [DataSaved sharedInstance].strTitle=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"title"];
        [DataSaved sharedInstance].strName=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
        [DataSaved sharedInstance].strTime=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
        [DataSaved sharedInstance].strProfileImage=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
        [DataSaved sharedInstance].strPoster=[[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"];
        [DataSaved sharedInstance].strItemId=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
        [DataSaved sharedInstance].strmediaType=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
        [DataSaved sharedInstance].strItemUserId=[[[self.booksPostmult1
                                                    objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        [DataSaved sharedInstance].strPostId=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
        [DataSaved sharedInstance].strMediaId=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];
        


    }
    
    PostSelectionViewController * selectionVC=[[PostSelectionViewController alloc]initWithNibName:@"PostSelectionViewController" bundle:nil];
    [self.navigationController pushViewController:selectionVC animated:NO];

}
-(void)rihtSelection:(UIButton *)sender{
    if (papularbool) {
        //[DataSaved sharedInstance].strProfileImage= [[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        NSLog(@"%@",postsmult2);
        if ([[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"media_type"] isEqualToString:@"1"] ) {
            [DataSaved sharedInstance].strArtist=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"artistName"];
            [DataSaved sharedInstance].strTitle=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"trackName"];
            [DataSaved sharedInstance].strName=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
            [DataSaved sharedInstance].strTime=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
            [DataSaved sharedInstance].strProfileImage=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
            [DataSaved sharedInstance].strPoster=[[[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2];
            [DataSaved sharedInstance].strAudioUrl=[[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"previewUrl"];
            [DataSaved sharedInstance].strItemId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
            [DataSaved sharedInstance].strmediaType=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"media_type"];
            [DataSaved sharedInstance].strItemUserId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
            [DataSaved sharedInstance].strPostId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
            [DataSaved sharedInstance].strMediaId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];


        }
        if ([[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"2"] ) {
            //[DataSaved sharedInstance].strArtist=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"artistName"];
            [DataSaved sharedInstance].strTitle=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"title"];
            [DataSaved sharedInstance].strName=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
            [DataSaved sharedInstance].strTime=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
            [DataSaved sharedInstance].strPostId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];

            [DataSaved sharedInstance].strProfileImage=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
            NSString * movieStr=[[[[[self.postsmult2  objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
            NSRange r1 = [movieStr rangeOfString:@"movie"];
            NSString *substr = [movieStr substringFromIndex:r1.location];
            
            [DataSaved sharedInstance].strPoster  =[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr];
            [DataSaved sharedInstance].strItemId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
            [DataSaved sharedInstance].strmediaType=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"media_type"];
            [DataSaved sharedInstance].strItemUserId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
            [DataSaved sharedInstance].strMediaId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];

        }
        if ([[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"media_type"] isEqualToString:@"3"] ) {
            [DataSaved sharedInstance].strArtist=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"authors"];
            [DataSaved sharedInstance].strTitle=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"title"];
            [DataSaved sharedInstance].strName=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
            [DataSaved sharedInstance].strTime=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
            [DataSaved sharedInstance].strProfileImage=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
            [DataSaved sharedInstance].strPostId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
            [DataSaved sharedInstance].strPoster=[[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"];
            [DataSaved sharedInstance].strItemId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
            [DataSaved sharedInstance].strmediaType=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"media_type"];
            [DataSaved sharedInstance].strItemUserId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
            [DataSaved sharedInstance].strMediaId=[[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];

        }
        
    }
    
    if (musicbool) {
        [DataSaved sharedInstance].strArtist=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"artistName"];
        [DataSaved sharedInstance].strTitle=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"trackName"];
        [DataSaved sharedInstance].strName=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
        [DataSaved sharedInstance].strTime=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
        [DataSaved sharedInstance].strProfileImage=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
        [DataSaved sharedInstance].strPostId=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
        [DataSaved sharedInstance].strPoster=[[[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2];
        [DataSaved sharedInstance].strAudioUrl=[[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"previewUrl"];
        [DataSaved sharedInstance].strItemId=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
        [DataSaved sharedInstance].strmediaType=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
        [DataSaved sharedInstance].strMediaId=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];
        [DataSaved sharedInstance].strItemUserId=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
                NSLog(@"%@",[DataSaved sharedInstance].strItemUserId);
           }
    
    if (moviesbool) {
        //[DataSaved sharedInstance].strArtist=[[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"artistName"];
        [DataSaved sharedInstance].strTitle=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"title"];
        [DataSaved sharedInstance].strName=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
        [DataSaved sharedInstance].strTime=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
        [DataSaved sharedInstance].strProfileImage=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
        [DataSaved sharedInstance].strPostId=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];

        NSString * movieStr=[[[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
        NSRange r1 = [movieStr rangeOfString:@"movie"];
        NSString *substr = [movieStr substringFromIndex:r1.location];
        
        [DataSaved sharedInstance].strPoster  =[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr];
        [DataSaved sharedInstance].strItemId=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
        [DataSaved sharedInstance].strmediaType=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
       [DataSaved sharedInstance].strItemUserId=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        [DataSaved sharedInstance].strMediaId=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"media_id"];

        
    }
    
    if (booksbool) {
        [DataSaved sharedInstance].strArtist=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"authors"];
        [DataSaved sharedInstance].strTitle=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"title"];
        [DataSaved sharedInstance].strName=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"name"];
        [DataSaved sharedInstance].strTime=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"postdate"];
        [DataSaved sharedInstance].strPostId=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"id"];
        [DataSaved sharedInstance].strProfileImage=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"avatar"];
        [DataSaved sharedInstance].strPoster=[[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"];
        [DataSaved sharedInstance].strItemId=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"Post"]objectForKey:@"m_id"];
        [DataSaved sharedInstance].strmediaType=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_type"];
        [DataSaved sharedInstance].strItemUserId=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        [DataSaved sharedInstance].strMediaId=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"Media" ]objectForKey:@"media_id"];

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
-(IBAction)profileButtonTapped:(UIButton *)sender{
    NSLog(@"%@", posterCopyMult1);
       MyProfileViewController * profileVC=[[MyProfileViewController alloc]initWithNibName:@"MyProfileViewController" bundle:nil];
       if (![[postsmult1 objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
        if (papularbool) {
            self.SelectedUserId= [[[self.postsmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
            NSLog(@"%@",SelectedUserId);
        }

        if (musicbool) {
            self.SelectedUserId=[[[self.musicPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        }

    if (moviesbool) {
        self.SelectedUserId=[[[self.moviesPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
    }

        if (booksbool) {
            self.SelectedUserId=[[[self.booksPostmult1 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        }

}
    NSLog(@"****%@",self.SelectedUserId);
    profileVC.strUID=self.SelectedUserId;
    profileVC.strUserName=self.strUserName;
    [self.navigationController pushViewController:profileVC animated:NO];
}
-(IBAction)rightProfileButtonTapped:(UIButton *)sender{
    MyProfileViewController * profileVC=[[MyProfileViewController alloc]initWithNibName:@"MyProfileViewController" bundle:nil];
    if (![[postsmult2 objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
        if (papularbool) {
            self.SelectedUserId= [[[self.postsmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
            NSLog(@"%@",SelectedUserId);
        }

        if (musicbool) {
            self.SelectedUserId=[[[self.musicPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        }


        if (moviesbool) {
            self.SelectedUserId=[[[self.moviesPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        }
    
        if (booksbool) {
            self.SelectedUserId=[[[self.booksPostmult2 objectAtIndex:sender.tag]objectForKey:@"User"]objectForKey:@"id"];
        }
    }
    
    NSLog(@"****%@",self.SelectedUserId);
    profileVC.strUID=self.SelectedUserId;
    profileVC.strUserName=self.strUserName;
    [self.navigationController pushViewController:profileVC animated:NO];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    UITableView *slaveTable = nil;
    
    if (self.leftTableView == scrollView) {
        slaveTable = self.rightTableview;
    } else if (self.rightTableview == scrollView) {
        slaveTable = self.leftTableView;
    }
    
    [slaveTable setContentOffset:scrollView.contentOffset];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (papularbool) {
    NSInteger currentOffset = scrollView.contentOffset.y;
    NSInteger maximumOffset = scrollView.contentSize.height- scrollView.frame.size.height;
    if (maximumOffset - currentOffset <= 0) {
        papularindexValue=papularindexValue+10;
        [self popularButtonTapped:self.popularButton];
        
    }
    if (currentOffset<=0) {
        papularindexValue=10;
        NSLog(@"%@",@"#####");
    }
    }
    
    if (musicbool) {
        NSInteger currentOffset = scrollView.contentOffset.y;
        NSInteger maximumOffset = scrollView.contentSize.height- scrollView.frame.size.height;
        if (maximumOffset - currentOffset <= 0) {
            musicindexValue=musicindexValue+10;
            [self musicButtonTapped:self.musicButton];
        }
        if (currentOffset<=0) {
            musicindexValue=10;
            NSLog(@"%@",@"#####");
        }
    }
    if (moviesbool) {
        NSInteger currentOffset = scrollView.contentOffset.y;
        NSInteger maximumOffset = scrollView.contentSize.height- scrollView.frame.size.height;
        if (maximumOffset - currentOffset <= 0) {
            moviesindexValue=moviesindexValue+10;
           [self moviesButtonTapped:self.moviesButton] ;
        }
        if (currentOffset<=0) {
            moviesindexValue=10;
            NSLog(@"%@",@"#####");
        }
    }
    if (booksbool) {
        NSInteger currentOffset = scrollView.contentOffset.y;
        NSInteger maximumOffset = scrollView.contentSize.height- scrollView.frame.size.height;
        if (maximumOffset - currentOffset <= 0) {
            booksindexValue=booksindexValue+10;
            [self booksButtonbTapped:self.booksButton];
        }
        if (currentOffset<=0) {
            booksindexValue=10;
            NSLog(@"%@",@"#####");
        }
    }

}

-(IBAction)popularButtonTapped:(id)sender{
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor grayColor];
    activityView.center=self.view.center;
    
    [activityView startAnimating];
    
    [self.view addSubview:activityView];
    activityView.hidesWhenStopped = YES;
    [activityView performSelector:@selector(stopAnimation) withObject:nil afterDelay:20.0];

    postsmult1=[NSMutableArray array];
    postsmult2=[NSMutableArray array];
      posterCopyMult1=[[NSMutableArray alloc]initWithCapacity:10];
    self.popularImagesFstArray =[[NSMutableArray alloc]initWithCapacity:10];
    self.popularImagesSndArray=[[NSMutableArray alloc]initWithCapacity:10];
    
  
    //self.popularButton.titleLabel.textColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f];
    [self.popularButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    self.popularView.backgroundColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.musicView.backgroundColor=[UIColor grayColor];
    self.booksView.backgroundColor=[UIColor grayColor];
    self.movieView.backgroundColor=[UIColor grayColor];
      self.papularbool=YES;
    self.musicbool=NO;
    self.moviesbool=NO;
    self.booksbool=NO;
     [DiscoveryDetailsService sharedInstance].indexValue=[NSString stringWithFormat: @"%ld", (long)self.papularindexValue];
    [[DiscoveryDetailsService sharedInstance] allPostsDetailsServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        if (isError) {
            //alertview
        }
        else{
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.postsArray=[resultDic valueForKey:@"DiscoveryDetail"];
                if (![postsArray isKindOfClass:[NSNull class]]) {
                    [postsArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                        if (idx%2==0)
                        {
                            [postsmult1 addObject:object];
                        }
                        else
                        {
                            [postsmult2 addObject:object];
                        }
                    }];
                    self.posterCopyMult1=self.postsArray;
                   
                    self.leftTableView.delegate=self;
                    self.leftTableView.dataSource=self;
                    self.rightTableview.delegate=self;
                    self.rightTableview.dataSource=self;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.leftTableView reloadData];
                        [self.rightTableview reloadData];
                    });
                }
            }
    
                }
                   }];
    
}
-(void)createPosterArray{
    if (![self.postsmult1 isKindOfClass:[NSNull class]]) {
        for(int i=0;i< [postsmult1 count]; i++){
            UIImage * imageO;
            UIImage * imageD;
            UIImage * newImage;
        if ([[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"]) {
            NSURL *urlO=[NSURL URLWithString:[[[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2]];
                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
            if (imageO ==nil) {
                imageD=[UIImage imageNamed:@"poster.png"];
                 [self.popularImagesFstArray addObject:imageD];
                   }
            else{
            [self.popularImagesFstArray addObject:imageO];
            }
        }
        if ([[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"2"] ){
            NSURL *urlO;
            NSData * dataO;
            NSDictionary * postersDict=[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"movie_info"];
          
            if ([[postersDict valueForKey:@"posters" ] isKindOfClass:[NSDictionary class]]) {
                NSString * movieStr=[[[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
                if (!([movieStr rangeOfString:@"movie"].location == NSNotFound)) {
                    NSRange r1 = [movieStr rangeOfString:@"movie"];
                    NSString *substr = [movieStr substringFromIndex:r1.location];
                    
                    urlO=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]];
                }
                else{
                    urlO=[NSURL URLWithString:[[[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"]];
                }
            }
            else{
                NSString * movieStr=[[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"];
                if(!([movieStr rangeOfString:@","].location == NSNotFound)){
                    NSRange r1 = [movieStr rangeOfString:@","];
                    NSString *substr = [movieStr substringToIndex:r1.location];
                    NSRange r2 = [substr rangeOfString:@"movie"];
                    NSString *moviesubstr = [substr substringFromIndex:r2.location];
                    
                    urlO=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",moviesubstr]];
                    
                }
                else{
                    NSRange r1 = [movieStr rangeOfString:@"movie"];
                    NSString *substr = [movieStr substringFromIndex:r1.location];
                    
                    urlO=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]];
                }
            }
            
            dataO = [NSData dataWithContentsOfURL:urlO];
            
            imageO = [UIImage imageWithData:dataO];
            CGSize newSize = CGSizeMake(300.0f,300.0f);
            UIGraphicsBeginImageContext(newSize);
            [imageO drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
            newImage = UIGraphicsGetImageFromCurrentImageContext();
            [self.popularImagesFstArray addObject:newImage];
                  }
            if ([[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"3"] ){
                NSURL *urlO=[NSURL URLWithString:[[[[self.postsmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"thumbnail"]];
                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
                [self.popularImagesFstArray addObject:imageO];
            }
        }
    }
   //
    if (![self.postsmult2 isKindOfClass:[NSNull class]]) {
        for(int i=0;i< [postsmult2 count]; i++){
            UIImage * imageO;
            UIImage * newImage;
            UIImage * imageD;

            if ([[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"]) {
                NSURL *urlO=[NSURL URLWithString:[[[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2]];
                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
                if (imageO ==nil) {
                    imageD=[UIImage imageNamed:@"poster.png"];
                    [self.popularImagesSndArray addObject:imageD];
                }
                else{
                    [self.popularImagesSndArray addObject:imageO];
                    
                }

                            }
            if ([[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"2"] ){
                NSURL *urlO;
                NSData * dataO;
                NSDictionary * postersDict=[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"movie_info"];
                if ([[postersDict valueForKey:@"posters" ] isKindOfClass:[NSDictionary class]]) {
                    NSString * movieStr=[[[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"];
                    if (!([movieStr rangeOfString:@"movie"].location == NSNotFound)) {
                        NSRange r1 = [movieStr rangeOfString:@"movie"];
                        NSString *substr = [movieStr substringFromIndex:r1.location];
                        
                        urlO=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]];
                    }
                    else{
                        urlO=[NSURL URLWithString:[[[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"]objectForKey:@"original"]];
                    }
                    
                }
                else{
                    NSString * movieStr=[[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"movie_info"]objectForKey:@"posters"];
                    
                    if(!([movieStr rangeOfString:@","].location == NSNotFound)){
                        NSRange r1 = [movieStr rangeOfString:@","];
                        NSString *substr = [movieStr substringToIndex:r1.location];
                        NSRange r2 = [substr rangeOfString:@"movie"];
                        NSString *moviesubstr = [substr substringFromIndex:r2.location];
                        
                        urlO=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",moviesubstr]];
                        
                    }
                    else{
                        NSRange r1 = [movieStr rangeOfString:@"movie"];
                        NSString *substr = [movieStr substringFromIndex:r1.location];
                        
                        urlO=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]];
                    }
                    
                }
                dataO = [NSData dataWithContentsOfURL:urlO];
                
                imageO = [UIImage imageWithData:dataO];
                CGSize newSize = CGSizeMake(300.0f,300.0f);
                UIGraphicsBeginImageContext(newSize);
                [imageO drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
                newImage = UIGraphicsGetImageFromCurrentImageContext();
                    [self.popularImagesSndArray addObject:newImage];
                
            }
            if ([[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"3"] ){
                NSURL *urlO=[NSURL URLWithString:[[[[self.postsmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"thumbnail"]];
                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
                [self.popularImagesSndArray addObject:imageO];
                         }
        }
    }
    NSLog(@"%@",self.popularImagesSndArray);
   }
-(void)createMusicArray{
    if (![self.musicPostmult1 isKindOfClass:[NSNull class]]) {
        for(int i=0;i< [musicPostmult1 count]; i++){
            UIImage * imageO;
            UIImage * newImage;
            if ([[[[self.musicPostmult1 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"]) {
                NSURL *urlO=[NSURL URLWithString:[[[[[self.musicPostmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2]];
                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
                if (imageO ==nil) {
                    imageO=[UIImage imageNamed:@"poster.png"];
                }
                
                             [self.musicImagesFstArray addObject:imageO];
                
                
            }
           
        }
    }
    //
    if (![self.musicPostmult2 isKindOfClass:[NSNull class]]) {
        for(int i=0;i< [musicPostmult2 count]; i++){
            UIImage * imageO;
            UIImage * newImage;
            if ([[[[self.musicPostmult2 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"1"]) {
                NSURL *urlO=[NSURL URLWithString:[[[[[self.musicPostmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"music_info"]objectForKey:@"artworkUrl"]objectAtIndex:2]];
                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
               
                if (imageO ==nil) {
                    imageO=[UIImage imageNamed:@"poster.png"];
                }
                
                [self.musicImagesSndArray addObject:imageO];

                
            }
                   }
    }

}
-(void)createBooksPoster{
    if (![self.booksPostmult1 isKindOfClass:[NSNull class]]) {
        for(int i=0;i< [booksPostmult1 count]; i++){
            UIImage * imageO;
            UIImage * newImage;
            NSURL *urlO;
                 if ([[[[self.booksPostmult1 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"3"] ){
                     if (![[[[[self.booksPostmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"] isKindOfClass:[NSNull class]]) {
                         urlO=[NSURL URLWithString:[[[[self.booksPostmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"thumbnail"]];
                         
                     }
                     else{
                         urlO=[NSURL URLWithString:[[[[self.booksPostmult1 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]];
                     }

                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
                [self.booksImagesFstArray addObject:imageO];
                
            }
        }
    }
    //
    if (![self.booksPostmult2 isKindOfClass:[NSNull class]]) {
        for(int i=0;i< [booksPostmult2 count]; i++){
            UIImage * imageO;
            UIImage * newImage;
            NSURL *urlO;
                    if ([[[[self.booksPostmult2 objectAtIndex:i]objectForKey:@"Media" ]objectForKey:@"media_type"] isEqualToString:@"3"] ){
                        if (![[[[[self.booksPostmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"] isKindOfClass:[NSNull class]]) {
                            urlO=[NSURL URLWithString:[[[[self.booksPostmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"thumbnail"]];
                            
                        }
                        else{
                           urlO=[NSURL URLWithString:[[[[self.booksPostmult2 objectAtIndex:i]objectForKey:@"Media"]objectForKey:@"book_info"]objectForKey:@"large"]];
                        }
                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
            
                [self.booksImagesSndArray addObject:imageO];
                
            }
        }
    }
}
-(IBAction)musicButtonTapped:(id)sender{
    
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor grayColor];
    activityView.center=self.view.center;
    
    [activityView startAnimating];
    
    [self.view addSubview:activityView];
    activityView.hidesWhenStopped = YES;
    [activityView performSelector:@selector(stopAnimation) withObject:nil afterDelay:10.0];
    musicPostmult1=[NSMutableArray array];
    musicPostmult2=[NSMutableArray array];
 self.musicImagesFstArray=[[NSMutableArray alloc]initWithCapacity:10];
    self.musicImagesSndArray=[[NSMutableArray alloc]initWithCapacity:10];
    [self.musicButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.popularButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.musicView.backgroundColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f];
    self.booksView.backgroundColor=[UIColor grayColor];
    self.movieView.backgroundColor=[UIColor grayColor];
    self.popularView.backgroundColor=[UIColor grayColor];
    self.papularbool=NO;
    self.musicbool=YES;
    self.moviesbool=NO;
    self.booksbool=NO;
     [DiscoveryMusicService sharedInstance].indexValue=[NSString stringWithFormat: @"%ld", (long)self.musicindexValue];
    [[DiscoveryMusicService sharedInstance] musicPostsDetailsServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        if (isError) {
            //alertview
        }
        else{
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.postsArray=[resultDic valueForKey:@"DiscoveryDetail"];
                [postsArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                    if (idx%2==0)
                    {
                        [musicPostmult1 addObject:object];
                    }
                    else
                    {
                        [musicPostmult2 addObject:object];
                    }
                }];
               
                self.leftTableView.delegate=self;
                self.leftTableView.dataSource=self;
                self.rightTableview.delegate=self;
                self.rightTableview.dataSource=self;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.leftTableView reloadData];
                    [self.rightTableview reloadData];
                });

            }
        }
    }];
    NSLog(@"posts1 :%@", postermult1);
      NSLog(@"posts2 :%@", postermult2);
    
}
-(IBAction)moviesButtonTapped:(id)sender{
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor grayColor];
    activityView.center=self.view.center;
    
    [activityView startAnimating];
    
    [self.view addSubview:activityView];
    activityView.hidesWhenStopped = YES;
    [activityView performSelector:@selector(stopAnimation) withObject:nil afterDelay:10.0];
   moviesPostmult1=[NSMutableArray array];
    moviesPostmult2=[NSMutableArray array];
    self.moviesImagesFstArray=[[NSMutableArray alloc]initWithCapacity:10];
    self.moviesImagesSndArray=[[NSMutableArray alloc]initWithCapacity:10];
    

    [self.moviesButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.popularButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

   self.movieView.backgroundColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f];
    self.booksView.backgroundColor=[UIColor grayColor];
   self.musicView.backgroundColor=[UIColor grayColor];
    self.popularView.backgroundColor=[UIColor grayColor];
     self.moviesbool=YES;
    self.papularbool=NO;
    self.musicbool=NO;
    self.booksbool=NO;
     [DiscoveryMoviesServices sharedInstance].indexValue=[NSString stringWithFormat: @"%ld", (long)self.moviesindexValue];
    [[DiscoveryMoviesServices sharedInstance] moviePostsDetailsServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        if (isError) {
            //alertview
        }
        else{
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.postsArray=[resultDic valueForKey:@"DiscoveryDetail"];
                
                [postsArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                    if (idx%2==0)
                    {
                        [moviesPostmult1 addObject:object];
                    }
                    else
                    {
                        [moviesPostmult2 addObject:object];
                    }
                }];
                    self.leftTableView.delegate=self;
                self.leftTableView.dataSource=self;
                self.rightTableview.delegate=self;
                self.rightTableview.dataSource=self;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.leftTableView reloadData];
                    [self.rightTableview reloadData];
                });

            }
        }
    }];
    
}

-(IBAction)booksButtonbTapped:(id)sender{
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor grayColor];
    activityView.center=self.view.center;
    
    [activityView startAnimating];
    
    [self.view addSubview:activityView];
    activityView.hidesWhenStopped = YES;
    [activityView performSelector:@selector(stopAnimation) withObject:nil afterDelay:10.0];
   booksPostmult1=[NSMutableArray array];
    booksPostmult2=[NSMutableArray array];
    self.booksImagesFstArray=[[NSMutableArray alloc]initWithCapacity:10];
    self.booksImagesSndArray=[[NSMutableArray alloc]initWithCapacity:10];
    [self.booksButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.popularButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.booksView.backgroundColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f];
    self.musicView.backgroundColor=[UIColor grayColor];
    self.movieView.backgroundColor=[UIColor grayColor];
    self.popularView.backgroundColor=[UIColor grayColor];
    self.booksbool=YES;
    self.moviesbool=NO;
    self.papularbool=NO;
    self.musicbool=NO;
   
     [DiscoveryBooksServices sharedInstance].indexValue=[NSString stringWithFormat: @"%ld", (long)self.booksindexValue];
    [[DiscoveryBooksServices sharedInstance] bookPostsDetailsServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        if (isError) {
            //alertview
        }
        else{
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.postsArray=[resultDic valueForKey:@"DiscoveryDetail"];
                 [postsArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                    if (idx%2==0)
                    {
                        [booksPostmult1 addObject:object];
                    }
                    else
                    {
                        [booksPostmult2 addObject:object];
                    }
                }];
               
                self.leftTableView.delegate=self;
                self.leftTableView.dataSource=self;
                self.rightTableview.delegate=self;
                self.rightTableview.dataSource=self;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.leftTableView reloadData];
                    [self.rightTableview reloadData];
                });

            }
        }
    }];
    
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
