//
//  PostSelectionViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 10/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "PostSelectionViewController.h"
#import "SWRevealViewController.h"
#import "DataSaved.h"
#import  <QuartzCore/QuartzCore.h>
#import "DetailsToolTipTableViewCell.h"
#import "commentsTableViewCell.h"
#import "commentsPostService.h"
#import "LoginService.h"
#import "ModelUser.h"
#import "GetCommentsService.h"
#import "LikesPostService.h"
#import "GetEnjoysPostsService.h"
#import "RePostService.h"
#import "GetRepostsServices.h"
#import "DeletePostServices.h"
#import "BookMarkAddWebservice.h"
#import "AddToLikeService.h"
#import "PostDetailsService.h"
@interface PostSelectionViewController ()<SWRevealViewControllerDelegate>
@property (nonatomic,assign)BOOL swipeUPVal;
@property (nonatomic,assign)BOOL swipeDWNVal;
@property (nonatomic, assign)BOOL play;
@property (nonatomic,assign)BOOL commentsbool;
@property (nonatomic,assign)BOOL enjoybool;
@property (nonatomic,assign)BOOL repostbool;
@property (nonatomic, strong)NSMutableDictionary * postDetails;
@property (nonatomic, assign)BOOL returnstatus;

@end

@implementation PostSelectionViewController
@synthesize containerView;
@synthesize swipeDWNVal;
@synthesize swipeUPVal;
@synthesize posterImageView;
@synthesize nameLabel;
@synthesize timeLabel;
@synthesize artistLabel;
@synthesize profileImageView;
@synthesize titleLabel;
@synthesize musicPaly;
@synthesize audioPlayerF;
@synthesize play;
@synthesize detailsToolTipView;
@synthesize optionArray;
@synthesize gestureView;
@synthesize postListTableView;
@synthesize postContainerView;
@synthesize commentTextField;
@synthesize arrowButton;
@synthesize commentsButton;
@synthesize repostsButton;
@synthesize enjoysButton;
@synthesize postsArray;
@synthesize commentsCountLabel;
@synthesize enjoysCountLabel;
@synthesize repostsCountLabel;
@synthesize sepEnjoyButton;
@synthesize toolTipContainer;
@synthesize postDetails;
@synthesize returnstatus;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[DataSaved sharedInstance].strPostId);
    self.profileImageView.layer.cornerRadius =17;
    self.profileImageView.layer.masksToBounds=YES;
    UISwipeGestureRecognizer *gestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    [gestureRecognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [self.containerView addGestureRecognizer:gestureRecognizer];
    UISwipeGestureRecognizer *gestureRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    [gestureRecognizerDown setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [self.containerView addGestureRecognizer:gestureRecognizerDown];
    swipeUPVal=YES;
    swipeDWNVal=YES;
    [self.detailsToolTipView registerNib:[UINib nibWithNibName:@"DetailsToolTipTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    [self.detailsToolTipView registerNib:[UINib nibWithNibName:@"commentsTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    self.nameLabel.text=[DataSaved sharedInstance].strName;
    self.titleLabel.text=[DataSaved sharedInstance].strTitle;
    self.artistLabel.text=[DataSaved sharedInstance].strArtist;
    self.timeLabel.text=[DataSaved sharedInstance].strTime;
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[DataSaved sharedInstance].strProfileImage,@"_i"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    self.profileImageView.image=image;
    NSURL *urlP=[NSURL URLWithString:[DataSaved sharedInstance].strPoster];
    NSData *dataP = [NSData dataWithContentsOfURL:urlP];
    UIImage *imageP = [UIImage imageWithData:dataP];
    self.posterImageView.image=imageP;
    self.gestureView.hidden=YES;
    self.detailsToolTipView.hidden=YES;
    self.toolTipContainer.hidden=YES;
    [[PostDetailsService sharedInstance] getPostDetailswithMediaId:[DataSaved sharedInstance].strMediaId withpostID:[DataSaved sharedInstance].strPostId withUserID:[DataSaved sharedInstance].strItemUserId withMediaType:[DataSaved sharedInstance].strmediaType withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        if ([result isKindOfClass:[NSDictionary class]]) {
            postDetails = [NSDictionary dictionaryWithDictionary:result];
            NSLog(@"Result Dic :%@", postDetails);
            self.detailsToolTipView.delegate=self;
            self.detailsToolTipView.dataSource=self;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.detailsToolTipView reloadData];
            });
                    }else{
                        
            //Create Alert for error
        }
    }];
    if ([[PostDetailsService sharedInstance].enjoyStatus isEqualToString:@"False"]) {
        [self.sepEnjoyButton setImage:[UIImage imageNamed:@"bookmark-2"] forState:UIControlStateNormal];
    }
    else{
         [self.sepEnjoyButton setImage:[UIImage imageNamed:@"bookmark-2"] forState:UIControlStateNormal]; 
    }
         optionArray=[[NSMutableArray alloc]initWithObjects:@"Add To Likes",@"Bookmark",@"Repost",@"Enjoy", nil];
    
   
    [self.commentsButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.enjoysButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.repostsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.commentsbool=YES;
    self.repostbool=NO;
    self.enjoybool=NO;
    self.returnstatus=NO;
    [self commentsButtonTapped:commentsButton];

    self.postContainerView.hidden=YES;
if ([[DataSaved sharedInstance].strmediaType isEqualToString:@"1"]) {
    self.musicPaly.hidden=NO;
}
else{
    self.musicPaly.hidden=YES;

}
    
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
   [self.navigationController setNavigationBarHidden:YES animated:NO];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
}
-(IBAction)backButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)swipeHandler:(UISwipeGestureRecognizer *)recognizer {
    if ((recognizer.direction == UISwipeGestureRecognizerDirectionUp && swipeUPVal)){
        [UIView animateWithDuration:0.3 animations:^{
            CGPoint Position = CGPointMake(self.containerView.frame.origin.x, self.containerView.frame.origin.y-350);
            self.containerView.frame = CGRectMake(Position.x , Position.y , self.containerView.frame.size.width, self.containerView.frame.size.height+350);
        }];
        swipeUPVal=NO;
        swipeDWNVal=YES;
        self.postContainerView.hidden=NO;
    }
    else if((recognizer.direction == UISwipeGestureRecognizerDirectionDown && swipeDWNVal)){
        [UIView animateWithDuration:0.3 animations:^{
            CGPoint Position = CGPointMake(self.containerView.frame.origin.x, self.containerView.frame.origin.y+350);
            self.containerView.frame = CGRectMake(Position.x , Position.y , self.containerView.frame.size.width, self.containerView.frame.size.height-350);
        }];
        swipeDWNVal=NO;
        swipeUPVal=YES;
        self.postContainerView.hidden=YES;
    }
}
-(IBAction)musicPlayButtonTapped:(id)sender{
    NSString* resourcePath = [DataSaved sharedInstance].strAudioUrl;
    NSData *_objectData = [NSData dataWithContentsOfURL:[NSURL URLWithString:resourcePath]];
    NSError *error;
    audioPlayerF = [[AVAudioPlayer alloc] initWithData:_objectData error:&error];
    audioPlayerF.numberOfLoops = 1;
    
    if (audioPlayerF == nil){
        NSLog([error description]);
        [self.musicPaly setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    }
    else{
        
        if (play) {
            [audioPlayerF play];
            [self.musicPaly setBackgroundImage:[UIImage imageNamed:@"stop button"] forState:UIControlStateNormal];
            play=NO;
            
        }
        else{
            audioPlayerF=nil;
            [self.musicPaly setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
            play=YES;
        }
        
    }

}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual: postListTableView]) {
        return [postsArray count];
    }
       else{
           return [optionArray count];

       }
}
-(IBAction)toolTipShown:(id)sender{
    self.toolTipContainer.hidden=NO;
    self.gestureView.hidden=NO;
    self.detailsToolTipView.hidden=NO;
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap) ];
    [self.gestureView addGestureRecognizer:singleFingerTap];
    
}
-(void)handleSingleTap{
    self.gestureView.hidden=YES;
    self.toolTipContainer.hidden=YES;
    self.detailsToolTipView.hidden=YES;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"Result Dic :%@", postDetails);
    DetailsToolTipTableViewCell * cellT=[self.detailsToolTipView dequeueReusableCellWithIdentifier:@"CELL"];
    commentsTableViewCell * cellP=[self.detailsToolTipView dequeueReusableCellWithIdentifier:@"Cell"];
    if ([tableView isEqual:detailsToolTipView]) {
    if (cellT==nil) {
        cellT=[[DetailsToolTipTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
          [cellT.optionBtn setTitle:[self.optionArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        if (indexPath.row==3) {
        if ([[PostDetailsService sharedInstance].enjoyStatus isEqualToString:@"False"]) {
           
                [cellT.optionBtn setTitle:@"Enjoyed" forState:UIControlStateNormal];
                cellT.optionBtn.tag=indexPath.row;[cellT.optionBtn addTarget:self action:@selector(toolTipDeletePostButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
           
            }
        else{
            
                [cellT.optionBtn setTitle:@"Enjoy" forState:UIControlStateNormal];
                cellT.optionBtn.tag=indexPath.row;[cellT.optionBtn addTarget:self action:@selector(toolTipDeletePostButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }
        if (indexPath.row==2) {
            if ([[DataSaved sharedInstance].strItemUserId isEqualToString:[LoginService sharedInstance].uId]) {
             [cellT.optionBtn setTitle:@"DeletePost" forState:UIControlStateNormal];
                 cellT.optionBtn.tag=indexPath.row;[cellT.optionBtn addTarget:self action:@selector(toolTipDeletePostButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            }
            else{
               [cellT.optionBtn setTitle:@"RePost" forState:UIControlStateNormal];
                cellT.optionBtn.tag=indexPath.row;[cellT.optionBtn addTarget:self action:@selector(toolTipEnjoyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                
            }
        }else{
          cellT.optionBtn.tag=indexPath.row;[cellT.optionBtn addTarget:self action:@selector(toolTipEnjoyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        }
    return cellT;
    }
   else  {
        if (cellP==nil) {
            cellP=[[commentsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
            
        }
       cellP.nameLabel.text=[[[postsArray objectAtIndex:indexPath.row] objectForKey:@"User"]objectForKey:@"name"];

       if (self.commentsbool) {
          cellP.commentsLabel.text=[[[postsArray objectAtIndex:indexPath.row]objectForKey:@"Comment"]objectForKey:@"comment"];
           cellP.timeLabel.text=[[[postsArray objectAtIndex:indexPath.row]objectForKey:@"Comment"]objectForKey:@"postdate"];

       }
     
       if (self.repostbool) {
           cellP.commentsLabel.text=@"";
           //cellP.timeLabel.text=[[[postsArray objectAtIndex:indexPath.row]objectForKey:@"Post"]objectForKey:@"postdate"];
            cellP.timeLabel.text=@"";

       }
       if (self.enjoybool) {
           cellP.commentsLabel.text=@"";
           cellP.timeLabel.text=@"";
           
       }
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
       dispatch_async(queue, ^{
           NSURL *url;
           NSData *data;
           UIImage *image;
           if(![[[[postsArray objectAtIndex:indexPath.row] objectForKey:@"User"]objectForKey:@"avatar"] isKindOfClass:[NSNull class]]){
              url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[postsArray objectAtIndex:indexPath.row] objectForKey:@"User"]objectForKey:@"avatar"],@"_i"]];
               data = [NSData dataWithContentsOfURL:url];
              image = [UIImage imageWithData:data];
               
           }
           else{
               url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[LoginService sharedInstance].strImage,@"_i"]];
              data = [NSData dataWithContentsOfURL:url];
           image = [UIImage imageWithData:data];
           }
          
           dispatch_async(dispatch_get_main_queue(), ^{
               
               cellP.profileImageView.layer.cornerRadius =25;
               cellP.profileImageView.layer.masksToBounds=YES;
               
               cellP.profileImageView.image=image;
               
               
           });
       });

              return cellP;
    }
}
-(void)toolTipEnjoyButtonTapped:(UIButton *)sender{
    if (sender.tag==0) {
        [[AddToLikeService sharedInstance] addToLikePostswithMedia_Type:[DataSaved sharedInstance].strmediaType withMediaId:[DataSaved sharedInstance].strMediaId withUserId:[LoginService sharedInstance].uId withRatings:@"1" withPUID:@"4" withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
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
    if (sender.tag==1) {
        [[BookMarkAddWebservice sharedInstance] bookMarkPostswithMedia_Type:[DataSaved sharedInstance].strmediaType withMediaId:[DataSaved sharedInstance].strMediaId withUserId:[LoginService sharedInstance].uId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
         
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

    }
    if (sender.tag==3) {
        [[LikesPostService sharedInstance] likesPostwithUserID:[LoginService sharedInstance].uId withItemID:[DataSaved sharedInstance].strItemId withMediaType:[DataSaved sharedInstance].strmediaType withItemUSerID:[DataSaved sharedInstance].strItemUserId withLikesDisLikes:@"2" withPostUrl:[DataSaved sharedInstance].strPoster withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            NSLog(@"Result Dic :%@", result);
            if (isError) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                //[alert show];
            }
            else{
                if ([result isKindOfClass:[ModelUser class]]) {
       
                    //Create Alert for error
                }
            }
            
        }];
 
    }
    if (sender.tag==2) {
        
        [[RePostService sharedInstance] repostUserID:[LoginService sharedInstance].uId withPostID:[DataSaved sharedInstance].strPostId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            NSLog(@"Result Dic :%@", result);
            if (isError) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                //[alert show];
            }
            else{
                if ([result isKindOfClass:[ModelUser class]]) {
                    //Create Alert for error
                }
            }
            
        }];
    }
     [[DataSaved sharedInstance].savedDataDict setObject:[DataSaved sharedInstance].strPoster forKey:[DataSaved sharedInstance].strItemId];
    NSLog(@"%@",[DataSaved sharedInstance].savedDataDict);
}
-(void)toolTipDeletePostButtonTapped:(UIButton *)sender{
 [[DeletePostServices sharedInstance] deletePostUserID:[DataSaved sharedInstance].strPostId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
     if (isError) {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
         //[alert show];
     }
     else{
         if ([result isKindOfClass:[ModelUser class]]) {
             //Create Alert for error
         }
     }
     
 }];
  
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.returnstatus=NO;
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint Position = CGPointMake(self.postContainerView.frame.origin.x, self.postContainerView.frame.origin.y-260);
        self.postContainerView.frame = CGRectMake(Position.x , Position.y , self.postContainerView.frame.size.width, self.postContainerView.frame.size.height);
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint Position = CGPointMake(self.postContainerView.frame.origin.x, self.postContainerView.frame.origin.y+260);
        self.postContainerView.frame = CGRectMake(Position.x , Position.y , self.postContainerView.frame.size.width, self.postContainerView.frame.size.height);
    }];
    returnstatus=YES;
    return YES;
}
-(IBAction)arrowButtonTapped:(id)sender{
    
    [[commentsPostService sharedInstance] commentwithUserID:[LoginService sharedInstance].uId withItemID:[DataSaved sharedInstance].strItemId withMediaType:[DataSaved sharedInstance].strmediaType withItemUSerID:[DataSaved sharedInstance].strItemUserId  withCommentContent:self.commentTextField.text withPosterURL:[DataSaved sharedInstance].strPoster withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {

         NSLog(@"Result Dic :%@", result);
                 if (isError) {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
             //[alert show];
         }
         else{
             if ([result isKindOfClass:[ModelUser class]]) {
                 //Create Alert for error
             }
         }
    
     }];
    if (!returnstatus) {
     [self.commentTextField resignFirstResponder];
 self.commentTextField.text=@"";
   [UIView animateWithDuration:0.3 animations:^{
        CGPoint Position = CGPointMake(self.postContainerView.frame.origin.x, self.postContainerView.frame.origin.y+260);
        self.postContainerView.frame = CGRectMake(Position.x , Position.y , self.postContainerView.frame.size.width, self.postContainerView.frame.size.height);
    }];
        returnstatus=YES;
    }
     [self commentsButtonTapped:commentsButton];
}
-(IBAction)enjoysButtonTapped:(id)sender{
    self.commentsbool=NO;
    self.enjoybool=YES;
    self.repostbool=NO;
    self.postContainerView.backgroundColor=[UIColor whiteColor];
    [self.enjoysButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.commentsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.repostsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.commentTextField.hidden=YES;
    self.arrowButton.hidden=YES;
    [[GetEnjoysPostsService sharedInstance] getenjoyswith:[DataSaved sharedInstance].strItemId withUseID:[DataSaved sharedInstance].strItemUserId withPageNo:@"1" withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
            NSLog(@"Result Dic :%@", resultDic);
            self.postsArray=[resultDic valueForKey:@"postLikes"];
            self.postListTableView.delegate=self;
            self.postListTableView.dataSource=self;
             self.enjoysCountLabel.text=[[resultDic valueForKey:@"total_likes"] stringValue];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.postListTableView reloadData];
            });
        }else{
            //Create Alert for error
        }
    }];

}
-(IBAction)repostsButtonTapped:(id)sender{
    self.repostbool=YES;
    self.enjoybool=NO;
    self.commentsbool=NO;
    [self.repostsButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.commentsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.enjoysButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.postContainerView.backgroundColor=[UIColor whiteColor];
      self.commentTextField.hidden=YES;
    self.arrowButton.hidden=YES;
   [[GetRepostsServices sharedInstance] getRepostsswith:[DataSaved sharedInstance].strPostId withPageNo:@"1" withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
       if ([result isKindOfClass:[NSDictionary class]]) {
           NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
           NSLog(@"Result Dic :%@", resultDic);
           self.postsArray=[resultDic valueForKey:@"reposts"];
           self.postListTableView.delegate=self;
           self.postListTableView.dataSource=self;
           self.repostsCountLabel.text=[[resultDic valueForKey:@"total_reposts"] stringValue];
           dispatch_async(dispatch_get_main_queue(), ^{
               [self.postListTableView reloadData];
           });
       }else{
           //Create Alert for error
       }
   }];
 
}

-(IBAction)commentsButtonTapped:(id)sender{
    self.commentsbool=YES;
    self.repostbool=NO;
    self.enjoybool=NO;
    //self.postContainerView.backgroundColor=[UIColor lightGrayColor];
    
    [self.commentsButton setTitleColor:[UIColor colorWithRed:(57/255.f) green:(133/255.f ) blue:(241/255.f) alpha:1.f] forState:UIControlStateNormal];
    [self.enjoysButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.repostsButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.commentTextField.hidden=NO;
    self.arrowButton.hidden=NO;
    
    [[GetCommentsService sharedInstance] getcommentswith:[DataSaved sharedInstance].strItemId withUseID:[DataSaved sharedInstance].strItemUserId withPageNo:@"1" withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
            NSLog(@"Result Dic :%@", resultDic);
            self.postsArray=[resultDic valueForKey:@"postComments"];
             self.postListTableView.delegate=self;
            self.postListTableView.dataSource=self;
            self.commentsCountLabel.text=[[resultDic valueForKey:@"total_comments"] stringValue];
            self.enjoysCountLabel.text=[[resultDic valueForKey:@"total_likes"] stringValue];
            self.repostsCountLabel.text=[[resultDic valueForKey:@"total_reposts"] stringValue];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.postListTableView reloadData];
            });
                   }else{
            //Create Alert for error
        }
    }];
    

}
-(IBAction)separateEnjoyButtonTappedButtonTapped:(id)sender{
    [[LikesPostService sharedInstance] likesPostwithUserID:[LoginService sharedInstance].uId withItemID:[DataSaved sharedInstance].strItemId withMediaType:[DataSaved sharedInstance].strmediaType withItemUSerID:[DataSaved sharedInstance].strItemUserId withLikesDisLikes:@"2" withPostUrl:[DataSaved sharedInstance].strPoster withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        if (isError) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            //[alert show];
        }
        else{
            if ([result isKindOfClass:[ModelUser class]]) {
                //Create Alert for error
               
            }
        }
        [self enjoysButtonTapped:self.enjoysButton]; 
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
