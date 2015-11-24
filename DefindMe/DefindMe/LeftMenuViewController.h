//
//  LeftMenuViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface LeftMenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong ,nonatomic)IBOutlet UITableView * leftMenuTableView;
@property(nonatomic,strong)NSMutableArray * menuArray;
@property(nonatomic,strong)NSMutableArray * PhotosArray;
@property(nonatomic, strong)IBOutlet UIButton * profileButton;
@property(nonatomic, strong)IBOutlet UILabel * nameLabel;
@property (nonatomic, strong)IBOutlet UIImageView * profileImage;

-(IBAction)profileButtonTapped:(id)sender;
@end
