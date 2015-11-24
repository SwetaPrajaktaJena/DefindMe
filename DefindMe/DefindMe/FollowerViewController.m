//
//  FollowerViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 09/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "FollowerViewController.h"
#import "NotificationTableViewCell.h"
#import "PostFollowingService.h"
#import "GetFollowingServices.h"
#import "LoginService.h"
#import "GetFollowersServices.h"
#import "GetUserDataService.h"
@interface FollowerViewController ()
@property (nonatomic, strong)NSMutableArray * followingArray;
@end

@implementation FollowerViewController
@synthesize listTableView;
@synthesize nameArray;
@synthesize imageArray;
@synthesize backButton;
@synthesize separatorF;
@synthesize separatorS;
@synthesize searchbar;
@synthesize searchButton;
@synthesize searchLabel;
@synthesize followersButton;
@synthesize followingButton;
@synthesize strUserId;
@synthesize strfollowing;
@synthesize followingArray;
@synthesize nameLabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // self.view.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.separatorF.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.separatorS.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    [listTableView registerNib:[UINib nibWithNibName:@"NotificationTableViewCell" bundle:nil] forCellReuseIdentifier:@"CELL"];
       self.imageArray=[[NSMutableArray alloc]initWithObjects:@"profilepicF",@"profilepicS",@"profilepicT", nil];
     self.nameArray=[[NSMutableArray alloc]initWithObjects:@"Kevin James",@"Amanda Trillo",@"Trevor Mason", nil];
    self.followingButton.layer.cornerRadius=3.0f;
    [self.followingButton.layer setBorderWidth:1.0];
    [self.followingButton.layer setBorderColor:[[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] CGColor]];
    self.followersButton.layer.cornerRadius=3.0f;
    [self.followersButton.layer setBorderWidth:1.0];
    [self.followersButton.layer setBorderColor:[[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] CGColor]];
        [GetFollowingServices sharedInstance].strmyId=[LoginService sharedInstance].uId;
        [GetFollowingServices sharedInstance].strfrndId=self.strUserId;
    [GetFollowersServices sharedInstance].strmyId=self.strUserId;
    [self followerButtonTapped:self.followersButton];
        self.searchbar.hidden=YES;
    [self.searchbar setPositionAdjustment:UIOffsetMake(255, 0) forSearchBarIcon:UISearchBarIconSearch];
    self.nameLabel.text=[GetUserDataService sharedInstance].userName;
    //[self.searchbar setSearchTextPositionAdjustment:UIOffsetMake(-270, 0)];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    // called only once
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // called twice every time
    [searchBar setShowsCancelButton:YES animated:YES];
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
    [searchbar resignFirstResponder];
    // called only once
}
- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
    [searchbar resignFirstResponder];
}
-(IBAction)searchButtonTapped:(id)sender{
    self.searchbar.hidden=NO;
    searchLabel.hidden=YES;
    searchButton.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [followingArray count];
}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NotificationTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell=[[NotificationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.profileImage.layer.cornerRadius = 26.f;
    cell.profileImage.clipsToBounds = YES;
    cell.nameLabel.text=[[[self.followingArray objectAtIndex:indexPath.row] objectForKey:@"User"] objectForKey:@"name"];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",[[[followingArray objectAtIndex:indexPath.row] objectForKey:@"User"] objectForKey:@"avatar"],@"_i"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            cell.profileImage.image=image;
            
        });
    });

    //cell.profileImage.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    cell.nameLabel.textColor=[UIColor blackColor];
    cell.addButton.layer.cornerRadius=3.0f;
    [cell.addButton.layer setBorderWidth:1.0];
    [cell.addButton.layer setBorderColor:[[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] CGColor]];
    //[cell.addButton addTarget:self action:@selector(addButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    cell.addButton.tag=indexPath.row;
    return cell;
}
-(IBAction)followerButtonTapped:(id)sender{
    self.strfollowing=@"Followers";
    self.followersButton.backgroundColor=[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f];
     self.followingButton.backgroundColor=[UIColor clearColor];
    [self.followersButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.followingButton setTitleColor:[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] forState:UIControlStateNormal];
    [GetFollowersServices sharedInstance].strmyId=self.strUserId;
    [[GetFollowersServices sharedInstance] getfollowersPostswithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        
        if (isError) {
            //alertview
        }
        else{
            if (![result isKindOfClass:[NSNull class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"***%@",resultDic);
                followingArray=[resultDic objectForKey:@"data"];
                self.listTableView.delegate=self;
                self.listTableView.dataSource=self;
                dispatch_async(dispatch_get_main_queue(), ^{
                   [self.listTableView reloadData];
                    
                });
                
            }
        }
        
    }];

}
-(IBAction)followingButtonTapped:(id)sender{
    self.strfollowing=@"Following";
    self.followingButton.backgroundColor=[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f];
     self.followersButton.backgroundColor=[UIColor clearColor];
    [self.followingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.followersButton setTitleColor:[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] forState:UIControlStateNormal];
    [[GetFollowingServices sharedInstance] getfollowinPostswithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        if (isError) {
            //alertview
        }
        else{
            if (![result isKindOfClass:[NSNull class]]) {
                NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                NSLog(@"***%@",resultDic);
                followingArray=[resultDic objectForKey:@"data"];
                self.listTableView.delegate=self;
                self.listTableView.dataSource=self;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.listTableView reloadData];
                    
                });
            }
        }
        
    }];

}
-(IBAction)backButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
