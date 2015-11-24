//
//  RgistrationViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 06/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserRgistrationService.h"
@interface RgistrationViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong)IBOutlet UITextField * firstnameTextFld;
@property (nonatomic, strong)IBOutlet UITextField * lastnameTextFld;
@property (nonatomic, strong)IBOutlet UITextField * locationTextFld;
@property (nonatomic, strong)IBOutlet UITextField * dobTextFld;
@property (nonatomic, strong)IBOutlet UILabel * registrationtitle;
@property (nonatomic, strong)IBOutlet UIButton * leftArrowButton;
@property (nonatomic, strong)IBOutlet UIButton * rightArrowButton;
@property (nonatomic, strong)NSString * strEmailId;
@property (nonatomic, strong)NSString * strPassword;
@property (nonatomic, strong)NSString * strImage;
@property (nonatomic, strong)NSString * strGender;
@property (nonatomic, strong)NSString * strStatus;
@property (nonatomic, strong)IBOutlet UIButton * doneButton;
@property (nonatomic, strong)IBOutlet UIButton * cancelButton;
@property (nonatomic, strong)IBOutlet UIView * datepickerView;
@property (nonatomic, strong)IBOutlet UIImage * profileImageView;
@property (nonatomic, strong)IBOutlet UIDatePicker * datePicker;
-(IBAction)leftArrowButtonTapped:(id)sender;
-(IBAction)rightArrowButtonTapped:(id)sender;
-(IBAction)DoneButtonTapped:(id)sender;
-(IBAction)CancelButtonTapped:(id)sender;
@end
