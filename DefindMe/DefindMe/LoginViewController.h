//
//  LoginViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "NSData+Base64.h"
@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic, strong)IBOutlet UITextField * emailID;
@property(nonatomic, strong)IBOutlet UITextField * password;
@property(nonatomic, strong)IBOutlet UIButton * loginButton;
@property(nonatomic, strong)IBOutlet UIButton * backButton;
@property(nonatomic, strong)IBOutlet UIView * firstSeparator;
@property(nonatomic, strong)IBOutlet UIView * secondSeparator;
@property (strong, nonatomic) IBOutlet UIImageView * testgmeView;
@property (strong, nonatomic) IBOutlet UIImageView * testimagmeView;
-(IBAction)loginButton:(id)sender;
-(IBAction)backButtonTapped:(id)sender;
@end
