//
//  LoginViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "LoginViewController.h"
#import "LeftMenuViewController.h"
#import "FeedViewController.h"
#import "LoginService.h"
#import "ModelUser.h"
#import "UserRgistrationService.h"
#import "DataSaved.h"
@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize backButton;
@synthesize loginButton;
@synthesize firstSeparator;
@synthesize secondSeparator;
@synthesize testgmeView;
@synthesize testimagmeView;
- (void)viewDidLoad {
    [super viewDidLoad];
    loginButton.layer.cornerRadius=3.f;
    loginButton.backgroundColor=[UIColor colorWithRed:(74/255.f) green:(144/255.f) blue:(226/255.f) alpha:1.f];
    // Do any additional setup after loading the view from its nib.
    self.firstSeparator.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.firstSeparator.backgroundColor=[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1.f];
    self.emailID.text=@"pardeep@digiinteracts.com";
    self.password.text=@"pardeep@123";
    NSURL * url=[NSURL URLWithString:@"http://a1.mzstatic.com/us/r30/Music/y2005/m02/d28/h22/s07.naurdnlr.30x30-50.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    self.testimagmeView.image=image;
}
-(void)viewWillAppear:(BOOL)animated{
     [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}
-(IBAction)loginButton:(id)sender{
       NSString *strEmail = self.emailID.text;
        NSString *strPassword = self.password.text;
    [[LoginService sharedInstance] callLoginServiceForEmail:strEmail andPassword:strPassword deviceToken:@"123" deviceType:@"iphone" withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        NSLog(@"Result Dic :%@", result);
        
        
        if (isError) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
        else{
            if ([result isKindOfClass:[ModelUser class]]) {
                FeedViewController * feedVC=[[FeedViewController alloc]initWithNibName:@"FeedViewController" bundle:nil];
                [self.navigationController pushViewController:feedVC animated:NO];
            }else{
                //Create Alert for error
            }
        }
        
        }];
    
    }
-(IBAction)backButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
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
