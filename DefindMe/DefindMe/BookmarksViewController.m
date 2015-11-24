//
//  BookmarksViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "BookmarksViewController.h"
#import "SWRevealViewController.h"
#import "postTableViewCell.h"
#import "LeftMenuViewController.h"
#import "SWRevealViewController.h"
#import "PostingPostViewController.h"
#import "FeedViewController.h"
#import "PostService.h"
#import "MusiciTuneService.h"
#import "MoviesService.h"
#import "BooksiTuneService.h"
#import "LikeAndDislikesService.h"
#import "LoginService.h"
#import "GetBookMarkBookServices.h"
#import "GetBookmarkMusicService.h"
#import "GetBookMarkMovie.h"
@interface BookmarksViewController ()<SWRevealViewControllerDelegate,AVAudioPlayerDelegate>
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, retain) UIView *leftBarButtonView ;
@property (nonatomic, strong)NSString * strAudioUrl;
@property (nonatomic, strong)NSString * strBookUrl;
@property (nonatomic, assign)BOOL play;
@property (nonatomic, assign)NSInteger tagA;
@property (nonatomic, assign)BOOL start;
@property (strong, nonatomic) NSMutableArray *arrcontainstate;
@end

@implementation BookmarksViewController
@synthesize listTable;
@synthesize containerView;
@synthesize musicButton;
@synthesize moviesButton;
@synthesize booksButton;
@synthesize backButton;
@synthesize leftBarButtonView;
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
@synthesize strAudioUrl;
@synthesize strBookUrl;
@synthesize strDate;
@synthesize strName;
@synthesize strTitle;
@synthesize varImage;
@synthesize strtrackId;
@synthesize strLikeAndDislike;
@synthesize strMedia;
@synthesize strContent;
@synthesize play;
@synthesize tagA;
@synthesize start;


- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor grayColor]];
    navLabel.font = [UIFont fontWithName:@"Lato-Bold" size:15];
    navLabel.text = @"BookMarks";
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0 ,5,70,20)];
    [self.backButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    SWRevealViewController *revealController = [self revealViewController];
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    UIBarButtonItem *negativeSpacer1 = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil action:nil];
    negativeSpacer1.width = -9.5f;
    self.leftBarButtonView = [[UIView alloc] initWithFrame:CGRectMake(0,0,75, 30)];
    [self.leftBarButtonView addSubview:self.backButton];
    [self.backButton addTarget:self action:@selector(cancellButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.leftBarButtonView];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer1,leftBarButton, nil]];
    [self.listTable registerNib:[UINib nibWithNibName:@"postTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    //self.nameArray=[[NSMutableArray alloc]initWithObjects:@"ThemePark",@"Klaxons",@"HIM",@"Bahamas", nil];
    //self.titleArray=[[NSMutableArray alloc]initWithObjects:@"Somthing Good",@"Golden Skans",@"Drunk onShadows",@"Bahamas is Afie", nil];
    //self.iconImageArray=[[NSMutableArray alloc]initWithObjects:@"pic_1",@"pic_2",@"pic_3",@"pic_4", nil];
    self.view.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.searchbar.hidden=YES;
    self.gestureView.hidden=YES;
    self.tooltipView.hidden=YES;
    play=YES;
    start=NO;
    [self.musicButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self musicButtonTapped:musicButton];
    
    NSLog(@"****%@",[LoginService sharedInstance].uId);
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.gestureView.hidden=YES;
    self.tooltipView.hidden=YES;
    [self.listTable reloadData];
}
-(void)handleSingleTap{
    self.gestureView.hidden=YES;
    self.tooltipView.hidden=YES;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    // called only once
    [searchBar setShowsCancelButton:YES animated:YES];
    
    if (bulMovie) {
        [MoviesService sharedInstance].strSearch=searchbar.text;
        [[GetBookMarkMovie sharedInstance] bookmarkMovieServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            NSLog(@"Result Dic :%@", result);
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.titleArray=[resultDic valueForKey:@"bookmarkDetails"];
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
        [[GetBookmarkMusicService sharedInstance] bookmarkMusicServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
        {
            NSLog(@"Result Dic :%@", result);
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.titleArray=[resultDic valueForKey:@"bookmarkDetails"];
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
        [[GetBookMarkBookServices sharedInstance] bookmarkBookServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
        {
            NSLog(@"Result Dic :%@", result);
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.titleArray=[resultDic objectForKey:@"bookmarkDetails"];
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
        [MoviesService sharedInstance].strSearch=searchbar.text;
        [[GetBookMarkMovie sharedInstance] bookmarkMovieServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            NSLog(@"Result Dic :%@", result);
            
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"Result Dic :%@", resultDic);
                self.titleArray=[resultDic valueForKey:@"bookmarkDetails"];
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
        [[GetBookmarkMusicService sharedInstance] bookmarkMusicServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
         {
             NSLog(@"Result Dic :%@", result);
             
             if ([result isKindOfClass:[NSDictionary class]]) {
                 NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                 NSLog(@"Result Dic :%@", resultDic);
                 self.titleArray=[resultDic valueForKey:@"bookmarkDetails"];
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
        [[GetBookMarkBookServices sharedInstance] bookmarkBookServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
         {
             NSLog(@"Result Dic :%@", result);
             if ([result isKindOfClass:[NSDictionary class]]) {
                 NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                 NSLog(@"Result Dic :%@", resultDic);
                 self.titleArray=[resultDic objectForKey:@"bookmarkDetails"];
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
}
- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    [searchbar resignFirstResponder];
}
-(IBAction)searchButtonTapped:(id)sender{
    
    self.searchbar.hidden=NO;
    
    searchLabel.hidden=YES;
    searchButton.hidden=YES;
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
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [titleArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIdF = @"Cell";
    
    postTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdF];
    if (!cell) {
        // cell=[[postTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdF];
    }
    if (bulMovie) {
        //cell.nameLabel.text=[nameArray objectAtIndex:indexPath.row];
        [cell.playButton setHidden:YES];
        cell.headerLabel.text=[[[titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"] objectForKey:@"title"];
        self.strMedia=@"MEDIA:2";
         cell.timeLabel.text=[[[titleArray objectAtIndex:indexPath.row]objectForKey:@"bookmark"]objectForKey:@"date"];
        NSLog(@"*****%@",[[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"] objectForKey:@"other_music_info"]);
        
        NSString * strUrl=[[[[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"] objectForKey:@"movie_info"]objectForKey:@"posters"] objectAtIndex:2];
        
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
        cell.headerLabel.text=[[[titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"] objectForKey:@"trackName"];
        NSScanner *scanner = [NSScanner scannerWithString:[[[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"] objectForKey:@"music_info"] objectForKey:@"releaseDate"]];
        NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
        NSString * result;
        [scanner scanUpToCharactersFromSet:cs1 intoString:&result];
        self.strMedia=@"MEDIA:1";
        cell.timeLabel.text=result;
        NSString * strNAME=[[[self.titleArray objectAtIndex:indexPath.row] objectForKey:@"Media"]objectForKey:@"artistName"];
        cell.nameLabel.text=[NSString stringWithFormat:@"%@%@",@"by ",strNAME];
        
        if ([cell.playerButton isTouchInside]) {
            
            //[self.audioPlayer stop];
        }
        NSString * strUrl=[[[[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"] objectForKey:@"music_info"]objectForKey:@"artworkUrl"] objectAtIndex:2];
        
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
                                                                                                                                                                                   //NSString * authorName=[authorArray objectAtIndex:0];
        cell.nameLabel.text=[[[titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"authors"];
        cell.headerLabel                                                                                                                                                                                                                                                                                                             .text=[[[titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"]objectForKey:@"title"];
        self.strMedia=@"MEDIA:3";
        
        [cell.playButton setImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];
      /*  NSScanner *scanner = [NSScanner scannerWithString:[[[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"] objectForKey:@"music_info"] objectForKey:@"releaseDate"]];
        NSCharacterSet *cs1 = [NSCharacterSet characterSetWithCharactersInString:@"-"];
        NSString * result;*/
        //[scanner scanUpToCharactersFromSet:cs1 intoString:&result];
        //cell.timeLabel.text=result;
        NSString * strUrl=[[[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"Media"] objectForKey:@"book_info"]objectForKey:@"smallThumbnail"];
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
    return cell;
}
- (void)buttonPressedAction:(UIButton *)sender{
    if (bulMusic) {
        self.strAudioUrl=[[[[self.titleArray objectAtIndex:sender.tag]objectForKey:@"Media"] objectForKey:@"music_info"]objectForKey:@"previewUrl"];
        
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
-(void)cancellButtonTapped:(id)sender{
    [self.audioPlayer stop];
    FeedViewController * feedVC=[[FeedViewController alloc]initWithNibName:@"FeedViewController" bundle:nil];
    [self.navigationController pushViewController:feedVC animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)moviesButtonTapped:(id)sender{
    audioPlayer=nil;
    self.searchLabel.text=@"search a Movie";
    self.searchbar.text=@"";
    self.bulMovie=YES;
    self.bulBooks=NO;
    self.bulMusic=NO;
    start=YES;
    [self.moviesButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [[GetBookMarkMovie sharedInstance] bookmarkMovieServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
            NSLog(@"Result Dic :%@", resultDic);
            self.titleArray=[resultDic valueForKey:@"bookmarkDetails"];
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
    
   // [self.searchbar becomeFirstResponder];
}
-(IBAction)musicButtonTapped:(id)sender{
    self.searchLabel.text=@"search a Song";
    self.searchbar.text=@"";
    self.bulMusic=YES;
    self.bulMovie=NO;
    self.bulBooks=NO;
    [self.musicButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.booksButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    if (start) {
       // [self.searchbar becomeFirstResponder];
    }
     [[GetBookmarkMusicService sharedInstance] bookmarkMusicServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
     {
         NSLog(@"Result Dic :%@", result);
         
         if ([result isKindOfClass:[NSDictionary class]]) {
             NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
             NSLog(@"Result Dic :%@", resultDic);
             self.titleArray=[resultDic valueForKey:@"bookmarkDetails"];
             self.listTable.delegate=self;
             self.listTable.dataSource=self;
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.listTable reloadData];
             });
             
         }else{
             //Create Alert for error
         }
     }];

    //;
}
-(IBAction)booksButtonTapped:(id)sender{
    [audioPlayer stop];
    self.searchLabel.text=@"search a Book";
    self.searchbar.text=@"";
    self.bulBooks=YES;
    self.bulMovie=NO;
    self.bulMusic=NO;
    start=YES;
    [self.booksButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.moviesButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
   // [self.searchbar becomeFirstResponder];
    [[GetBookMarkBookServices sharedInstance] bookmarkBookServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
     {
         NSLog(@"Result Dic :%@", result);
         if ([result isKindOfClass:[NSDictionary class]]) {
             NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
             NSLog(@"Result Dic :%@", resultDic);
             self.titleArray=[resultDic objectForKey:@"bookmarkDetails"];
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
