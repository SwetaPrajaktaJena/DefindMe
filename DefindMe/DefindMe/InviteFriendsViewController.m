//
//  InviteFriendsViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "InviteFriendsViewController.h"
#import "SWRevealViewController.h"
@interface InviteFriendsViewController ()
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, retain) UIView *leftBarButtonView ;

@end

@implementation InviteFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"InviteFriends";
    SWRevealViewController *revealController = [self revealViewController];
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
   // UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
   // self.navigationItem.leftBarButtonItem = backButtonItem;
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0.5f, 40, 25)];
    [self.backButton setImage:[UIImage imageNamed:@"arrow-1"] forState:UIControlStateNormal];
      UIBarButtonItem *negativeSpacer1 = [[UIBarButtonItem alloc]
                                        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                        target:nil action:nil];
    negativeSpacer1.width = -9.5f;
    
    self.leftBarButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 58.5, 30)];
    [self.leftBarButtonView addSubview:self.backButton];
    [self.backButton addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.leftBarButtonView];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer1,leftBarButton, nil]];
    UIView *viewWithButtons = [[UIView alloc] initWithFrame:CGRectMake(0, 0,58.5,30)];
    
    //Button customiztaion
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(10 , 0.5f,30,25)];
    [rightButton setImage:[UIImage imageNamed:@"share_1-1"] forState:UIControlStateNormal];
     [rightButton addTarget:self action:@selector(shareButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    //Button customiztaion
    [viewWithButtons addSubview:rightButton];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:viewWithButtons];
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer1,rightBarButton, nil]];

    


    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    NSString * message = @"Hello";
    NSArray * shareItems = @[message];
    
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
    
    // Exclude all activities except AirDrop.
    
    // Present the controller
    [self presentViewController:controller animated:YES completion:nil];

}
-(void)shareButtonTapped{
    NSString * message = @"Hello";
    NSArray * shareItems = @[message];
    
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
    
    // Exclude all activities except AirDrop.
    
    // Present the controller
    [self presentViewController:controller animated:YES completion:nil];
    
 
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
