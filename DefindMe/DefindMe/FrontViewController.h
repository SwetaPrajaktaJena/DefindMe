//
//  FrontViewController.h
//  DefineMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@class GIDSignInButton;
@interface FrontViewController : BaseViewController
@property (nonatomic, strong)IBOutlet UIImageView * frontLogo;
@property (nonatomic, strong)IBOutlet UIButton * facebookButton;
@property (nonatomic, strong)IBOutlet UIButton * gogleButton;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic, strong)IBOutlet UIButton * signupButton;
@property (nonatomic, strong)IBOutlet UIButton * privacyPolicyButton;
@property (nonatomic, strong)IBOutlet UIButton * facebookLoginButton;
@property (nonatomic, strong)IBOutlet UIButton * googleLoginButton;
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;
-(IBAction)LoginButtonTapped:(id)sender;
-(IBAction)SignupButtonTapped:(id)sender;
-(IBAction)facebookButtonTapped:(id)sender;
-(IBAction)googleButtonTapped:(id)sender;
-(IBAction)privacyButtonTapped:(id)sender;

@end
