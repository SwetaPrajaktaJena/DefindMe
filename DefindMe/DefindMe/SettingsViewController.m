//
//  SettingsViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import "FrontViewController.h"
#import "LoginService.h"
#import "LogoutWebServices.h"
#import <GoogleSignIn/GoogleSignIn.h>
#import "GooglePlusSignIn.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface SettingsViewController ()<SWRevealViewControllerDelegate,GIDSignInDelegate>
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, retain) UIView *leftBarButtonView ;
@property (nonatomic, retain) UIView *rightBarButtonView ;

@property (nonatomic, strong) UIButton * clearButton;

@end

@implementation SettingsViewController
@synthesize logoutButton;
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor colorWithRed:(106/255.f) green:(108/255.f) blue:(126/255.f) alpha:1.f]];
    navLabel.font = [UIFont fontWithName:@"Lato-Bold" size:20];
    navLabel.text = @"Settings";
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
    self.clearButton = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0.5f, 40, 25)];
    self.clearButton.titleLabel.text=@"Save";
    self.clearButton.titleLabel.textColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f) blue:(241/255.f) alpha:1.0f];
    self.rightBarButtonView = [[UIView alloc] initWithFrame:CGRectMake(270,0, 58.5, 30)];
    [self.rightBarButtonView addSubview:self.clearButton];
    UIBarButtonItem *clearButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:(UIBarButtonItemStylePlain) target:self action:@selector(saveButtonTapped)];
    self.navigationItem.rightBarButtonItem=clearButtonItem;
    clearButtonItem.tintColor=[UIColor colorWithRed:(57/255.f) green:(133/255.f) blue:(241/255.f) alpha:1.0f];
    
  

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
  
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (![textField.text isEqualToString:@""]) {
        textField.text=@"";
    }
}
-(IBAction)logOutButtonTapped:(id)sender{
    [[GIDSignIn sharedInstance] signOut];
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logOut];
   [[LogoutWebServices sharedInstance] LogOutId:[LoginService sharedInstance].uId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
       if (isError) {
           //alertview
       }
       else{
           if ([result isKindOfClass:[NSDictionary class]]) {
               NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
               NSLog(@"Result Dic :%@", resultDic);

                        }
       }
     
   }];
 
    FrontViewController * login=[[FrontViewController alloc]initWithNibName:@"FrontViewController" bundle:nil];
    [self.navigationController pushViewController:login animated:NO];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void)saveButtonTapped{
    
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
