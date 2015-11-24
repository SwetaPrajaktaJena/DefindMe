//
//  NotificationViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "NotificationViewController.h"
#import "SWRevealViewController.h"
#import "NotificationTableViewCell.h"
#import "NotificationService.h"
#import "PostDetailsService.h"
#import "PostSelectionViewController.h"
#import "DataSaved.h"
@interface NotificationViewController ()
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, retain) UIView *leftBarButtonView ;
@property (nonatomic, retain) UIView *rightBarButtonView ;
@property (nonatomic, strong) NSMutableDictionary * commentsDict;
@property (nonatomic, strong) NSMutableDictionary * notificationDictionary;
@property (nonatomic, strong) NSMutableDictionary * nameDictionary;
@property (nonatomic, strong) NSMutableArray * namesArray;
@property (nonatomic, strong) NSMutableArray * midsArray;
@property (nonatomic, strong) NSMutableArray * postIdArray;
@property (nonatomic, strong) NSMutableArray * linkArray;
@property (nonatomic, strong) NSMutableArray * uidArray;
@property (nonatomic, strong) NSMutableArray * formIdArray;

@property (nonatomic, strong) UIButton * clearButton;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@end

@implementation NotificationViewController
@synthesize imageArray;
@synthesize nameArray;
@synthesize commentArray;
@synthesize notificationTableView;
@synthesize backButton;
@synthesize leftBarButtonView;
@synthesize rightBarButtonView;
@synthesize timeArray;
@synthesize commentsDict;
@synthesize nameDictionary;
@synthesize notificationDictionary;
@synthesize namesArray;
@synthesize activityView;
@synthesize midsArray;
@synthesize postIdArray;
@synthesize linkArray;
@synthesize uidArray;
@synthesize formIdArray;
@synthesize posterUrlArray;
@synthesize userItemIdArray;
@synthesize itemIdArray;
- (void)viewDidLoad {
    [super viewDidLoad];
       [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor colorWithRed:(106/255.f) green:(108/255.f) blue:(126/255.f) alpha:1.f]];
    navLabel.font = [UIFont fontWithName:@"Lato-Bold" size:20];
    navLabel.text = @"Notification";
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0.5f, 40, 25)];
    self.clearButton = [[UIButton alloc] initWithFrame:CGRectMake(265, 0.5f, 40, 25)];
    [self.backButton setImage:[UIImage imageNamed:@"row reorder.png"] forState:UIControlStateNormal];
    SWRevealViewController *revealController = [self revealViewController];
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    UIBarButtonItem *negativeSpacer1 = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil action:nil];
    negativeSpacer1.width = -9.5f;
    
    self.leftBarButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 58.5, 30)];
     self.rightBarButtonView = [[UIView alloc] initWithFrame:CGRectMake(265, 0, 58.5, 30)];
    [self.leftBarButtonView addSubview:self.backButton];
    [self.rightBarButtonView addSubview:self.clearButton];
    [self.backButton addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.leftBarButtonView];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer1,leftBarButton, nil]];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightBarButtonView];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:rightBarButton, nil]];
   // self.imageArray=[[NSMutableArray alloc]initWithObjects:@"profilepicF",@"profilepicS",@"profilepicT",@"profilepicF",@"profilepicS",@"profilepicT",@"profilepicF",@"profilepicS",@"profilepicT",@"profilepicF", nil];
    //self.nameArray=[[NSMutableArray alloc]initWithObjects:@"Kevin James",@"Amanda Trillo",@"Trevor Mason", nil];
    //self.commentArray=[[NSMutableArray alloc]initWithObjects:@"Commented on your post",@"Liked Your Post",@"Started following you", nil];
    [notificationTableView registerNib:[UINib nibWithNibName:@"NotificationTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
    //	self.timeArray=[[NSMutableArray alloc]initWithObjects:@"12hr",@"1d",@"1w",@"12hr",@"1d",@"1w",@"12hr",@"1d",@"1w",@"1w", nil];

    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(clearButtonTappedOut)];
    [anotherButton setTintColor:[UIColor grayColor]];
    self.navigationItem.rightBarButtonItem = anotherButton;
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color=[UIColor grayColor];
    activityView.center=self.view.center;
    
    [activityView startAnimating];
    
    [self.view addSubview:activityView];
    activityView.hidesWhenStopped = YES;
    [activityView performSelector:@selector(stopAnimation) withObject:nil afterDelay:5.0];
    
    self.nameDictionary=[[NSMutableDictionary alloc]initWithCapacity:10];
    [[NotificationService sharedInstance] callNotificationServiceForUSerName:@" " andComments:@" " timePassed:@" " withCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
     {
         NSLog(@"Result Dic :%@", result);
         
         if ([result isKindOfClass:[NSDictionary class]]) {
             
             NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
             NSLog(@"Result Dic :%@", resultDic);
           
             self.nameArray=[resultDic valueForKeyPath:@"notificationDetails.User.name"];
             self.commentArray=[resultDic valueForKeyPath:@"notificationDetails.Notification.content"];
             self.timeArray =[resultDic valueForKeyPath:@"notificationDetails.Notification.date"];
            self.imageArray=[resultDic valueForKeyPath:@"notificationDetails.User.avatar"];
             self.uidArray=[resultDic valueForKeyPath:@"notificationDetails.Notification.uid"];
             self.postIdArray=[resultDic valueForKeyPath:@"notificationDetails.Notification.content"];
             self.midsArray=[resultDic valueForKeyPath:@"notificationDetails.Notification.id"];
              self.formIdArray=[resultDic valueForKeyPath:@"notificationDetails.Notification.from_id"];
             self.linkArray=[resultDic valueForKeyPath:@"notificationDetails.Notification.link"];
             self.posterUrlArray=[resultDic valueForKeyPath:@"notificationDetails.Notification.poster_url"];
             
              NSLog(@"Comment :%@",imageArray);
             NSLog(@"Comment :%@",timeArray);
             NSLog(@"Comment :%@",nameArray);
             NSLog(@"Comment##### :%@",commentArray);
             dispatch_async(dispatch_get_main_queue(), ^{
            [self.notificationTableView reloadData];
             });
         }
         else{
             //Create Alert for error
         }
     }];
      // Do any additional setup after loading the view from its nib.
}
-(void)stopAnimation{
    [activityView stopAnimating];
}
-(void)viewWillAppear:(BOOL)animated{
     [self.navigationController setNavigationBarHidden:NO animated:NO];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [imageArray count];
}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NotificationTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell=[[NotificationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    cell.addButton.hidden=YES;
    cell.iconImage.hidden=YES;
    cell.profileImage.layer.cornerRadius = 25.f;
    cell.commentsLabel.text=[commentArray objectAtIndex:indexPath.row];
    cell.profileImage.layer.cornerRadius = 25;
    cell.profileImage.layer.masksToBounds=YES;
    NSString *ImageURL = [NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[imageArray objectAtIndex:indexPath.row],@"_i"];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
    cell.profileImage.image=[UIImage imageWithData:imageData];
    cell.nameLabel.text=[nameArray objectAtIndex:indexPath.row];
    cell.nameLabel.textColor=[UIColor colorWithRed:(109/255.f) green:(182/255.f) blue:(251/255.f) alpha:1.f];
    cell.timeLabel.text=[timeArray objectAtIndex:indexPath.row];
    cell.selectionButton.tag=indexPath.row;
        [cell.selectionButton addTarget:self action:@selector(selectionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    //[self.notificationTableView reloadData];
    return cell;
}
-(void)selectionButtonTapped:(UIButton *)sender{
    if (posterUrlArray.count > sender.tag) {
        [DataSaved sharedInstance].strPoster=[posterUrlArray objectAtIndex:sender.tag];
    }
    if (imageArray.count > sender.tag) {
        [DataSaved sharedInstance].strProfileImage=[imageArray objectAtIndex:sender.tag];
    }
    if (nameArray.count > sender.tag) {
        [DataSaved sharedInstance].strName=[nameArray objectAtIndex:sender.tag];
    }
    if (timeArray.count > sender.tag) {
        [DataSaved sharedInstance].strTime=[timeArray objectAtIndex:sender.tag];
    }
    if (linkArray.count > sender.tag) {
        
        if ([[linkArray objectAtIndex:sender.tag] rangeOfString:@"photo"].location == NSNotFound) {
            [DataSaved sharedInstance].strItemId= [[linkArray objectAtIndex:sender.tag] substringWithRange: NSMakeRange(0, [[linkArray objectAtIndex:sender.tag] rangeOfString: @"post/"].location)] ;
            [DataSaved sharedInstance].strMediaId= [[linkArray objectAtIndex:sender.tag] substringWithRange: NSMakeRange(0, [[linkArray objectAtIndex:sender.tag] rangeOfString: @"post/"].location)] ;
        } else {
            [DataSaved sharedInstance].strItemId= [[linkArray objectAtIndex:sender.tag] substringWithRange: NSMakeRange(0, [[linkArray objectAtIndex:sender.tag] rangeOfString: @"photo/"].location)] ;
            [DataSaved sharedInstance].strMediaId= [[linkArray objectAtIndex:sender.tag] substringWithRange: NSMakeRange(0, [[linkArray objectAtIndex:sender.tag] rangeOfString: @"photo/"].location)] ;
            
        }
        
    }
    if (formIdArray.count > sender.tag) {
        [DataSaved sharedInstance].strItemUserId=[formIdArray objectAtIndex:sender.tag];
    }
    if (midsArray.count > sender.tag) {
        [DataSaved sharedInstance].strPostId=[midsArray objectAtIndex:sender.tag];
    }
    if (midsArray.count > sender.tag) {
        [DataSaved sharedInstance].strPostId=[midsArray objectAtIndex:sender.tag];
    }
    
    [DataSaved sharedInstance].strmediaType=@"2";

    PostSelectionViewController * selectionVC=[[PostSelectionViewController alloc]initWithNibName:@"PostSelectionViewController" bundle:nil];
    [self.navigationController pushViewController:selectionVC animated:NO];
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
-(void)clearButtonTappedOut{
    
                                            
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
