//
//  YouShouldMeetViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "YouShouldMeetViewController.h"
#import "SWRevealViewController.h"
#import "MatchesLeftTableViewCell.h"
#import "MatchesRightTableViewCell.h"
#import "YouShouldMeetMeService.h"
#import "MyProfileViewController.h"
#import "UnFollowService.h"
#import "PostFollowingService.h"
#import <QuartzCore/QuartzCore.h>
#import "LoginService.h"
#import "ModelUser.h"
@interface YouShouldMeetViewController ()
@property (nonatomic, strong)UIView *leftBarButtonView;
@property (nonatomic, strong)UIButton *backButton;
@property (nonatomic, strong)NSMutableArray * leftDataArray;
@property (nonatomic, strong)NSMutableArray * rightDataArray;
@property (nonatomic, strong)NSMutableArray * leftImageDataArray;
@property (nonatomic, strong)NSMutableArray * rightImageDataArray;

@end

@implementation YouShouldMeetViewController
@synthesize matchesLeftTableView;
@synthesize matchesRightTableView;
@synthesize fetchDataarray;
@synthesize leftDataArray;
@synthesize rightDataArray;
@synthesize leftImageDataArray;
@synthesize rightImageDataArray;
@synthesize SelectedUserId;
@synthesize userName;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor grayColor]];
    navLabel.font = [UIFont fontWithName:@"Lato-Bold" size:20];
    navLabel.text = @"Matches";
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
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1];
    self.leftImageDataArray=[[NSMutableArray alloc]initWithCapacity:10];
     self.rightImageDataArray=[[NSMutableArray alloc]initWithCapacity:10];
    // Do any additional setup after loading the view from its nib.
    [self.matchesLeftTableView registerNib:[UINib nibWithNibName:@"MatchesLeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    [self.matchesRightTableView registerNib:[UINib nibWithNibName:@"MatchesRightTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    [self fetchData];
}
-(void)viewWillAppear:(BOOL)animated{
     [self.navigationController setNavigationBarHidden:NO animated:NO];
}
-(void)fetchData{
    [[YouShouldMeetMeService sharedInstance]YouShouldMeetMeServicewithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
            NSLog(@"Result Dic :%@", resultDic);
            self.fetchDataarray=[resultDic objectForKey:@"usersDetails"];
            NSLog(@"**** :%@", self.fetchDataarray);
             self.leftDataArray=[NSMutableArray array];
            self.rightDataArray=[NSMutableArray array];
            [fetchDataarray enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) {
                if (idx%2==0)
                {
                    [leftDataArray addObject:object];
                }
                else
                {
                    [rightDataArray addObject:object];
                }
            }];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self  createimageArray];
            });
            self.matchesLeftTableView.delegate=self;
            self.matchesRightTableView.delegate=self;
            self.matchesLeftTableView.dataSource=self;
            self.matchesRightTableView.dataSource=self;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.matchesLeftTableView reloadData];
                [self.matchesRightTableView reloadData];
            });
            
        }else{
            //Create Alert for error
        }
    }];
}
-(void)createimageArray{
    if (![self.leftDataArray isKindOfClass:[NSNull class]]) {
       
         for (int i=0;i<[leftDataArray count]; i++) {
             UIImage * image;
            if (![[[self.leftDataArray objectAtIndex:i]objectForKey:@"users"] isKindOfClass:[NSNull class]]) {
                 NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.leftDataArray objectAtIndex:i]objectForKey:@"users"] objectForKey:@"avatar"],@"_f"]];
                NSData *data = [NSData dataWithContentsOfURL:url];
            image = [UIImage imageWithData:data];
                [self.leftImageDataArray addObject:image];
                
            }
        }
    
    }
    if (![self.rightImageDataArray isKindOfClass:[NSNull class]]) {
              for (int i=0;i<[rightDataArray count]; i++) {
                  UIImage * image;
            if (![[[self.rightDataArray objectAtIndex:i]objectForKey:@"users"] isKindOfClass:[NSNull class]]) {
                NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[self.rightDataArray objectAtIndex:i]objectForKey:@"users"]objectForKey:@"avatar" ],@"_f"]];
                NSData *data = [NSData dataWithContentsOfURL:url];
               image = [UIImage imageWithData:data];
                [self.rightImageDataArray addObject:image];
                
            }
        }
        
    }
    NSLog(@"%@",self.leftImageDataArray);
     NSLog(@"%@",self.rightImageDataArray);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (matchesLeftTableView) {
      return [leftDataArray count];
    }
    else {
      return  [rightDataArray count];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MatchesLeftTableViewCell * cellF= [tableView dequeueReusableCellWithIdentifier:@"Cell"];
   MatchesRightTableViewCell * cellS=[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if ([tableView isEqual:matchesLeftTableView]) {
        
        if (!cellF) {
            cellF=[[MatchesLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
       cellF.followersButton.layer.cornerRadius=3.0f;
        [cellF.followersButton.layer setBorderWidth:1.0];
        [cellF.followersButton.layer setBorderColor:[[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] CGColor]];
        cellF.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
        if (![[[self.leftDataArray objectAtIndex:indexPath.row]objectForKey:@"users"] isKindOfClass:[NSNull class]]) {
            cellF.nameLabel.text=[[[self.leftDataArray objectAtIndex:indexPath.row]objectForKey:@"users"]objectForKey:@"name"];
            cellF.locationLabel.text=[[[self.leftDataArray objectAtIndex:indexPath.row]objectForKey:@"users"]objectForKey:@"location"];
            cellF.profileImage.image=[self.leftImageDataArray objectAtIndex:indexPath.row];
            cellF.percentageLabel.text=[NSString stringWithFormat:@"%@,%@",[[[[self.leftDataArray objectAtIndex:indexPath.row]objectForKey:@"a"]objectForKey:@"percentage"]  stringValue],@"%"];
            cellF.selectionButton.tag=indexPath.row;
            [cellF.selectionButton addTarget:self action:@selector(leftselectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        }
        if ([[[[self.leftDataArray objectAtIndex:indexPath.row] objectForKey:@"0"]objectForKey:@"is_following"] isEqualToString:@"0"]) {
            [cellF.followersButton setTitle:@"follow" forState:UIControlStateNormal];
        }
        else{
              [cellF.followersButton setTitle:@"following" forState:UIControlStateNormal];
        }
        cellF.followersButton.tag=indexPath.row;
        [cellF.followersButton addTarget:self action:@selector(followButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
                return cellF;
       
    }
    else if ([tableView isEqual:matchesRightTableView])
        if (!cellS) {
            cellS=[[MatchesRightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
            
        }
    cellS.followersButton.layer.cornerRadius=3.0f;
    [cellS.followersButton.layer setBorderWidth:1.0];
    [cellS.followersButton.layer setBorderColor:[[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] CGColor]];
    
    cellS.contentView.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    // cellS.postImage=[discoverVedioArray objectAtIndex:indexPath.row];
    if(self.rightDataArray.count > indexPath.row){
    if (![[[self.rightDataArray objectAtIndex:indexPath.row]objectForKey:@"users"] isKindOfClass:[NSNull class]]) {
        cellS.nameLabel.text=[[[self.rightDataArray objectAtIndex:indexPath.row]objectForKey:@"users"]objectForKey:@"name"];
        if (![[[[self.rightDataArray objectAtIndex:indexPath.row]objectForKey:@"users"]objectForKey:@"location"] isKindOfClass:[NSNull class]]) {
         cellS.locationLabel.text=[[[self.rightDataArray objectAtIndex:indexPath.row]objectForKey:@"users"]objectForKey:@"location"];
        }
       
        cellS.profileImage.image=[self.rightImageDataArray objectAtIndex:indexPath.row];
          cellS.percentageLabel.text=[NSString stringWithFormat:@"%@,%@",[[[[self.rightDataArray objectAtIndex:indexPath.row]objectForKey:@"a"]objectForKey:@"percentage"]  stringValue],@"%"];
        cellS.selectionButton.tag=indexPath.row;
        [cellS.selectionButton addTarget:self action:@selector(rihtselectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];

    }
    if ([[[[self.rightDataArray objectAtIndex:indexPath.row] objectForKey:@"0"]objectForKey:@"is_following"] isEqualToString:@"0"]) {
        [cellS.followersButton setTitle:@"follow" forState:UIControlStateNormal];
    }
    else{
        [cellS.followersButton setTitle:@"following" forState:UIControlStateNormal];
    }
    cellS.followersButton.tag=indexPath.row;
    [cellS.followersButton addTarget:self action:@selector(RightfollowButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cellS;

}
-(void)leftselectionButtonTapped:(UIButton *)sender{
    MyProfileViewController * profileVC=[[MyProfileViewController alloc]initWithNibName:@"MyProfileViewController" bundle:nil];
    if (![[leftDataArray objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
    self.SelectedUserId=[[[self.leftDataArray objectAtIndex:sender.tag]objectForKey:@"users"]objectForKey:@"id"];
        self.userName=[[[self.leftDataArray objectAtIndex:sender.tag]objectForKey:@"users"]objectForKey:@"name"];
    }
        profileVC.strUID=self.SelectedUserId;
        profileVC.strUserName=self.userName;
    profileVC.strImage=[self.rightImageDataArray objectAtIndex:sender.tag];
        [self.navigationController pushViewController:profileVC animated:NO];

}
-(void)rihtselectionButtonTapped:(UIButton *)sender{
    MyProfileViewController * profileVC=[[MyProfileViewController alloc]initWithNibName:@"MyProfileViewController" bundle:nil];
    if (![[leftDataArray objectAtIndex:sender.tag]isKindOfClass:[NSNull class]]) {
        self.SelectedUserId=[[[self.rightDataArray objectAtIndex:sender.tag]objectForKey:@"users"]objectForKey:@"id"];
        self.userName=[[[self.rightDataArray objectAtIndex:sender.tag]objectForKey:@"users"]objectForKey:@"name"];
    }
    profileVC.strUID=self.SelectedUserId;
    profileVC.strUserName=self.userName;
    profileVC.strImage=[self.rightImageDataArray objectAtIndex:sender.tag];
    [self.navigationController pushViewController:profileVC animated:NO];
    
   
}
-(IBAction)followButtonTapped:(UIButton *)sender{
     self.SelectedUserId=[[[self.leftDataArray objectAtIndex:sender.tag]objectForKey:@"users"]objectForKey:@"id"];
    if ([sender.titleLabel.text isEqualToString:@"following"]){
         [sender setTitle:@"follow" forState:UIControlStateNormal];
    [[UnFollowService sharedInstance] unfollowUSerId:self.SelectedUserId withLoginUSerId:[LoginService sharedInstance].uId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
             [alert show];*/
            //[self.followingButton setTitle:@"Following" forState:UIControlStateNormal];
        }
        else{
            if ([result isKindOfClass:[ModelUser class]]) {
                
                if ([[result objectForKey:@"status"] isEqualToString:@"Success"]) {
                  
                }
                
            }else{
                //Create Alert for error
            }
        }
        
    }];
    
}
else{
    [sender setTitle:@"following" forState:UIControlStateNormal];
    [[PostFollowingService sharedInstance] addTofollowingPostswithMyId:[LoginService sharedInstance].uId withFriendsId:self.SelectedUserId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
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
-(IBAction)RightfollowButtonTapped:(UIButton *)sender{
     self.SelectedUserId=[[[self.rightDataArray objectAtIndex:sender.tag]objectForKey:@"users"]objectForKey:@"id"];
    if ([sender.titleLabel.text isEqualToString:@"following"]){
        [sender setTitle:@"follow" forState:UIControlStateNormal];
        [[UnFollowService sharedInstance] unfollowUSerId:self.SelectedUserId withLoginUSerId:[LoginService sharedInstance].uId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            if (isError) {
                /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                 [alert show];*/
                //[self.followingButton setTitle:@"Following" forState:UIControlStateNormal];
            }
            else{
                if ([result isKindOfClass:[ModelUser class]]) {
                    
                    if ([[result objectForKey:@"status"] isEqualToString:@"Success"]) {
                        
                    }
                    
                }else{
                    //Create Alert for error
                }
            }
            
        }];
        
    }
    else{
        [sender setTitle:@"following" forState:UIControlStateNormal];
        [[PostFollowingService sharedInstance] addTofollowingPostswithMyId:[LoginService sharedInstance].uId withFriendsId:self.SelectedUserId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            if (isError) {
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    UITableView *slaveTable = nil;
    
    if (self.matchesLeftTableView == scrollView) {
        slaveTable = self.matchesRightTableView;
    } else if (self.matchesRightTableView == scrollView) {
        slaveTable = self.matchesLeftTableView;
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
