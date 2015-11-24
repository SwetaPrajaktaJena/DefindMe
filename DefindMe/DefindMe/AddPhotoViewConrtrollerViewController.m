//
//  AddPhotoViewConrtrollerViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 07/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "AddPhotoViewConrtrollerViewController.h"
#import "RgistrationViewController.h"
#import "SignUpViewController.h"

@interface AddPhotoViewConrtrollerViewController ()
@property(nonatomic, strong)UIView *overlayView;
@end

@implementation AddPhotoViewConrtrollerViewController
@synthesize profileImage;
@synthesize emailstr;
@synthesize passwordstr;
@synthesize strStatus;
@synthesize strProfileImage;
@synthesize gender;
@synthesize profImage;
- (void)viewDidLoad {
    [super viewDidLoad];
     //[self.femaleButton setImage:[UIImage imageNamed:@"ellipse 3"] forState:UIControlStateNormal];
    [self.femaleButton setImage:[UIImage imageNamed:@"ellipse 3"] forState:UIControlStateNormal];
    
    profileImage.contentMode = UIViewContentModeScaleAspectFit;
    profileImage.layer.masksToBounds = YES;

     gender=@"F";
     NSLog(@"+++ %@",emailstr);
    NSLog(@"+++ %@",passwordstr);
    if (profImage) {
        self.profileImage.image=profImage;
    }
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)imageButtonTapped:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"SELECT"
                                                   delegate:self
                                          cancelButtonTitle:@"take a pic"
                                          otherButtonTitles:@"Choose", nil];
    alert.delegate=self;
    
    [alert show];
    
    
}
-(IBAction)femaleButtonTapped:(id)sender
{
    [self.femaleButton setImage:[UIImage imageNamed:@"ellipse 3"] forState:UIControlStateNormal];
    [self.maleButton setImage:[UIImage imageNamed:@"ellipse"] forState:UIControlStateNormal];
    gender=@"F";
}
-(IBAction)maleButtonTapped:(id)sender{
    [self.femaleButton setImage:[UIImage imageNamed:@"ellipse"] forState:UIControlStateNormal];
    [self.maleButton setImage:[UIImage imageNamed:@"ellipse 3"] forState:UIControlStateNormal];
    gender=@"M";
}
- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                JPSImagePickerController *imagePicker = [[JPSImagePickerController alloc] init];
                imagePicker.delegate = self;
                imagePicker.flashlightEnabled = NO;
                [self presentViewController:imagePicker animated:YES completion:nil];
            
                });
}
           }else{
               UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
               imagePickerController.delegate = self;
               imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
               
               [self presentViewController:imagePickerController animated:YES completion:nil];
    }
  }


#pragma mark - JPSImagePickerControllerDelegate

- (void)picker:(JPSImagePickerController *)picker didTakePicture:(UIImage *)picture {
    picker.confirmationString = @"Zoom in to make sure you're happy with your picture";
    picker.confirmationOverlayString = @"Analyzing Image...";
    picker.confirmationOverlayBackgroundColor = [UIColor orangeColor];
    double delayInSeconds = 1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        picker.confirmationOverlayString = @"Good Quality";
        picker.confirmationOverlayBackgroundColor = [UIColor colorWithRed:0 green:0.8f blue:0 alpha:1.0f];
    });
}

- (void)picker:(JPSImagePickerController *)picker didConfirmPicture:(UIImage *)picture {
    self.profileImage.image = picture;
}

- (void)pickerDidCancel:(JPSImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    // Dismiss the image selection, hide the picker and
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];

    self.profileImage.image=image;
    [picker dismissViewControllerAnimated:YES completion:NULL];

}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)nextButtonTapped:(id)sender{
    RgistrationViewController * registerVC=[[RgistrationViewController alloc]initWithNibName:@"RgistrationViewController" bundle:nil];
   CGSize newSize = CGSizeMake(300.0f,300.0f);
    UIGraphicsBeginImageContext(newSize);
    [profileImage.image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *dataImage = [[NSData alloc] init];
    dataImage = UIImagePNGRepresentation(newImage);
    registerVC.profileImageView=newImage;
    registerVC.strPassword=self.passwordstr;
    registerVC.strEmailId=self.emailstr;
    registerVC.strGender=self.gender;
    registerVC.strStatus=self.strStatus;
     [self.navigationController pushViewController:registerVC animated:NO];
}
-(IBAction)backButton:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
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
