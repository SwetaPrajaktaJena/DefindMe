//
//  PhotoViewsViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 12/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "PhotoViewsViewController.h"

@interface PhotoViewsViewController ()

@end

@implementation PhotoViewsViewController
@synthesize userImage;
@synthesize fullImage;
@synthesize backButton;
@synthesize nameLabel;
@synthesize locationLabel;
@synthesize userparseImage;
@synthesize locationStr;
@synthesize nameStr;
@synthesize fullparseImage;
@synthesize scrollView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.userImage.image=userparseImage;
    self.fullImage.image=fullparseImage;
    self.nameLabel.text=nameStr;
    self.locationLabel.text=locationStr;
   self.userImage.layer.cornerRadius=20.0f;
   self.userImage.layer.masksToBounds=YES;
    self.scrollView.minimumZoomScale=1;
    
    self.scrollView.maximumZoomScale=6.0;
    
   // self.scrollView.contentSize=CGSizeMake(320,960);
    
    self.scrollView.delegate=self;

}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView

{
    
    return self.fullImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)backbutton:(id)sender{
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
