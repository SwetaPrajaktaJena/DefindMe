//
//  AddPhotoViewConrtrollerViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 07/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RgistrationViewController.h"
#import "JPSImagePickerController.h"
@interface AddPhotoViewConrtrollerViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,JPSImagePickerDelegate>
@property (nonatomic, strong)IBOutlet UIImageView * profileImage;
@property (nonatomic, strong)IBOutlet UIButton * femaleButton;
@property (nonatomic, strong)IBOutlet UIButton * maleButton;
@property (nonatomic, strong)IBOutlet UIButton * femaleBigButton;
@property (nonatomic, strong)IBOutlet UIButton * maleBigButton;
@property (nonatomic, strong)IBOutlet UIButton * backButton;
@property (nonatomic, strong)IBOutlet UIButton * nextButton;
@property (nonatomic, strong)IBOutlet UIButton * imageButton;
@property (nonatomic, strong)NSString * gender;
@property (nonatomic, strong)NSString * emailstr;
@property (nonatomic, strong)NSString * passwordstr;
@property (nonatomic, strong)NSString * strStatus;
@property (nonatomic, strong)NSString * strProfileImage;
@property (nonatomic, strong)UIImage * profImage;
//@property (nonatomic, strong)RgistrationViewController * registrationVC;
-(IBAction)imageButtonTapped:(id)sender;
-(IBAction)maleButtonTapped:(id)sender;
-(IBAction)femaleButtonTapped:(id)sender;
-(IBAction)backButton:(id)sender;
-(IBAction)nextButtonTapped:(id)sender;
@end
