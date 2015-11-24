//
//  SelectionViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 08/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "SelectionViewController.h"
#import "SWRevealViewController.h"
@interface SelectionViewController ()
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, retain) UIView *leftBarButtonView ;
@end

@implementation SelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor grayColor]];
    navLabel.font = [UIFont fontWithName:@"Lato-Bold" size:20];
    navLabel.text = @"You Might Like";
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
    

    // Do any additional setup after loading the view from its nib.
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
