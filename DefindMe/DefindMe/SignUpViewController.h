//
//  SignUpViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 06/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RgistrationViewController.h"
@interface SignUpViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong)IBOutlet UILabel * signUPtitle;
@property (nonatomic, strong)IBOutlet UIButton * leftArrowButton;
@property (nonatomic, strong)IBOutlet UIButton * rightArrowButton;
@property (nonatomic, strong)IBOutlet UITextField * emailIdtextField;
@property (nonatomic, strong)IBOutlet UITextField * passwordtextField;
@property (nonatomic, strong)IBOutlet UITextField * confirmtextField;
@property (nonatomic, retain)NSString * emailStr;

-(IBAction)leftArrowButtonTapped:(id)sender;
-(IBAction)rightArrowButtonTapped:(id)sender;
@end
