//
//  FollowerViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 09/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowerViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property(nonatomic, strong)IBOutlet UITableView * listTableView;
@property (nonatomic, strong)NSMutableArray * imageArray;
@property (nonatomic, strong)NSMutableArray * nameArray;
@property (nonatomic, strong)IBOutlet UIButton *backButton;
@property (nonatomic, strong)IBOutlet UIView * separatorF;
@property (nonatomic, strong)IBOutlet UIView * separatorS;
@property (nonatomic, strong)IBOutlet UIButton * followersButton;
@property (nonatomic, strong)IBOutlet UIButton * followingButton;
@property (nonatomic, strong)IBOutlet UISearchBar * searchbar;
@property(nonatomic,strong)IBOutlet UIButton * searchButton;
@property(nonatomic, strong)IBOutlet UILabel * searchLabel;
@property(nonatomic, strong)IBOutlet UILabel * nameLabel;
@property(nonatomic, strong)NSString * strfollowing;
@property(nonatomic, strong)NSString * strUserId;
@property(nonatomic, strong)NSString * strfollowers;
-(IBAction)backButtonTapped:(id)sender;
-(IBAction)followingButtonTapped:(id)sender;
-(IBAction)followerButtonTapped:(id)sender;
@end
