//
//  RgistrationViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 06/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "RgistrationViewController.h"
#import "AddPhotoViewConrtrollerViewController.h"
#import "FrontViewController.h"
#import "SignUpViewController.h"
#import "UserRgistrationService.h"
#import "GooglePlusSignIn.h"
#import "DataSaved.h"
#import "ModelUser.h"
@interface RgistrationViewController ()
@property (nonatomic, strong)NSString * strDate;
@end

@implementation RgistrationViewController
@synthesize strEmailId;
@synthesize strPassword;
@synthesize strImage;
@synthesize strGender;
@synthesize profileImageView;
@synthesize datePicker;
@synthesize strDate;
@synthesize lastnameTextFld;
@synthesize locationTextFld;
@synthesize dobTextFld;
@synthesize strStatus;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   // profileImageView.contentMode = UIViewContentModeScaleAspectFit;
   // profileImageView.layer.masksToBounds = YES;

    NSLog(@"+++ %@",self.strEmailId);
    NSLog(@"+++ %@",strImage);
    NSLog(@"+++ %@",strGender);
    NSLog(@"+++ %@",strPassword);
    NSLog(@"+++ %@",profileImageView);
    [self.datepickerView setHidden:YES];
    [self.datePicker setHidden:YES];
}
-(IBAction)leftArrowButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
}
-(IBAction)rightArrowButtonTapped:(id)sender{
    if ([locationTextFld.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Add Location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
         [alert show];
    }
    if ([dobTextFld.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Add DOB" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    if ([lastnameTextFld.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Add LastName" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    if ([strStatus isEqual:@"social"]) {
                [[GooglePlusSignIn sharedInstance] callGooglePlusSignInServiceForEmail:strEmailId UserID:[DataSaved sharedInstance].strSocialLoginID deviceToken:[DataSaved sharedInstance].strSocialLoginToken name:[DataSaved sharedInstance].strSocialLoginName location:self.locationTextFld.text dob:self.dobTextFld.text gender:strGender profileImage:self.profileImageView  withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
            NSLog(@"Result Dic :%@", result);
            
            
            if (isError) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
                
            }
            else{
                if ([result isKindOfClass:[ModelUser class]]) {
                    
                }else{
                    //Create Alert for error
                }
            }
           
        }];
        
    }
    else{
    [[UserRgistrationService sharedInstance] callForRegistrationEmailId:strEmailId password:strPassword genderVal:strGender deviceToken:@" 123" UserName:self.firstnameTextFld.text UserImage:self.profileImageView withLocation:self.locationTextFld.text withDob:self.dobTextFld.text withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
    
        NSLog(@"Result Dic :%@", result);
        if (isError) {
           // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
           // [alert show];
        }
        else{
            if ([result isKindOfClass:[NSDictionary class]]) {
                NSLog(@"####%@",result);
              
            }else{
                //Create Alert for error
            }
        }
        
    }];
    }
    FrontViewController * feedVC=[[FrontViewController alloc]initWithNibName:@"FrontViewController" bundle:nil];
    [self.navigationController pushViewController:feedVC animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if ([textField isEqual: self.dobTextFld]) {
        [self.datepickerView setHidden:NO];
        [self.datePicker setHidden:NO];
        self.datePicker.datePickerMode=UIDatePickerModeDate;
        [self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
        return NO;
    }
    else{
    return YES;
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [self.dobTextFld resignFirstResponder];
        return YES;
}
- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MMM-yyyy"];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];    // show short-style date format
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];

    strDate = [dateFormatter stringFromDate:datePicker.date];
    
   
}
-(IBAction)DoneButtonTapped:(id)sender{
    self.dobTextFld.text = strDate;
    self.datePicker.hidden=YES;
    [self.datepickerView setHidden:YES];

}
-(IBAction)CancelButtonTapped:(id)sender{
    self.dobTextFld.text = @"";
    self.datePicker.hidden=YES;
    [self.datepickerView setHidden:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    [self.dobTextFld endEditing:YES];
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
