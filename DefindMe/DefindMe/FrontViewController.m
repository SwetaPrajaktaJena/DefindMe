//
//  FrontViewController.m
//  DefineMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//
#import "FrontViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "ModelUser.h"
#import "AddPhotoViewConrtrollerViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import "GooglePlusSignIn.h"
#import "DataSaved.h"
#import "LoginService.h"
#import "FeedViewController.h"
#import "CheckEmailIDService.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface FrontViewController ()<GIDSignInDelegate,GIDSignInUIDelegate,FBSDKLoginButtonDelegate>
@property (nonatomic, strong)NSMutableDictionary * imageDict;
@end

@implementation FrontViewController
@synthesize facebookLoginButton;
@synthesize googleLoginButton;
@synthesize facebookButton;
@synthesize signInButton;
@synthesize imageDict;
- (void)setUp {
    
       [GIDSignInButton class];

    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.delegate = self;
    signIn.uiDelegate = self;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setUp];
       
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self ShowUI];
   
}
-(void)ShowUI{
    [self.loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    self.loginButton.titleLabel.textColor=[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f];
    [self.signupButton setTitle:@"Sign up " forState:UIControlStateNormal];
    self.signupButton.titleLabel.textColor=[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f];
    [self.facebookLoginButton setTitle:@"Log in with Facebook" forState:UIControlStateNormal];
    [self.facebookLoginButton setTitleColor:[UIColor colorWithRed:(74/255.f) green:(144/255.f) blue:(226/255.f) alpha:1.0f] forState:UIControlStateNormal];
    self.googleLoginButton.tintColor=[UIColor colorWithRed:(74/255.f) green:(144/255.f) blue:(226/255.f) alpha:1.0f];

    [self.googleLoginButton setTitle:@"Log in with Google +" forState:UIControlStateNormal];
      [self.googleLoginButton setTitleColor:[UIColor colorWithRed:(225/255.f) green:(73/255.f) blue:(41/255.f) alpha:1.0f] forState:UIControlStateNormal];
    self.signupButton.layer.cornerRadius=3.0f;
    [self.signupButton.layer setBorderWidth:1.0];
    [self.signupButton.layer setBorderColor:[[UIColor colorWithRed:(90/255.f) green:(164/255.f) blue:(250/255.f) alpha:1.0f] CGColor]];
}
-(IBAction)LoginButtonTapped:(id)sender{
    LoginViewController * login=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:login animated:NO];
}
-(IBAction)SignupButtonTapped:(id)sender{
    SignUpViewController * signUpVC=[[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    [self.navigationController pushViewController:signUpVC animated:NO];
}
-(IBAction)facebookButtonTapped:(id)sender{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    [login logInWithReadPermissions:@[@"public_profile", @"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
        if (error)
        {
            
            // There is an error here.
            
        }
        else
        {
            if(result.token)   // This means if There is current access token.
            {
                NSLog(@"%@",result);

                // Token created successfully and you are ready to get profile info
               [self getFacebookProfileInfo];
            }        
        }
    }];
}
-(void)getFacebookProfileInfo{
    
    FBSDKGraphRequest *requestMe = [[FBSDKGraphRequest alloc]initWithGraphPath:@"me?fields=email,first_name,last_name,picture" parameters:nil];
    
    FBSDKGraphRequestConnection *connection = [[FBSDKGraphRequestConnection alloc] init];
    
    [connection addRequest:requestMe completionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        
        if(result)
        {
            if ([result objectForKey:@"email"]) {
                
                NSLog(@"Email: %@",[result objectForKey:@"email"]);
                
            }
            
            if ([result objectForKey:@"id"]) {
                
                NSLog(@"User id : %@",[result objectForKey:@"id"]);
                
            }
            
        }
        NSLog(@"%@",result);
        [DataSaved sharedInstance].strSocialLoginID = [result objectForKey:@"id"];
        [DataSaved sharedInstance].strSocialLoginName =[result objectForKey:@"first_name"];
        NSString *email =[result objectForKey:@"email"];
        NSString * imageStr=[[[result objectForKey:@"picture"] objectForKey:@"data"]objectForKey:@"url"];
        [[CheckEmailIDService sharedInstance] callCheckForEmail:email withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            
            NSLog(@"Result Dic :%@", result);
            if (isError) {
                //alertview
            }
            else{
                
                if ([result isKindOfClass:[NSDictionary class]]) {
                    if ([[result objectForKey:@"status"] isEqualToString:@"1"]) {
                        [LoginService sharedInstance].uId=[result objectForKey:@"UserId"];
                        FeedViewController * feedVC=[[FeedViewController alloc]initWithNibName:@"FeedViewController" bundle:nil];
                        [self.navigationController pushViewController:feedVC animated:NO];
                    }
                    else if ([[result objectForKey:@"status"] isEqualToString:@"0"]){
                        AddPhotoViewConrtrollerViewController * addVC=[[AddPhotoViewConrtrollerViewController alloc]initWithNibName:@"AddPhotoViewConrtrollerViewController" bundle:nil];
                        addVC.strStatus=@"social";
                        addVC.emailstr=email;
                        NSURL *urlO=[NSURL URLWithString:imageStr];
                        UIImage * imageO;
                        NSData * data=[NSData dataWithContentsOfURL:urlO];
                        imageO = [UIImage imageWithData:data];
                        addVC.profImage=imageO;
                        [self.navigationController pushViewController:addVC animated:NO];
                        
                    }
                }
            }
        }];
    }];
    
    [connection start];
}
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}
-(IBAction)googleButtonTapped:(id)sender
{
    [self setUp];
    [[GIDSignIn sharedInstance] signIn];
}
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error{
    
    
}

-(IBAction)privacyButtonTapped:(id)sender{
    
}
-(void)viewWillAppear:(BOOL)animated{
[[self navigationController] setNavigationBarHidden:YES animated:YES];
}
- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {

   [DataSaved sharedInstance].strSocialLoginID = user.userID;                  // For client-side use only!
 [DataSaved sharedInstance].strSocialLoginToken  = user.authentication.idToken; // Safe to send to the server
  [DataSaved sharedInstance].strSocialLoginName = user.profile.name;
    NSString *email = user.profile.email;
    [[CheckEmailIDService sharedInstance] callCheckForEmail:email withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {

        NSLog(@"Result Dic :%@", result);
        if ([result isKindOfClass:[NSDictionary class]]) {
            if ([[result objectForKey:@"status"] isEqualToString:@"1"]) {
                [LoginService sharedInstance].uId=[result objectForKey:@"UserId"];
                FeedViewController * feedVC=[[FeedViewController alloc]initWithNibName:@"FeedViewController" bundle:nil];
                [self.navigationController pushViewController:feedVC animated:NO];
            }
            else if ([[result objectForKey:@"status"] isEqualToString:@"0"]){
                AddPhotoViewConrtrollerViewController * addVC=[[AddPhotoViewConrtrollerViewController alloc]initWithNibName:@"AddPhotoViewConrtrollerViewController" bundle:nil];
                addVC.strStatus=@"social";
                addVC.emailstr=email;
                [self googlePlusImages];
                NSURL *urlO=[NSURL URLWithString:[self.imageDict objectForKey:@"$t"]];
                UIImage * imageO;
                NSData * data=[NSData dataWithContentsOfURL:urlO];
                imageO = [UIImage imageWithData:data];
                addVC.profImage=imageO;
                 [self.navigationController pushViewController:addVC animated:NO];
            }
        }
        
    }];
    
    
    // ...
}
#pragma mark 
#pragma mark - GooglePlus
#pragma mark

-(void)googlePlusImages{
    NSString * strurl=[NSString stringWithFormat:@"%@%@%@",@"http://picasaweb.google.com/data/entry/api/user/",[DataSaved sharedInstance].strSocialLoginID,@"?alt=json"];
    NSURL * url=[NSURL URLWithString:strurl];
    NSError* error;

    NSData* data = [NSData dataWithContentsOfURL:
                    url];
    
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          
                          options:kNilOptions
                          error:&error];
    
    self.imageDict=[[json objectForKey:@"entry"] objectForKey:@"gphoto$thumbnail"];
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
