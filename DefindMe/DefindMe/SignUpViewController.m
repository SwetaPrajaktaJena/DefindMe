//
//  SignUpViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 06/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "SignUpViewController.h"
#import "RgistrationViewController.h"
#import "AddPhotoViewConrtrollerViewController.h"
#import "UserRgistrationService.h"
#import "ModelUser.h"
#import "FrontViewController.h"
@interface SignUpViewController ()

@end

@implementation SignUpViewController
@synthesize leftArrowButton;
@synthesize rightArrowButton;
@synthesize emailIdtextField;
@synthesize passwordtextField;
@synthesize confirmtextField;
@synthesize emailStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
-(IBAction)leftArrowButtonTapped:(id)sender
{
    FrontViewController * loinVC=[[FrontViewController alloc] initWithNibName:@"FrontViewController" bundle:nil];
    [self.navigationController pushViewController:loinVC animated:NO];
}
-(IBAction)rightArrowButtonTapped:(id)sender{
    NSString *strEmail = self.emailIdtextField.text;
    NSString *strPassword = self.passwordtextField.text;
   /* */
   AddPhotoViewConrtrollerViewController * addPhoto=[[AddPhotoViewConrtrollerViewController alloc]initWithNibName:@"AddPhotoViewConrtrollerViewController" bundle:nil];
    addPhoto.emailstr=self.emailIdtextField.text;
    addPhoto.passwordstr=self.passwordtextField.text;
   addPhoto.strStatus=@"App";
    [self.navigationController pushViewController:addPhoto animated:NO];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)validateEmailWithString:(NSString*)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (![self validateEmailWithString:emailIdtextField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Enter Correct EmailId" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
     if ([textField isEqual:confirmtextField]) {
        if (![self.confirmtextField.text isEqualToString:self.passwordtextField.text]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Please Enter same Password  as ConfirmPassword" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }
        
    }
    [textField resignFirstResponder];
    return YES;
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
