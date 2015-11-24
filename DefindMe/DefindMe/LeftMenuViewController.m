//
//  LeftMenuViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "DiscoveryViewController.h"
#import "NotificationViewController.h"
#import "YouMightLikeViewController.h"
#import "YouShouldMeetViewController.h"
#import "MyPhotosViewController.h"
#import "SettingsViewController.h"
#import "InviteFriendsViewController.h"
#import "BookmarksViewController.h"
#import "SWRevealViewController.h"
#import "MyProfileViewController.h"
#import "LoginService.h"

@interface LeftMenuViewController ()
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, retain) UIView *leftBarButtonView ;

@end

@implementation LeftMenuViewController
@synthesize leftMenuTableView;
@synthesize menuArray;
@synthesize profileImage;
@synthesize PhotosArray;
- (void)viewDidLoad {
    [super viewDidLoad]; [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor whiteColor]];
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
    self.profileImage.layer.masksToBounds=YES;
    self.profileImage.layer.cornerRadius=50;

    menuArray=[[NSMutableArray alloc]initWithObjects:@"Discovery",@"Notification",@"You Should Meet ",@"You might Like",@"Bookmarks",@"My Photos",@"Settings",@"Invite friends" ,nil];
   
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    
  [self.navigationController setNavigationBarHidden:YES animated:NO];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        
        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[LoginService sharedInstance].strImage,@"_i"]];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.profileImage.image=image;
        });
    });
    self.nameLabel.text=[LoginService sharedInstance].strName;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellIdentifier=@"Cell";
    UITableViewCell * cell=[leftMenuTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text=[menuArray objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SWRevealViewController *revealController = [self revealViewController];
    UIViewController *frontViewController = revealController.frontViewController;
    UINavigationController *frontNavigationController =nil;
    
    if ( [frontViewController isKindOfClass:[UINavigationController class]] )
        frontNavigationController = (id)frontViewController;
    
    if (indexPath.row == 0)
    {
        if ( ![frontNavigationController.topViewController isKindOfClass:[DiscoveryViewController class]] )
        {
            DiscoveryViewController *frontViewController = [[DiscoveryViewController alloc] initWithNibName:@"DiscoveryViewController" bundle:nil];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
            [revealController setFrontViewController:navigationController animated:YES];
        }
    }
    else if (indexPath.row == 1)
    {
        if ( ![frontNavigationController.topViewController isKindOfClass:[NotificationViewController class]] )
        {
            NotificationViewController *firstVc = [[NotificationViewController alloc] initWithNibName:@"NotificationViewController" bundle:nil];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:firstVc];
            [revealController setFrontViewController:navigationController animated:YES];
        }
    }
    else if (indexPath.row == 2)
    {
        if ( ![frontNavigationController.topViewController isKindOfClass:[YouShouldMeetViewController class]] )
        {
            YouShouldMeetViewController *secondVc =[[YouShouldMeetViewController alloc] initWithNibName:@"YouShouldMeetViewController" bundle:nil];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:secondVc];
            
            [revealController setFrontViewController:navigationController animated:YES];
        }
    }
    else if (indexPath.row == 3)
    {
        if ( ![frontNavigationController.topViewController isKindOfClass:[YouMightLikeViewController class]] )
        {
           YouMightLikeViewController *thirdVc = [[YouMightLikeViewController alloc] initWithNibName:@"YouMightLikeViewController" bundle:nil];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:thirdVc];
            [revealController setFrontViewController:navigationController animated:YES];
        }
    }
    else if (indexPath.row == 4)
    {
        if ( ![frontNavigationController.topViewController isKindOfClass:[BookmarksViewController class]] )
        {
           BookmarksViewController *forthVc = [[BookmarksViewController alloc] initWithNibName:@"BookmarksViewController" bundle:nil];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:forthVc];
            [revealController setFrontViewController:navigationController animated:YES];
        }
    }
    else if (indexPath.row == 5)
    {
        if ( ![frontNavigationController.topViewController isKindOfClass:[MyPhotosViewController class]] )
        {
           MyPhotosViewController *fifthVc = [[MyPhotosViewController alloc] initWithNibName:@"MyPhotosViewController" bundle:nil];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:fifthVc];
            [revealController setFrontViewController:navigationController animated:YES];
        }
    }
    else if (indexPath.row == 6)
    {
        if ( ![frontNavigationController.topViewController isKindOfClass:[SettingsViewController class]] )
        {
            SettingsViewController *sixthVc = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:sixthVc];
            [revealController setFrontViewController:navigationController animated:YES];
        }
    }
    else if (indexPath.row == 7)
    {
        if ( ![frontNavigationController.topViewController isKindOfClass:[InviteFriendsViewController class]] )
        {
            InviteFriendsViewController *seventhhVc = [[InviteFriendsViewController alloc] initWithNibName:@"InviteFriendsViewController" bundle:nil];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:seventhhVc];
            [revealController setFrontViewController:navigationController animated:YES];
        }
    }
    [revealController revealToggleAnimated:YES];
}
-(IBAction)profileButtonTapped:(id)sender{
    MyProfileViewController * myprofileVC=[[MyProfileViewController alloc]initWithNibName:@"MyProfileViewController" bundle:nil];
    myprofileVC.strUID=[LoginService sharedInstance].uId;
    myprofileVC.profileImageParse=profileImage.image;
    myprofileVC.status=@"change";
    SWRevealViewController *revealController = [self revealViewController];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:myprofileVC];
    [revealController setFrontViewController:navigationController animated:YES];
    [revealController revealToggleAnimated:YES];

   
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
