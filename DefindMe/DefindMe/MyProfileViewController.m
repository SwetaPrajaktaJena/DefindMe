//
//  MyProfileViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 07/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "MyProfileViewController.h"
#import "ProfileLeftTableViewCell.h"
#import "ProfileRightTableViewCell.h"
#import "LeftMenuViewController.h"
#import "SWRevealViewController.h"
#import "FollowerViewController.h"
#import "FeedViewController.h"
#import "LoginService.h"
#import <QuartzCore/QuartzCore.h>
#import "PostService.h"
#import "PostLeftTableViewCell.h"
#import "PostRightTableViewCell.h"
#import "MusiciTuneService.h"
#import "MoviesService.h"
#import "BooksiTuneService.h"
#import "PostingPostViewController.h"
#import "postTableViewCell.h"
#import "PhotosCollectionViewCell.h"
#import "ProfileImageUploadWebservice.h"
#import "AppDelegate.h"
#import "GetUserAlbumService.h"
#import "PhotoLibraryServices.h"
#import "GetUserDataService.h"
#import "GetLikesAndDisLikesMusicService.h"
#import "GetLikesAndDisLikesMovieService.h"
#import "GetLikesAndDisLikesBooksService.h"
#import "PostFollowingService.h"
#import "ModelUser.h"
#import "UnFollowService.h"
#import "DataSaved.h"
#import "PostSelectionViewController.h"
#import "PhotoViewsViewController.h"
@interface MyProfileViewController ()<SWRevealViewControllerDelegate,UIGestureRecognizerDelegate,UISearchDisplayDelegate>
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
@property (nonatomic, assign) NSInteger tagV;
@property (nonatomic, assign)BOOL play;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, assign)NSInteger tagA;
@property (nonatomic, assign)BOOL start;
@property (nonatomic, assign)BOOL likes;
@property (strong, nonatomic) NSMutableArray *arrcontainstate;
@property (nonatomic, strong)NSString * strBookUrl;
@property (nonatomic,assign)BOOL swipeUPVal;
@property (nonatomic,assign)BOOL swipeDWNVal;
@property (nonatomic, strong)AppDelegate * appdelegate;
@property (nonatomic, strong)NSMutableArray * albumArray;
@property (nonatomic, strong)NSMutableDictionary *albumDict;
@property (nonatomic, strong)UISwipeGestureRecognizer * gestureRecognizer;
@property (nonatomic, strong)UISwipeGestureRecognizer *gestureRecognizerDown ;
@property (strong,nonatomic) NSMutableArray *filteredCandyArray;
@property (strong, nonatomic)NSString * strfollow;
@property(nonatomic,strong)NSMutableArray * postIDArray;
@property(nonatomic,strong)NSMutableArray * itemIDArray;
@property (nonatomic, strong)NSMutableArray * postIDMult1;
@property (nonatomic, strong)NSMutableArray * postIDMult2;
@property (nonatomic, strong)NSMutableArray * itemIDMult1;
@property (nonatomic, strong)NSMutableArray * itemIDMult2;

@property (nonatomic, assign)BOOL searchbool;
@end

@implementation MyProfileViewController
@synthesize leftTableView;
@synthesize rightTableView;
@synthesize selectionButton;
@synthesize profileImage;
@synthesize status;
@synthesize strImage;
@synthesize activityView;
@synthesize posterArray;
@synthesize userImageArray;
@synthesize userNameArray;
@synthesize contentArray;
@synthesize timeElapsedArray;
@synthesize artistNameArray;
@synthesize idArray;
@synthesize idValArray;
@synthesize releaseDate;
@synthesize postName;
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
@synthesize play;
@synthesize tagV;
@synthesize listTable;
@synthesize containerView;
@synthesize musicButton;
@synthesize moviesButton;
@synthesize booksButton;
@synthesize backButton;
@synthesize nameArray;
@synthesize titleArray;
@synthesize iconImageArray;
@synthesize searchbar;
@synthesize searchButton;
@synthesize searchLabel;
@synthesize gestureView;
@synthesize bulBooks;
@synthesize bulMovie;
@synthesize bulMusic;
@synthesize audioPlayer;
@synthesize strDate;
@synthesize strName;
@synthesize strTitle;
@synthesize varImage;
@synthesize strtrackId;
@synthesize strLikeAndDislike;
@synthesize strMedia;
@synthesize strContent;
@synthesize tagA;
@synthesize start;
@synthesize feedButton;
@synthesize likes;
@synthesize strBookUrl;
@synthesize swipeDWNVal;
@synthesize swipeUPVal;
@synthesize navigationContainer;
@synthesize photosCollectionView;
@synthesize appdelegate;
@synthesize phototitleArray;
@synthesize albumDict;
@synthesize albumArray;
@synthesize photosContainer;
@synthesize swipeGestureView;
@synthesize gestureRecognizer;
@synthesize gestureRecognizerDown;
@synthesize profileImageParse;
@synthesize photosTransButton;
@synthesize LikesTransButton;
@synthesize feedLabel;
@synthesize photosLabel;
@synthesize likesLabel;
@synthesize musicLabel;
@synthesize MoviesLabel;
@synthesize booksLabel;
@synthesize buttonContainer;
@synthesize photosTouchView;
@synthesize strUID;
@synthesize strUserName;
@synthesize UserDataArray;
@synthesize followingButton;
@synthesize filteredCandyArray;
@synthesize strfollow;
@synthesize followersCount;
@synthesize searchbool;
@synthesize postIDArray;
@synthesize itemIDArray;
@synthesize postIDMult1;
@synthesize postIDMult2;
@synthesize itemIDMult1;
@synthesize itemIDMult2;
@synthesize imageView;
@synthesize picImageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    //Gesture
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor grayColor];
    activityView.center=self.view.center;
    [self.view addSubview:activityView];
    swipeUPVal=YES;
    swipeDWNVal=YES;
    self.likesLabel.hidden=YES;
    self.photosLabel.hidden=YES;
    self.feedLabel.hidden=YES;
    
    self.booksLabel.hidden=YES;
    self.musicLabel.hidden=YES;
    self.MoviesLabel.hidden=YES;
    self.searchbool=NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
   // [self.view bringSubviewToFront:swipeGestureView];
    [self.feedButton addTarget:self  action:@selector(feedButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.musicButton addTarget:self  action:@selector(musicButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
   
   gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    gestureRecognizer.delegate = self;
    [self.swipeGestureView addGestureRecognizer:gestureRecognizer];
    
   
 gestureRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerDown:)];
    gestureRecognizerDown.delegate=self;
    [gestureRecognizerDown setDirection:(UISwipeGestureRecognizerDirectionDown)];
 [self.swipeGestureView addGestureRecognizer:gestureRecognizerDown];
     [self.likesButton addTarget:self action:@selector(likesButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.imageView.hidden=YES;
    // Declare the Gesture Recognizer handler method.
    
       self.likesContainer.hidden=YES;
     self.photosContainer.hidden=YES;
   // self.swipeGestureView.hidden=YES;
    // Do any additional setup after loading the view from its nib.
    [self.leftTableView registerNib:[UINib nibWithNibName:@"PostLeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"CEll"];
    
    [self.rightTableView registerNib:[UINib nibWithNibName:@"PostRightTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
     [self.listTable registerNib:[UINib nibWithNibName:@"postTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
   [self.photosCollectionView registerClass:[PhotosCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    //self.view.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.firstSeparator.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.secondSeparator.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.followingButton.backgroundColor=[UIColor colorWithRed:(184/255.f) green:(233/255.f) blue:(134/255) alpha:1.f];
    self.followingButton.layer.cornerRadius=3.0f;
    selectionButton.layer.cornerRadius=10.f;
    self.profileImage.layer.cornerRadius=40.0f;
     self.profileImage.layer.masksToBounds=YES;
    self.nameArray=[[NSMutableArray alloc]initWithObjects:@"ThemePark",@"Klaxons",@"HIM",@"Bahamas", nil];
    self.titleArray=[[NSMutableArray alloc]initWithObjects:@"Somthing Good",@"Golden Skans",@"Drunk onShadows",@"Bahamas is Afie", nil];
    self.iconImageArray=[[NSMutableArray alloc]initWithObjects:@"pic_1",@"pic_2",@"pic_3",@"pic_4", nil];
    swipeDWNVal=YES;
    swipeUPVal=YES;

    self.searchbar.hidden=YES;
    self.gestureView.hidden=YES;
    self.tooltipView.hidden=YES;
    self.likeView.hidden=YES;
    [self musicButtonTapped:musicButton];
    

      /*
        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://dev.digiinteracts.com/defindme/website/defindme_cdn/image/",[LoginService sharedInstance].strImage,@"_i"]];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.profileImage.image=image;
        });
*/
     play=YES;
    start=NO;
    [self.musicButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    NSLog(@"%@",strImage);
    [activityView performSelector:@selector(startAnimation) withObject:nil afterDelay:0.0];
    [[GetUserDataService sharedInstance] getUserDatawithUSerId:self.strUID withLoginUSerId:[LoginService sharedInstance].uId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            //alertview
        }
        else{
            if (![result isKindOfClass:[NSNull class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"***%@",resultDic);
             self.UserDataArray  =[resultDic objectForKey:@"User"];
                //albumDict=[albumArray objectAtIndex:0];
                if (UserDataArray.count >0) {
                    activityView.hidesWhenStopped = YES;
                    //[activityView performSelector:@selector(stopAnimation) withObject:nil afterDelay:1.0];
                    if(![[self.UserDataArray objectForKey:@"location"] isKindOfClass:[NSNull class]]){
                self.locationLabel.text=[self.UserDataArray objectForKey:@"location"];
                    }
                    else{
                     self.locationLabel.text=@"";
                    }
                self.nameLabel.text=[self.UserDataArray objectForKey:@"name"];
                    self.strfollow=[self.UserDataArray objectForKey:@"is_follow"];
                    self.followersCount.text=[self.UserDataArray objectForKey:@"followCount"];
            [GetUserDataService sharedInstance].userName=[self.UserDataArray objectForKey:@"name"];
                NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[self.UserDataArray objectForKey:@"avatar"],@"_i"]];
                    if ([strfollow isEqualToString:@"1"]) {
                        [self.followingButton setTitle:@"Following" forState:UIControlStateNormal];
                    }
                    else{
                        [self.followingButton setTitle:@"Follow" forState:UIControlStateNormal];
                    }
                NSData *data = [NSData dataWithContentsOfURL:url];
                UIImage *image = [UIImage imageWithData:data];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    self.profileImage.image=image;
                });
                    [self.activityView performSelector:@selector(stopAnimation) withObject:self afterDelay:0.0];

                }
            }
        }

    }];
    [[GetUserAlbumService sharedInstance] GetUserAlbumServiceid:self.strUID withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        
        if (isError) {
            //alertview
        }
        else{
            if (![result isKindOfClass:[NSNull class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"***%@",resultDic);
                albumArray=[resultDic objectForKey:@"albums"];
                //albumDict=[albumArray objectAtIndex:0];
                if (albumArray.count >0) {
                    albumDict=[albumArray objectAtIndex:0];
                }
                
                [PhotoLibraryServices sharedInstance].totalImages=[[albumDict objectForKey:@"Album"] objectForKey:@"total_images"];
                [PhotoLibraryServices sharedInstance].alubumId=[[albumDict objectForKey:@"Album"] objectForKey:@"id"];
                [PhotoLibraryServices sharedInstance].userID=self.strUID;
                [[PhotoLibraryServices sharedInstance] GetUserAlbumServiceidwithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
                    NSLog(@"Result Dic :%@", result);
                    
                    if ([result isKindOfClass:[NSDictionary class]]) {
                        NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                        NSLog(@"Result Dic :%@", resultDic);
                        
                        self.phototitleArray=[resultDic valueForKey:@"imagesDetails"];
            
                            NSLog(@"%@",self.phototitleArray);
                    [self.photosCollectionView registerNib:[UINib nibWithNibName:@"PhotosCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
                            self.photosCollectionView.delegate=self;
                            self.photosCollectionView.dataSource=self;
                            
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.photosCollectionView reloadData];
                        
                            
                        });
                        }
                    
                }];
                
                
            }
        }
    }];
    if ([strUID isEqualToString:[LoginService sharedInstance].uId]) {
        self.followingButton.hidden=YES;
    }
    else{
         self.followingButton.hidden=NO;
    }
   
      NSLog(@"%@",phototitleArray);
    
   // [activityView startAnimating];
    
    
     self.automaticallyAdjustsScrollViewInsets = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.navigationController.interactivePopGestureRecognizer.enabled = false;
    });
    [self feedButtonTapped:feedButton];
    //FollowersButton
    self.selectionButton.hidden=YES;
    
}
-(void)startAnimation{
    [self.activityView startAnimating];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];

}
-(void)stopAnimation{
    [self.activityView stopAnimating];
       [[UIApplication sharedApplication] endIgnoringInteractionEvents];
}
-(void)viewWillAppear:(BOOL)animated{
   [self.navigationController setNavigationBarHidden:YES animated:NO];
     [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
        [self.navigationController.view removeGestureRecognizer:self.navigationController.interactivePopGestureRecognizer];
    
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.gestureView.hidden=YES;
    self.tooltipView.hidden=YES;
    
    [self.listTable reloadData];
   
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    // called only once
    // [searchBar setShowsCancelButton:YES animated:YES];
    
 /*  if (bulMovie) {
        [MoviesService sharedInstance].strSearch=searchbar.text;
        [[MoviesService sharedInstance] moviesServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            NSLog(@"Result Dic :%@", result);
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.titleArray=[resultDic valueForKey:@"movies"];
                self.iconImageArray=[resultDic valueForKey:@"movies"];
                NSLog(@"*** %@",self.titleArray);
                self.listTable.delegate=self;
                self.listTable.dataSource=self;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.listTable reloadData];
                });
            }else{
                //Create Alert for error
            }
        }];
        [searchbar resignFirstResponder];
    }
    if (bulMusic) {
        [MusiciTuneService sharedInstance].strSearch=searchbar.text;
        [[MusiciTuneService sharedInstance] musicServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            
            NSLog(@"Result Dic :%@", result);
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.titleArray=[resultDic valueForKey:@"results"];
                self.listTable.delegate=self;
                self.listTable.dataSource=self;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.listTable reloadData];
                });
                
            }else{
                //Create Alert for error
            }
        }];
        [searchbar resignFirstResponder];
    }
    if (bulBooks) {
        [BooksiTuneService sharedInstance].strSearch=searchbar.text;
        [[BooksiTuneService sharedInstance]bookServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            NSLog(@"Result Dic :%@", result);
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.titleArray=[resultDic objectForKey:@"items"];
                NSLog(@"**** :%@", self.titleArray);
                self.listTable.delegate=self;
                self.listTable.dataSource=self;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.listTable reloadData];
                });
                
            }else{
                //Create Alert for error
            }
        }];
        [searchbar resignFirstResponder];
    }
 */
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    // called only once
    [searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    self.searchbar.hidden=YES;
    searchLabel.hidden=NO;
    searchButton.hidden=NO;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
      if (bulMovie) {
        [audioPlayer stop];
        [GetLikesAndDisLikesMovieService sharedInstance].moviesLike=self.strUID;
          [GetLikesAndDisLikesMovieService sharedInstance].strSearch=searchBar.text;
          
        [[GetLikesAndDisLikesMovieService sharedInstance] getLikePostswithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                
                NSLog(@"Result Dic :%@", resultDic);
                
                self.titleArray=[resultDic valueForKey:@"LikeDetail"];
                NSLog(@"*** %@",self.titleArray);
                
                self.listTable.delegate=self;
                
                self.listTable.dataSource=self;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.listTable reloadData];
                    
                });
                
            }else{
                
                //Create Alert for error
                
            }
            
        }];
        

        [searchbar resignFirstResponder];
    }
    if (bulMusic) {
        [audioPlayer stop];
        [GetLikesAndDisLikesMusicService sharedInstance].musiclike=self.strUID;
        [GetLikesAndDisLikesMusicService sharedInstance].strSearch=searchBar.text;
        [[GetLikesAndDisLikesMusicService sharedInstance] getLikePostswithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                
                NSLog(@"Result Dic :%@", resultDic);
                
                self.titleArray=[resultDic valueForKey:@"LikeDetail"];
                
                NSLog(@"*** %@",self.titleArray);
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.listTable reloadData];
                    
                });
                
            }else{
                
                //Create Alert for error
                
            }
            
        }];
        [searchbar resignFirstResponder];
    }
    if (bulBooks) {
        [audioPlayer stop];
        [GetLikesAndDisLikesBooksService sharedInstance].booksLike=self.strUID;
        [GetLikesAndDisLikesBooksService sharedInstance].strSearch=searchBar.text;
        [[GetLikesAndDisLikesBooksService sharedInstance] getLikePostswithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                
                NSLog(@"Result Dic :%@", resultDic);
                
                self.titleArray=[resultDic valueForKey:@"LikeDetail"];
                
                NSLog(@"*** %@",self.titleArray);
                
                self.listTable.delegate=self;
                
                self.listTable.dataSource=self;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.listTable reloadData];
                    
                });
                
            }else{
                
                //Create Alert for error
                
            }
            
        }];
        [searchbar resignFirstResponder];
    }
   
    // called only once
}
- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    [searchbar resignFirstResponder];
}
-(IBAction)searchButtonTapped:(id)sender{
    
    self.searchbar.hidden=NO;
    
    searchLabel.hidden=YES;
    searchButton.hidden=YES;
    //self.searchbool=YES;
    self.searchbar.delegate=self;
    [self.searchbar becomeFirstResponder];
}
-(IBAction)likeButtonTapped:(id)sender{
   
    PostingPostViewController * postingPostVC=[[PostingPostViewController alloc]initWithNibName:@"PostingPostViewController" bundle:nil];
    postingPostVC.postTitleStr=self.strTitle;
    postingPostVC.postNameStr=self.strName;
    postingPostVC.postDateStr=self.strDate;
    postingPostVC.postIconImage=self.varImage;
    NSString * strF=@"<{";
    NSString * strL=@"}>";
    NSString * strM=@",";
    self.strContent=[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@",strF,strMedia,strM,self.strtrackId,strM,@"1",strM,[LoginService sharedInstance].uId,strL];
    NSLog(@"*** %@",self.strContent);
    postingPostVC.postTrackIdStr=self.strtrackId;
    postingPostVC.postContentStr=self.strContent;
    postingPostVC.strType=self.strMedia;
   // self.leftTableView.hidden=YES;
    [self.navigationController pushViewController:postingPostVC animated:NO];
    
}
-(IBAction)dislikeButtonTapped:(id)sender{
    PostingPostViewController * postingPostVC=[[PostingPostViewController alloc]initWithNibName:@"PostingPostViewController" bundle:nil];
    [self.navigationController pushViewController:postingPostVC animated:NO];
    postingPostVC.postTitleStr=self.strTitle;
    postingPostVC.postNameStr=self.strName;
    postingPostVC.postDateStr=self.strDate;
    postingPostVC.postIconImage=self.varImage;
    NSString * strF=@"<{";
    NSString * strL=@"}>";
    NSString * strM=@",";
    self.strContent=[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@",strF,strMedia,strM,self.strtrackId,strM,@"-1",strM,[LoginService sharedInstance].uId,strL];
    NSLog(@"*** %@",self.strContent);
    postingPostVC.postContentStr=self.strContent;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:leftTableView]) {
        return [imagemult1 count];
    }
    
      else if ([tableView isEqual:listTable]) {
         
             return [titleArray count];
    
    }
      else{
          return [imagemult2 count];
      }
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"%@",self.phototitleArray);
    return [self.phototitleArray count];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(PhotosCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotosCollectionViewCell *cell = [self.photosCollectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    // NSData* imageData = [ objectAtIndex:indexPath.row];
    // UIImage* image = [UIImage imageWithData:imageData];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        
        NSString * picId=[[[self.phototitleArray objectAtIndex:indexPath.row]objectForKey:@"Image"] objectForKey:@"id"];
        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",picId,@"_f"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
       cell.photoImgVw.layer.cornerRadius=20.0f;
       cell.photoImgVw.layer.masksToBounds=YES;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.photoImgVw.image=image;
        });
        
    });
    cell.photoButton.tag=indexPath.item;
    [cell.photoButton addTarget:self action:@selector(picButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)picButtonTapped:(UIButton *)sender{
    PhotoViewsViewController * PhotoVC=[[PhotoViewsViewController alloc]initWithNibName:@"PhotoViewsViewController" bundle:nil];
    PhotoVC.nameStr=self.nameLabel.text;
    PhotoVC.locationStr=self.locationLabel.text;
    PhotoVC.userparseImage=self.profileImage.image;
    NSString * picId=[[[self.phototitleArray objectAtIndex:sender.tag]objectForKey:@"Image"] objectForKey:@"id"];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",picId,@"_f"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    PhotoVC.fullparseImage=image;
    [self.navigationController pushViewController:PhotoVC animated:NO];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIdF = @"CEll";
    static NSString* cellIdS = @"CELL";
    static NSString* cellIdT = @"Cell";
    PostLeftTableViewCell * cellF=[leftTableView dequeueReusableCellWithIdentifier:cellIdF];
    PostRightTableViewCell * cellS=[rightTableView dequeueReusableCellWithIdentifier:cellIdS];
    postTableViewCell * cell=[listTable dequeueReusableCellWithIdentifier:cellIdT];

    // PostRightTableViewCell * cellS=[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if ([tableView isEqual:leftTableView]) {
        if (cellF==nil) {
            cellF=[[PostLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdF];
            //cellF.vedioButton.tag=indexPath.row;
        }
        
        if (![[self.imagemult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            [cellF.postImage setContentMode:UIViewContentModeScaleToFill];
            cellF.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            cellF.postImage.layer.masksToBounds = YES;
            
            [cellF.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [cellF.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            cellF.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
            // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
            cellF.profileButton.tag=indexPath.row;
            [cellF.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
            cellF.iconImage.layer.cornerRadius =17;
            cellF.iconImage.layer.masksToBounds=YES;
            cellF.userNameLabel.text=[self.namemult1 objectAtIndex:indexPath.row];
            //cellF.timeLabel.text=[self.timeElapsedmult1 objectAtIndex:indexPath.row];
        }
        //cellF.iconImage.image=[UIImage imageWithData:[imageContainer objectAtIndex:indexPath.row]];
        
        if (![[self.mediaKindmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            if ([[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"kind"] isEqualToString:@"song"]) {
                cellF.artstName.text=[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"artistName"];
                cellF.collectionNAME.text=[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"trackName"];
                NSScanner *scanner = [NSScanner scannerWithString:[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"releaseDate"]];
                NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                NSString * result;
                [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                cellF.releaseDateLabel.text=result;
                cellF.commentbuttom.constant=1;
                [cellF.vedioButton setHidden:NO];
                
                //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                dispatch_async(queue, ^{
                    UIImage *imageO;
                    UIImage *imageF;
                    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[imagemult1 objectAtIndex:indexPath.row],@"_i"]];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    if (![[self.mediaKindmult1 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                        NSURL *urlO=[NSURL URLWithString:[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"artworkUrl100"]];
                        
                        NSData *data = [NSData dataWithContentsOfURL:urlO];
                        
                        imageO = [UIImage imageWithData:data];
                        
                    }
                    else{
                        imageF = [UIImage imageNamed:@"pic 1.png"];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        cellF.iconImage.image=image;
                        if (![[self.mediaKindmult1 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                            cellF.postImage.image=imageO;
                        }
                        else{
                            cellF.postImage.image=imageF;
                        }
                        
                    });
                });
                [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
                if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                    NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                    UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                    
                    [cellF.contentView setFrame:CGRectMake(0, 0, 156,270)];
                    cellF.contentLabel.text=[[self.commentsmult1 objectAtIndex:indexPath.row] substringWithRange: NSMakeRange(0, [[self.commentsmult1 objectAtIndex:indexPath.row] rangeOfString: @"<"].location)];
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
            if ([[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"kind"] isEqualToString:@"Movie"]) {
                if (![[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"] isKindOfClass:[NSNull class]]) {
                    //cellF.artstName.text=[[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"]objectAtIndex:0]objectForKey:@"name"];
                    cellF.collectionNAME.text=[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"title"];
                    NSScanner *scanner = [NSScanner scannerWithString:[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"releaseDate"]];
                    NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                    NSString * result;
                    [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                    cellS.releaseDateLabel.text=result;
                    
                    //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                    dispatch_async(queue, ^{
                        UIImage *imageO;
                        UIImage *imageF;
                        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[imagemult1 objectAtIndex:indexPath.row],@"_i"]];
                        NSData *data = [NSData dataWithContentsOfURL:url];
                        UIImage *image = [UIImage imageWithData:data];
                        if (![[self.mediaKindmult1 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                            NSString * movieStr=[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"posters"]objectForKey:@"thumbnail"];
                            NSRange r1 = [movieStr rangeOfString:@"movie"];
                            NSString *substr = [movieStr substringFromIndex:r1.location];
                            
                            
                           NSURL *urlO=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]];
                       // NSURL *urlO=[NSURL URLWithString:movieStr];
                            NSData *data = [NSData dataWithContentsOfURL:urlO];
                            
                            imageO = [UIImage imageWithData:data];
                            
                        }
                        else{
                            imageF = [UIImage imageNamed:@"pic 1.png"];
                        }
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            cellF.iconImage.image=image;
                            if (![[self.mediaKindmult1 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                              //  cellF.postImage.image=imageO;
                                [cellF setNeedsDisplay];
                            }
                            else{
                              //  cellF.postImage.image=imageF;
                            }
                            
                        });
                    });
                    [cellF.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                    [cellF.contentView setFrame:CGRectMake(0, 0, 156,307)];
                    [cellF.vedioButton setHidden:YES];
                    self.leftTableView.rowHeight=307;
                    cellF.posterHeightConstraint.constant=210;
                    if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                        NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                        UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                        
                        [cellF.contentView setFrame:CGRectMake(0, 0, 156,320)];
                        cellF.contentLabel.text=[[self.commentsmult1 objectAtIndex:indexPath.row] substringWithRange: NSMakeRange(0, [[self.commentsmult1 objectAtIndex:indexPath.row] rangeOfString: @"<"].location)];
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cView.tag=indexPath.row;
                        
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
            if ([[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"kind"] isEqualToString:@"books#volume"] ) {
                cellF.artstName.text=[[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"volumeInfo"]objectForKey:@"authors"]objectAtIndex:0];
                cellF.collectionNAME.text=[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"volumeInfo"]objectForKey:@"title"];
                
                NSScanner *scanner = [NSScanner scannerWithString:[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"releaseDate"]];
                NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                NSString * result;
                [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                cellF.releaseDateLabel.text=result;
                [cellF.vedioButton setHidden:YES];
                //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                dispatch_async(queue, ^{
                    UIImage *imageO;
                    UIImage *imageF;
                    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[imagemult1 objectAtIndex:indexPath.row],@"_i"]];
                    
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    if (![[self.mediaKindmult1 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                        NSURL *urlO=[NSURL URLWithString:[[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"volumeInfo" ]objectForKey:@"imageLinks"]objectForKey:@"smallThumbnail"]];
                        
                        NSData *data = [NSData dataWithContentsOfURL:urlO];
                        
                        imageO = [UIImage imageWithData:data];
                        
                    }
                    else{
                        imageF = [UIImage imageNamed:@"pic 1.png"];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        cellF.iconImage.image=image;
                        if (![[self.mediaKindmult1 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                            
                           cellF.postImage.image=imageO;
                            [cellF setNeedsDisplay];
                        }
                        else{
                            //cellF.postImage.image=imageF;
                        }
                        
                    });
                });
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
                    cellF.contentLabel.text=[[self.commentsmult1 objectAtIndex:indexPath.row] substringWithRange: NSMakeRange(0, [[self.commentsmult1 objectAtIndex:indexPath.row] rangeOfString: @"<"].location)];
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
        
        else{
            cellF.artstName.text=@"Sunny";
            cellF.releaseDateLabel.text=@"2015";
            cellF.collectionNAME.text=@"Human Live Nuit Hypnotique";
            [cellF.vedioButton setHidden:YES];
        }
        
        //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
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
        
        
        return cellF;
        
        
    }
    else if([tableView isEqual:rightTableView]){
        if (cellS== nil) {
            // cellS=[[PostRightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdS];
            // [cellS.profileButton setImage:[UIImage imageNamed:[userImageArray objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
            
        }
        
        [cellS.postImage setContentMode:UIViewContentModeScaleToFill];
        cellS.postImage.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        cellS.postImage.clipsToBounds = YES;
        
        cellS.iconImage.layer.cornerRadius = 17;
        cellS.iconImage.layer.masksToBounds=YES;
        [cellS.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        if (![[self.imagemult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
            cellS.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
            cellS.profileButton.tag=indexPath.row;
            [cellS.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            // cellF.postImage.image=[UIImage imageNamed:[discoverMusicArray objectAtIndex:indexPath.row]];
            [cellS.profileButton addTarget:self action:@selector(profileButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            //[cellF.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
            cellS.userNameLabel.text=[self.namemult2 objectAtIndex:indexPath.row];
            cellS.timeLabel.text=[self.timeElapsedmult2 objectAtIndex:indexPath.row];
            if ([audioPlayerS play]) {
                if (indexPath.row == tagV) {
                    [cellS.vedioButton setBackgroundImage:[UIImage imageNamed:@"stop button"] forState:UIControlStateNormal];
                }
            }
        }
        //[cellS.profileButton setImage:[UIImage imageWithData:imageData] forState:UIControlStateNormal];
        if ((![[self.mediaKindmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) && (![[self.timeElapsedmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]))
        {
            if ([[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"kind"] isEqualToString:@"song"] ) {
                cellS.artstName.text=[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"artistName"];
                cellS.collectionNAME.text=[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"trackName"];
                NSScanner *scanner = [NSScanner scannerWithString:[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"releaseDate"]];
                NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                NSString * result;
                [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                cellS.releaseDateLabel.text=result;
                cellS.userNameLabel.text=[self.namemult2 objectAtIndex:indexPath.row];
                //cellF.commentbuttom.constant=5;
                [cellS.vedioButton setHidden:NO];
                cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                //cellS.posterHeightConstraint.constant=155;
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                dispatch_async(queue, ^{
                    UIImage *imageO;
                    UIImage *imageF;
                    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[imagemult2 objectAtIndex:indexPath.row],@"_i"]];
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    if (![[self.mediaKindmult2 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                        NSURL *urlO=[NSURL URLWithString:[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"artworkUrl100"]];
                        
                        NSData *data = [NSData dataWithContentsOfURL:urlO];
                        
                        imageO = [UIImage imageWithData:data];
                        
                    }
                    else{
                        imageF = [UIImage imageNamed:@"pic 1.png"];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        cellS.iconImage.image=image;
                        if (![[self.mediaKindmult2 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                            cellS.postImage.image=imageO;
                        }
                        else{
                            // cellS.postImage.image=imageF;
                        }
                        
                    });
                });
                //cellS.posterHeightConstraint.constant=155;
                [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"music"] forState:UIControlStateNormal];
                if (![[self.commentsmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                    
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,270)];
                    NSString * str=[self.commentsmult2 objectAtIndex:indexPath.row];
                    
                    cellS.contentLabel.text=[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)];
                    rightTableView.rowHeight=270;
                    cellS.commentbuttom.constant=7;
                    cellS.lolevelTop.constant=0;
                    cellS.commentLabelHeightConstraint.constant=17;
                    cellS.posterHeightConstraint.constant=155;
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,255)];
                        rightTableView.rowHeight=255;
                        cellS.commentLabelHeightConstraint.constant=1;
                        cellS.commentbuttom.constant=0;
                        cellS.contentLabel.backgroundColor=[UIColor clearColor];
                        
                    }
                    
                }
                
            }
            if ([[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"kind"] isEqualToString:@"Movie"]) {
                if (![[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"] isKindOfClass:[NSNull class]]) {
                    //cellF.artstName.text=[[[[self.mediaKindmult1 objectAtIndex:indexPath.row]objectForKey:@"abridged_cast"]objectAtIndex:0]objectForKey:@"name"];
                    cellS.collectionNAME.text=[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"title"];
                    NSScanner *scanner = [NSScanner scannerWithString:[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"releaseDate"]];
                    NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                    NSString * result;
                    [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                    cellS.releaseDateLabel.text=result;
                        
                    //cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                    dispatch_async(queue, ^{
                        UIImage *imageO;
                        UIImage *imageF;
                        UIImage * newImage;
                        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[imagemult2 objectAtIndex:indexPath.row],@"_i"]];
                        NSData *data = [NSData dataWithContentsOfURL:url];
                        UIImage *image = [UIImage imageWithData:data];
                        if (![[self.mediaKindmult2 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                            NSString * movieStr=[[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"posters"]objectForKey:@"thumbnail"];
                            NSRange r1 = [movieStr rangeOfString:@"movie"];
                            NSString *substr = [movieStr substringFromIndex:r1.location];
                            
                            
                            NSURL *urlO=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr]];
                            // NSURL *urlO=[NSURL URLWithString:movieStr];
                            NSData *data = [NSData dataWithContentsOfURL:urlO];
                            
                            imageO = [UIImage imageWithData:data];
                            CGSize newSize = CGSizeMake(300.0f,300.0f);
                            UIGraphicsBeginImageContext(newSize);
                            [imageO drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
                            newImage = UIGraphicsGetImageFromCurrentImageContext();
                        }
                        else{
                            imageF = [UIImage imageNamed:@"pic 1.png"];
                        }
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            cellS.iconImage.image=image;
                            if (![[self.mediaKindmult2 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                                cellS.postImage.image=imageO;
                                //[cellF setNeedsDisplay];
                            }
                            else{
                                //   cellF.postImage.image=imageF;
                            }
                            
                        });
                    });
                    [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"movie"] forState:UIControlStateNormal];
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                    [cellS.vedioButton setHidden:YES];
                    self.leftTableView.rowHeight=307;
                    cellS.posterHeightConstraint.constant=210;
                    if (![[self.commentsmult1 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                        NSString * str=[self.commentsmult1 objectAtIndex:indexPath.row];
                        UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                        
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,320)];
                        cellS.contentLabel.text=[[self.commentsmult2 objectAtIndex:indexPath.row] substringWithRange: NSMakeRange(0, [[self.commentsmult1 objectAtIndex:indexPath.row] rangeOfString: @"<"].location)];
                        NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                        cView.tag=indexPath.row;
                        
                        cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                        cellS.commentbuttom.constant=5;
                        cellS.commentLabelHeightConstraint.constant=17;
                        cellS.lolevelTop.constant=0;
                        
                       rightTableView.rowHeight=320;
                        if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                            commentTags=indexPath.row;
                            [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                            cellS.commentbuttom.constant=2;
                            cellS.commentLabelHeightConstraint.constant=1;
                            rightTableView.rowHeight=307;
                            cellS.contentLabel.backgroundColor=[UIColor clearColor];
                        }
                    }
                }
            }
            
            if ([[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"kind"] isEqualToString:@"books#volume"] ) {
                cellS.artstName.text=[[[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"volumeInfo"]objectForKey:@"authors"]objectAtIndex:0];
                cellS.collectionNAME.text=[[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"volumeInfo"]objectForKey:@"title"];
                cellS.releaseDateLabel.text=[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"year"];
                // cellF.releaseDateLabel.text=[[self.releaseDate objectAtIndex:indexPath.row]substringToIndex:3];
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                dispatch_async(queue, ^{
                    UIImage *imageO;
                    UIImage *imageF;
                    UIImage * newImage;
                    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[imagemult2 objectAtIndex:indexPath.row],@"_i"]];
                    
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    if (![[self.mediaKindmult2 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                        
                        NSURL *urlO=[NSURL URLWithString:[[[[self.mediaKindmult2 objectAtIndex:indexPath.row]objectForKey:@"volumeInfo" ]objectForKey:@"imageLinks"]objectForKey:@"smallThumbnail"]];
                        
                        NSData *data = [NSData dataWithContentsOfURL:urlO];
                        
                        imageO = [UIImage imageWithData:data];
                        CGSize newSize = CGSizeMake(300.0f,300.0f);
                        UIGraphicsBeginImageContext(newSize);
                        [imageO drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
                        newImage = UIGraphicsGetImageFromCurrentImageContext();
                    }
                    else{
                        imageF = [UIImage imageNamed:@"pic 1.png"];
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        cellS.iconImage.image=image;
                        if (![[self.mediaKindmult2 objectAtIndex:indexPath.row] isKindOfClass:[NSNull class]]) {
                            
                            cellS.postImage.image=imageO;
                            
                        }
                        else{
                            // cellS.postImage.image=imageF;
                        }
                        
                    });
                });
                [cellS.contentView setFrame:CGRectMake(0, 0, 156,307)];
                self.rightTableView.rowHeight=307;
                cellS.posterHeightConstraint.constant=210;
                [cellS.vedioButton setHidden:YES];
                [cellS.iconButton setBackgroundImage:[UIImage imageNamed:@"book"] forState:UIControlStateNormal];
                //cellS.mediaType=@"Book";
                if (![[self.commentsmult2 objectAtIndex:indexPath.row]isKindOfClass:[NSNull class]]) {
                    NSString * str=[self.commentsmult2 objectAtIndex:indexPath.row];
                    UILabel *cView = (UILabel *)[cellF viewWithTag:1];
                    
                    [cellS.contentView setFrame:CGRectMake(0, 0, 156,320)];
                    cellS.contentLabel.text=[[self.commentsmult2 objectAtIndex:indexPath.row] substringWithRange: NSMakeRange(0, [[self.commentsmult2 objectAtIndex:indexPath.row] rangeOfString: @"<"].location)];
                    NSLog(@"*****%@",[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)]);
                    cView.tag=indexPath.row;
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.contentLabel.backgroundColor=[UIColor whiteColor];
                    cellS.commentbuttom.constant=5;
                    cellS.commentLabelHeightConstraint.constant=17;
                    cellS.lolevelTop.constant=0;
                    rightTableView.rowHeight=320;
                    if ([[str substringWithRange: NSMakeRange(0, [str rangeOfString: @"<"].location)] isEqualToString:@""]) {
                        commentTags=indexPath.row;
                        [cellS.contentView setFrame:CGRectMake(0, 0, 156,305)];
                        cellS.commentbuttom.constant=2;
                        cellS.commentLabelHeightConstraint.constant=1;
                        rightTableView.rowHeight=305;
                        cellS.contentLabel.backgroundColor=[UIColor clearColor];
                        
                    }
                    
                }
                
            }
            
            
        }
        else{
            cellS.artstName.text=@"Sunny";
            cellS.releaseDateLabel.text=@"2015";
            //cellS.collectionNAME.text=[self.postNamemult2 objectAtIndex:indexPath.row];
            [cellS.vedioButton setHidden:YES];
            
            
        }
        
        
        //cellS.postImage.image=[UIImage imageNamed:[discoverVedioArray objectAtIndex:indexPath.row]];
        
        //[cellS.settingButton addTarget:self action:@selector(settingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
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
        [cellS.selectionButton addTarget:self action:@selector(rihtSelectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        //Audi
        
        return cellS;
    }
    
   else if ([tableView isEqual:listTable]) {

        
        if (!cell) {
             cell=[[postTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdT];
        }
        if (bulMovie) {
            //cell.nameLabel.text=[nameArray objectAtIndex:indexPath.row];
            
                [cell.playButton setHidden:YES];
                cell.headerLabel.text=[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"]objectForKey:@"title"];
                self.strMedia=@"MEDIA:2";
                
                NSString * strUrl=[[[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"] objectForKey:@"movie_info"] objectForKey:@"posters"]objectForKey:@"thumbnail"];
                
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                dispatch_async(queue, ^{
                    
                    NSURL *url=[NSURL URLWithString:strUrl];
                    
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        cell.iconImage.image=image;
                        
                    });
                });
  
            }
       
        if (bulMusic) {
            
                cell.headerLabel.text=[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"] objectForKey:@"trackName"];
                NSScanner *scanner = [NSScanner scannerWithString:[[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"]objectForKey:@"music_info"] objectForKey:@"releaseDate"]];
                NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                NSString * result;
                [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                self.strMedia=@"MEDIA:1";
                cell.timeLabel.text=result;
                NSString * strNAME=[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"]objectForKey:@"artistName"];
                cell.nameLabel.text=[NSString stringWithFormat:@"%@%@",@"by ",strNAME];
                
                if ([cell.playerButton isTouchInside]) {
                    
                    //[self.audioPlayer stop];
                }
                NSString * strUrl=[[[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"] objectForKey:@"music_info" ]objectForKey:@"artworkUrl"]objectAtIndex:2];
                
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                dispatch_async(queue, ^{
                    
                    NSURL *url=[NSURL URLWithString:strUrl];
                    
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        cell.iconImage.image=image;
                        
                        
                    });
                    
                });
            
            [cell.playButton setHidden:NO];
            cell.playButton.tag=indexPath.row;
            
            if ([audioPlayer play]) {
                
                if (indexPath.row == tagA) {
                    
                    [cell.playButton setImage:[UIImage imageNamed:@"stop-1"] forState:UIControlStateNormal];
                    play=NO;
                }
                else{
                    [cell.playButton setImage:[UIImage imageNamed:@"play-4"] forState:UIControlStateNormal];
                }
                
            }
            else{
                if (indexPath.row == tagA) {
                    [cell.playButton setSelected:NO];
                    [cell.playButton setBackgroundImage:[UIImage imageNamed:@"play-4"] forState:UIControlStateNormal];
                    
                }
            }
            [cell.playButton addTarget:self action:@selector(buttonPressedAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        if (bulBooks) {
           
              //  NSArray * authorArray=
               // NSLog(@"___%@",authorArray);
              //  NSString * authorName=[authorArray objectAtIndex:0];
                cell.nameLabel.text=[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"]objectForKey:@"authors"];
                
                cell.headerLabel                                                                                                                                                                                                                                                                                                             .text=[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"]objectForKey:@"title"];
                self.strMedia=@"MEDIA:3";
                
                [cell.playButton setImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];
               /* NSScanner *scanner = [NSScanner scannerWithString:[[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"]objectForKey:@"volumeInfo"]objectForKey:@"publishedDate"]];
                NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
                NSString * result;
                [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
                
                cell.timeLabel.text=result;*/
                NSString * strUrl=[[[[titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"]objectForKey:@"book_info" ] objectForKey:@"thumbnail"];
                
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
                dispatch_async(queue, ^{
                    
                    NSURL *url=[NSURL URLWithString:strUrl];
                    
                    NSData *data = [NSData dataWithContentsOfURL:url];
                    UIImage *image = [UIImage imageWithData:data];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        cell.iconImage.image=image;
                        [cell.playButton setHidden:YES];
                        cell.playButton.tag=indexPath.row;
                        
                    });
                });
 
            }
       
        
        tableView.separatorColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1];
      
    }
      return cell;
}
-(void)selectionButtonTapped:(UIButton *)sender{
    [self.audioPlayerF stop];
    [self.audioPlayerS stop];
    if ([[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"song"]) {
        [DataSaved sharedInstance].strArtist=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"artistName"];
        [DataSaved sharedInstance].strTitle=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"trackName"];
        [DataSaved sharedInstance].strName=[self.namemult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strTime=[self.timeElapsedmult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strProfileImage=[imagemult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strPoster=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"artworkUrl100"];
        [DataSaved sharedInstance].strAudioUrl=[self.strURLArraymult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strPostId=[self.postIDMult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strmediaType=@"1";
        [DataSaved sharedInstance].strItemUserId=self.strUID;
        [DataSaved sharedInstance].strMediaId=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"trackId"];
        [DataSaved sharedInstance].strItemId=[self.itemIDMult1 objectAtIndex:sender.tag];
    }
    if ([[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"Movie"]) {
        [DataSaved sharedInstance].strTitle=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"title"];
        [DataSaved sharedInstance].strName=[self.namemult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strTime=[self.timeElapsedmult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strProfileImage=[imagemult1 objectAtIndex:sender.tag];
        NSString * movieStr=[[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"posters"]objectForKey:@"thumbnail"];
        NSRange r1 = [movieStr rangeOfString:@"movie"];
        NSString *substr = [movieStr substringFromIndex:r1.location];
        [DataSaved sharedInstance].strPoster=[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr];
        [DataSaved sharedInstance].strPostId=[self.postIDMult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strmediaType=@"2";
        [DataSaved sharedInstance].strItemUserId=self.strUID;
        [DataSaved sharedInstance].strMediaId=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"id"];
        [DataSaved sharedInstance].strItemId=[self.itemIDMult1 objectAtIndex:sender.tag];
        
    }
    if ([[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"books#volume"] ){
        [DataSaved sharedInstance].strArtist=[[[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"volumeInfo"]objectForKey:@"authors"]objectAtIndex:0];
        [DataSaved sharedInstance].strTitle=[[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"volumeInfo"]objectForKey:@"title"];
        [DataSaved sharedInstance].strName=[self.namemult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strTime=[self.timeElapsedmult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strProfileImage=[imagemult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strPoster=[[[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"volumeInfo" ]objectForKey:@"imageLinks"]objectForKey:@"smallThumbnail"];
        [DataSaved sharedInstance].strPostId=[self.postIDMult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strmediaType=@"3";
        [DataSaved sharedInstance].strItemUserId=self.strUID;
        [DataSaved sharedInstance].strMediaId=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"id"];
        
        [DataSaved sharedInstance].strItemId=[self.itemIDMult1 objectAtIndex:sender.tag];
        
    }
    if ([[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"Photo"]) {
        [DataSaved sharedInstance].strArtist=@"";
        [DataSaved sharedInstance].strTitle=@"";
        [DataSaved sharedInstance].strName=[self.namemult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strTime=[self.timeElapsedmult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strProfileImage=[imagemult1 objectAtIndex:sender.tag];
        NSString * photoStr=[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"photo"];
        [DataSaved sharedInstance].strPoster =[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",photoStr,@"_f"];
        [DataSaved sharedInstance].strPostId=[self.postIDMult1 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strItemUserId=self.strUID;
        //[DataSaved sharedInstance].strMediaId=[[[self.mediaKindmult1 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"media_id"];
        [DataSaved sharedInstance].strItemId=[self.itemIDMult1 objectAtIndex:sender.tag];
        
        
    }
    PostSelectionViewController * selectionVC=[[PostSelectionViewController alloc]initWithNibName:@"PostSelectionViewController" bundle:nil];
    [self.navigationController pushViewController:selectionVC animated:NO];
}
-(void)rihtSelectionButtonTapped:(UIButton *)sender{
    [self.audioPlayerF stop];
    [self.audioPlayerS stop];
    if ([[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"song"]) {
        [DataSaved sharedInstance].strArtist=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"artistName"];
        [DataSaved sharedInstance].strTitle=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"trackName"];
        [DataSaved sharedInstance].strName=[self.namemult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strTime=[self.timeElapsedmult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strProfileImage=[imagemult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strPoster=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"artworkUrl100"];
        [DataSaved sharedInstance].strPostId=[self.postIDMult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strmediaType=@"1";
        [DataSaved sharedInstance].strItemUserId=self.strUID;
        [DataSaved sharedInstance].strMediaId=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"trackId"];
        [DataSaved sharedInstance].strItemId=[self.itemIDMult2 objectAtIndex:sender.tag];
        
    }
    if ([[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"Movie"]) {
        [DataSaved sharedInstance].strTitle=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"title"];
        [DataSaved sharedInstance].strName=[self.namemult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strTime=[self.timeElapsedmult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strProfileImage=[imagemult2 objectAtIndex:sender.tag];
        NSString * movieStr=[[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"posters"]objectForKey:@"thumbnail"];
        NSRange r1 = [movieStr rangeOfString:@"movie"];
        NSString *substr = [movieStr substringFromIndex:r1.location];
        [DataSaved sharedInstance].strPoster=[NSString stringWithFormat:@"%@%@",@"http://content6.flixster.com/",substr];
        [DataSaved sharedInstance].strPostId=[self.postIDMult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strmediaType=@"2";
        [DataSaved sharedInstance].strItemUserId=self.strUID;
        [DataSaved sharedInstance].strMediaId=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"id"];
        [DataSaved sharedInstance].strItemId=[self.itemIDMult2 objectAtIndex:sender.tag];
    }
    if ([[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"books#volume"] ){
        [DataSaved sharedInstance].strArtist=[[[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"volumeInfo"]objectForKey:@"authors"]objectAtIndex:0];
        [DataSaved sharedInstance].strTitle=[[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"volumeInfo"]objectForKey:@"title"];
        [DataSaved sharedInstance].strName=[self.namemult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strTime=[self.timeElapsedmult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strProfileImage=[imagemult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strPoster=[[[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"volumeInfo" ]objectForKey:@"imageLinks"]objectForKey:@"smallThumbnail"];
        [DataSaved sharedInstance].strPostId=[self.postIDMult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strmediaType=@"3";
        [DataSaved sharedInstance].strItemUserId=self.strUID;
        [DataSaved sharedInstance].strMediaId=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"id"];
        [DataSaved sharedInstance].strItemId=[self.itemIDMult2 objectAtIndex:sender.tag];
    }
    if ([[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"kind"] isEqualToString:@"Photo"]) {
        [DataSaved sharedInstance].strArtist=@"";
        [DataSaved sharedInstance].strTitle=@"";
        [DataSaved sharedInstance].strName=[self.namemult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strTime=[self.timeElapsedmult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strProfileImage=[imagemult2 objectAtIndex:sender.tag];
        NSString * photoStr=[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"photo"];
        [DataSaved sharedInstance].strPoster =[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",photoStr,@"_f"];
        [DataSaved sharedInstance].strPostId=[self.postIDMult2 objectAtIndex:sender.tag];
        [DataSaved sharedInstance].strItemUserId=self.strUID;
        //[DataSaved sharedInstance].strMediaId=[[[self.mediaKindmult2 objectAtIndex:sender.tag]objectForKey:@"Media"]objectForKey:@"media_id"];
        [DataSaved sharedInstance].strItemId=[self.itemIDMult2 objectAtIndex:sender.tag];
    }
    PostSelectionViewController * selectionVC=[[PostSelectionViewController alloc]initWithNibName:@"PostSelectionViewController" bundle:nil];
    [self.navigationController pushViewController:selectionVC animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    UITableView *slaveTable = nil;
    
    if (self.leftTableView == scrollView) {
        slaveTable = self.rightTableView;
    } else if (self.rightTableView == scrollView) {
        slaveTable = self.leftTableView;
    }
    
    [slaveTable setContentOffset:scrollView.contentOffset];
}
// serach barr Issue
-(IBAction)followingButtonTapped:(id)sender{
      self.selectionButton.hidden=NO;
       FollowerViewController * followersVC=[[FollowerViewController alloc]initWithNibName:@"FollowerViewController" bundle:nil];
    followersVC.strfollowing=@"Following";
    followersVC.strUserId=self.strUID;
    if ([strfollow isEqualToString:@"1"]) {
        
       [[UnFollowService sharedInstance] unfollowUSerId:self.strUID withLoginUSerId:[LoginService sharedInstance].uId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
           if (isError) {
               /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];*/
               //[self.followingButton setTitle:@"Following" forState:UIControlStateNormal];
           }
           else{
               if ([result isKindOfClass:[ModelUser class]]) {
                 
                   if ([[result objectForKey:@"status"] isEqualToString:@"Success"]) {
                       [self.followingButton setTitle:@"Follow" forState:UIControlStateNormal];
                   }
                   
               }else{
                   //Create Alert for error
               }
           }

       }];
        
    }
    else{
    [self.followingButton setTitle:@"Following" forState:UIControlStateNormal];
    [[PostFollowingService sharedInstance] addTofollowingPostswithMyId:[LoginService sharedInstance].uId withFriendsId:self.strUID withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];*/
            //[self.followingButton setTitle:@"Following" forState:UIControlStateNormal];
        }
        else{
            if ([result isKindOfClass:[ModelUser class]]) {
              
               // [self.navigationController pushViewController:followersVC animated:NO];

            }else{
                //Create Alert for error
            }
        }
        
    }];
    }
    }
-(IBAction)backButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
    if ([status isEqualToString:@"change"]) {
        FeedViewController * feedVC=[[FeedViewController alloc]initWithNibName:@"FeedViewController" bundle:nil];
        [self.navigationController pushViewController:feedVC animated:NO];

    }
}

-(IBAction)followersButtonTapped:(id)sender{
    FollowerViewController * followersVC=[[FollowerViewController alloc]initWithNibName:@"FollowerViewController" bundle:nil];
    followersVC.strUserId=self.strUID;
      [self.navigationController pushViewController:followersVC animated:NO];
}
-(IBAction)moreButtonTapped:(id)sender{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)likesButtonTapped:(id)sender{
    self.likesLabel.hidden=NO;
    self.photosLabel.hidden=YES;
    self.feedLabel.hidden=NO;
    self.likesContainer.hidden=NO;
    self.photosContainer.hidden=YES;
   /* [self.likesButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.feedButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.photosButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];*/
   [self musicButtonTapped:musicButton];
    
  }
-(IBAction)photosButtonTapped:(id)sender{
     self.likesContainer.hidden=YES;
    self.photosContainer.hidden=NO;
     self.likesLabel.hidden=YES;
    self.photosLabel.hidden=NO;
    self.feedLabel.hidden=NO;
    
  /*  [self.photosButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.feedButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.likesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];*/
    
      }
-(IBAction)feedButtonTapped:(id)sender{
     [PostService sharedInstance].strChangeStatus=@"change";
    [PostService sharedInstance].userID=self.strUID;
     [[PostService sharedInstance] callForPostwithCompletionHandler:^(id result, BOOL isError, NSString *strMsg){
        NSLog(@"Result Dic :%@", result);
        if (isError) {
            //alertview
        }
        else{
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                if (![result isKindOfClass:[NSNull class]]) {
                    NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                    
                    NSLog(@"Result Dic :%@", resultDic);
                    if (![[resultDic valueForKeyPath:@"Posts"] isKindOfClass:[NSNull class]]) {
                        self.userNameArray=[resultDic valueForKeyPath:@"Posts.User.name"];
                        self.timeElapsedArray=[resultDic valueForKeyPath:@"Posts.Post.postdate"];
                        self.userImageArray=[resultDic valueForKeyPath:@"Posts.User.avatar"];
                        self.contentArray=[resultDic valueForKeyPath:@"Posts.Post.content"];
                        self.mediaKind=[resultDic valueForKeyPath:@"Posts.Media"];
                        self.strURLArray=[resultDic valueForKeyPath:@"Posts.Media.previewUrl"];
                        self.posterArray=[resultDic valueForKey:@"Posts.Media.posters.thumbnail"];
                        self.releaseDate=[resultDic valueForKey:@"release_dates"];
                        self.itemIDArray=[resultDic valueForKeyPath:@"Posts.Post.feed"];
                        self.postIDArray=[resultDic valueForKeyPath:@"Posts.Post.id"];
                        self.postName=[resultDic valueForKeyPath:@"Posts.Post"];
                        NSLog(@"Resultids :%@", idArray);
                        NSLog(@"Resultanme :%@", userNameArray);
                        NSLog(@"ResultImage :%@", userImageArray);
                        NSLog(@"ResultImage :%@", posterArray);
                        NSLog(@"ResultImage :%@", postName);
                        NSLog(@"ResultImage :%@", releaseDate);
                        NSLog(@"MediaKind : %@",mediaKind);
                        //self.tooltipTableView.delegate=self;
                        //self.tooltipTableView.dataSource=self;
                        imagemult1=[NSMutableArray array];
                        imagemult2=[NSMutableArray array];
                        namemult1=[NSMutableArray array];
                        namemult2=[NSMutableArray array];
                        postermult1=[NSMutableArray array];
                        postermult2=[NSMutableArray array];
                        postNamemult1=[NSMutableArray array];
                        postNamemult2=[NSMutableArray array];
                        rlsDatemult1=[NSMutableArray array];
                        rlsDatemult2=[NSMutableArray array];
                        artistNamemult1=[NSMutableArray array];
                        artistNamemult2=[NSMutableArray array];
                        timeElapsedmult1=[NSMutableArray array];
                        timeElapsedmult2=[NSMutableArray array];
                        commentsmult1=[NSMutableArray array];
                        commentsmult2=[NSMutableArray array];
                        mediaKindmult1=[NSMutableArray array];
                        mediaKindmult2=[NSMutableArray array];
                        strURLArraymult1=[NSMutableArray array];
                        strURLArraymult2=[NSMutableArray array];
                        postIDMult1=[NSMutableArray array];
                        postIDMult2=[NSMutableArray array];
                        itemIDMult1=[NSMutableArray array];
                        itemIDMult2=[NSMutableArray array];
                        
                        
                        
                        strURLArraymult2=[NSMutableArray array];
                        strURLArraymult1=[NSMutableArray array];
                        strURLArraymult2=[NSMutableArray array];
                        
                        [userImageArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [imagemult1 addObject:object];
                            }
                            else
                            {
                                [imagemult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",imagemult1);
                        NSLog(@"Resultanme :%@",imagemult2);
                        [userNameArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [namemult1 addObject:object];
                            }
                            else
                            {
                                [namemult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",namemult1);
                        NSLog(@"Resultanme :%@",namemult2);
                        [artistNameArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [artistNamemult1 addObject:object];
                            }
                            else
                            {
                                [artistNamemult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",artistNamemult1);
                        NSLog(@"Resultanme :%@",artistNamemult2);
                        [contentArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [commentsmult1 addObject:object];
                            }
                            else
                            {
                                [commentsmult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",commentsmult1);
                        NSLog(@"Resultanme :%@",commentsmult2);
                        NSLog(@"Resultids :%@",artistNamemult1);
                        NSLog(@"Resultanme :%@",artistNamemult2);
                        [posterArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [postermult1 addObject:object];
                            }
                            else
                            {
                                [postermult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",postermult1);
                        NSLog(@"Resultanme :%@",postermult2);
                        [postName enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [postNamemult1 addObject:object];
                            }
                            else
                            {
                                [postNamemult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Posts :%@",postNamemult1);
                        NSLog(@"Posts :%@",postNamemult2);
                        [timeElapsedArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [timeElapsedmult1 addObject:object];
                            }
                            else
                            {
                                [timeElapsedmult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"time :%@",postNamemult1);
                        NSLog(@"time :%@",postNamemult2);
                        [releaseDate enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [rlsDatemult1 addObject:object];
                            }
                            else
                            {
                                [rlsDatemult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"rlsdate :%@",rlsDatemult1);
                        NSLog(@"rlsdate:%@",rlsDatemult2);
                        [mediaKind enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [mediaKindmult1 addObject:object];
                            }
                            else
                            {
                                [mediaKindmult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"media :%@",mediaKindmult1);
                        NSLog(@"media :%@",mediaKindmult2);
                        
                        
                        [strURLArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [strURLArraymult1 addObject:object];
                            }
                            else
                            {
                                [strURLArraymult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",strURLArraymult1);
                        NSLog(@"Resultanme :%@",strURLArraymult2);
                        
                        
                        [postIDArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [postIDMult1 addObject:object];
                            }
                            else
                            {
                                [postIDMult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",postIDMult1);
                        NSLog(@"Resultanme :%@",postIDMult2);
                        [itemIDArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [itemIDMult1 addObject:object];
                            }
                            else
                            {
                                [itemIDMult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",itemIDMult1);
                        NSLog(@"Resultanme :%@",itemIDMult2);
                        
                        
                        
                        [strURLArray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                            if (idx%2==0)
                            {
                                [strURLArraymult1 addObject:object];
                            }
                            else
                            {
                                [strURLArraymult2 addObject:object];
                            }
                        }];
                        
                        NSLog(@"Resultids :%@",strURLArraymult1);
                        NSLog(@"Resultanme :%@",strURLArraymult2);
                      
                        self.leftTableView.delegate=self;
                        self.leftTableView.dataSource=self;
                        self.rightTableView.delegate=self;
                        self.rightTableView.dataSource=self;
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.leftTableView reloadData];
                            [self.rightTableView reloadData];
                            
                        });
                    }
                    else{
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Click on Arrow to add Data" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                        [alert show];
                    }
                }
                else{
                    //Create Alert for error
                    
                }
            }
        }
    }];
     }
-(void)handleSingleTap{
    self.gestureView.hidden=YES;
   // self.tooltipTableView.hidden=YES;
}
-(void)swipeHandler:(UISwipeGestureRecognizer *)recognizer {
    
    if ((recognizer.direction == UISwipeGestureRecognizerDirectionUp) && swipeUPVal){
        [UIView animateWithDuration:0.3 animations:^{
            /*CGPoint PositionT = CGPointMake(self.topView.frame.origin.x, self.topView.frame.origin.y-195);
            self.topView.frame = CGRectMake(PositionT.x , PositionT.y , self.topView.frame.size.width, self.topView.frame.size.height);
            */
            
            //CGPoint PositionG = CGPointMake(self.swipeGestureView.frame.origin.x, self.swipeGestureView.frame.origin.y-195);
            [self.swipeGestureView setFrame:CGRectMake(0 ,77,320,57)];
            
           // CGPoint Position = CGPointMake(self.containerView.frame.origin.x, self.containerView.frame.origin.y-195);
            [self.containerView setFrame:CGRectMake(0 ,135 , 320, 428)];
        }];

        swipeUPVal=NO;
        swipeDWNVal=YES;
      
    }
  
}
-(void)swipeHandlerDown:(UISwipeGestureRecognizer *)recognizer {
   
    if ((recognizer.direction == UISwipeGestureRecognizerDirectionDown) && swipeDWNVal){
        [UIView animateWithDuration:0.3 animations:^{
                [self.swipeGestureView setFrame:CGRectMake(0 ,272 ,320,57)];
                     [self.containerView setFrame:CGRectMake(0 ,330,320,228)];
            
                    }];
        swipeDWNVal=NO;
        swipeUPVal=YES;
        

    
}
}
-(void)buttonPressedAction:(UIButton *)sender{
    if (bulMusic) {
        self.strAudioUrl=[[[self.titleArray objectAtIndex:sender.tag] objectForKey:@"music_info"]objectForKey:@"previewUrl"];
        
        NSString* resourcePath = strAudioUrl;
        NSData *_objectData = [NSData dataWithContentsOfURL:[NSURL URLWithString:resourcePath]];
        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc] initWithData:_objectData error:&error];
        audioPlayer.numberOfLoops = 1;
        
        if (audioPlayer == nil){
            NSLog([error description]);
        }
        else{
            if (play) {
                [audioPlayer play];
                tagA=sender.tag;
                [sender setImage:[UIImage imageNamed:@"stop-1"] forState:UIControlStateNormal];
                play=NO;
                [self.listTable reloadData];
                
            }
            else{
                audioPlayer= nil;
                [sender setImage:[UIImage imageNamed:@"play-4"] forState:UIControlStateNormal];
                play=YES;
            }
        }
    }
    if (bulBooks) {
        [audioPlayer stop];
        strBookUrl=[[[self.titleArray objectAtIndex:sender.tag]objectForKey:@"volumeInfo"]objectForKey:@"previewLink"];
        
        UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 10, 300,500)];
        
        NSURL *targetURL = [NSURL URLWithString:strBookUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        [webView loadRequest:request];
        webView.scalesPageToFit = YES;
        webView.contentMode = UIViewContentModeScaleAspectFit;
        //[self.view addSubview:webView];
        
    }
    if (bulMovie) {
        
        [audioPlayer stop];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.gestureView.hidden=NO;
    self.tooltipView.hidden=NO;
    if ([tableView isEqual:listTable]) {
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap) ];
    [self.gestureView addGestureRecognizer:singleFingerTap];
    if (self.gestureView.hidden && self.tooltipView.hidden) {
        
    }
    postTableViewCell*cell =(postTableViewCell *) [listTable cellForRowAtIndexPath:indexPath];
    self.strTitle = cell.headerLabel.text;
    self.strName=cell.nameLabel.text;
    self.strDate=cell.timeLabel.text;
    self.varImage=cell.iconImage.image;
    if (bulMusic) {
        self.strtrackId=[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"trackId"];
    }
    if (bulMovie) {
        self.strtrackId=[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"id"];
    }
    if (bulBooks) {
        self.strtrackId=[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"id"];
    }
    }
}
-(void)cancellButtonTapped:(id)sender{
    [self.audioPlayer stop];
    FeedViewController * feedVC=[[FeedViewController alloc]initWithNibName:@"FeedViewController" bundle:nil];
    [self.navigationController pushViewController:feedVC animated:NO];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIView class]])
    {
        return YES;
    }
    return NO;
}
-(IBAction)moviesButtonTapped:(id)sender{
    self.searchLabel.text=@"search a Movie";
    //self.searchbar.text=@"";
 self.bulMovie=YES;
    self.bulBooks=NO;
    self.bulMusic=NO;
    searchLabel.hidden=NO;
    searchButton.hidden=NO;
    self.booksLabel.hidden=YES;
    self.musicLabel.hidden=NO;
    self.MoviesLabel.hidden=NO;
    
   
  /*  [self.moviesButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
   [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.searchbar becomeFirstResponder];*/
    [GetLikesAndDisLikesMovieService sharedInstance].moviesLike=self.strUID;
    [GetLikesAndDisLikesMovieService sharedInstance].strSearch=@"";
   // [self.activityView performSelector:@selector(startAnimation) withObject:self afterDelay:0.0];
    [[GetLikesAndDisLikesMovieService sharedInstance] getLikePostswithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
              if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
            NSLog(@"Result Dic :%@", resultDic);
            self.titleArray=[resultDic valueForKey:@"LikeDetail"];
            self.filteredCandyArray = [NSMutableArray arrayWithCapacity:[titleArray count]];
            NSLog(@"*** %@",self.titleArray);
            self.listTable.delegate=self;
            self.listTable.dataSource=self;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.listTable reloadData];
            });
            //   [self.activityView performSelector:@selector(stopAnimation) withObject:self afterDelay:0.0];
        }else{
            //Create Alert for error
        }
    }];
    

}
-(IBAction)musicButtonTapped:(id)sender{
    self.booksLabel.hidden=YES;
    self.musicLabel.hidden=YES;
    self.MoviesLabel.hidden=YES;

    self.searchLabel.text=@"search a Song";
    //self.searchbar.text=@"";
    
    self.bulMusic=YES;
    self.bulMovie=NO;
    self.bulBooks=NO;
    searchLabel.hidden=NO;
    searchButton.hidden=NO;
    
   [self.musicButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
   [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
   [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    if (start) {
        [self.searchbar becomeFirstResponder];
    }
    [GetLikesAndDisLikesMusicService sharedInstance].musiclike=self.strUID;
    [GetLikesAndDisLikesMusicService sharedInstance].strSearch=@"";
    //[self.activityView performSelector:@selector(startAnimating) withObject:self afterDelay:0.0];
   [[GetLikesAndDisLikesMusicService sharedInstance] getLikePostswithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
            NSLog(@"Result Dic :%@", resultDic);
            self.titleArray=[resultDic valueForKey:@"LikeDetail"];
                     NSLog(@"*** %@",self.titleArray);
            self.listTable.delegate=self;
            self.listTable.dataSource=self;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.listTable reloadData];
            });
           // [self.activityView performSelector:@selector(stopAnimation) withObject:self afterDelay:0.1];
        }else{
            //Create Alert for error
        }
    }];
 
    
    //;
}
-(IBAction)booksButtonTapped:(id)sender{
    [audioPlayer stop];
    self.booksLabel.hidden=NO;
    self.musicLabel.hidden=NO;
    self.MoviesLabel.hidden=YES;
    searchLabel.hidden=NO;
    searchButton.hidden=NO;

    self.searchLabel.text=@"search a Book";
    //self.searchbar.text=@"";
    self.bulBooks=YES;
    self.bulMovie=NO;
    self.bulMusic=NO;
    [GetLikesAndDisLikesBooksService sharedInstance].booksLike=self.strUID;
    [GetLikesAndDisLikesBooksService sharedInstance].strSearch=@"";
     //[self.activityView performSelector:@selector(startAnimating) withObject:self afterDelay:0.0];
    [[GetLikesAndDisLikesBooksService sharedInstance] getLikePostswithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
            NSLog(@"Result Dic :%@", resultDic);
            self.titleArray=[resultDic valueForKey:@"LikeDetail"];
            NSLog(@"*** %@",self.titleArray);
            self.listTable.delegate=self;
            self.listTable.dataSource=self;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.listTable reloadData];
            });
           //  [self.activityView performSelector:@selector(stopAnimation) withObject:self afterDelay:0.0];
        }else{
            //Create Alert for error
        }
    }];
    

   /* [self.booksButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.searchbar becomeFirstResponder];*/
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
