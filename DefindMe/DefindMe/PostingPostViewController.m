//
//  PostingPostViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 10/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import "PostingPostViewController.h"
#import "FeedViewController.h"
#import "NewPostService.h"
#import "LoginService.h"
#import "ModelUser.h"
@interface PostingPostViewController ()
@property(nonatomic, assign)BOOL doneBool;
@end

@implementation PostingPostViewController
@synthesize textViewTapped;
@synthesize postIconImage;
@synthesize postDateStr;
@synthesize postNameStr;
@synthesize postTitleStr;
@synthesize arrowButton;
@synthesize postContentStr;
@synthesize postLikeStatusStr;
@synthesize postRatingsStr;
@synthesize postTrackIdStr;
@synthesize strType;
@synthesize strCONTENT;
@synthesize doneBool;
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:(246/255.f) green:(246/255.f) blue:(246/255.f) alpha:1]];
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    navLabel.backgroundColor = [UIColor clearColor];
    [navLabel setTextColor:[UIColor grayColor]];
    navLabel.font = [UIFont fontWithName:@"Lato-Bold" size:15];
    navLabel.text = @"Post";
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:(UIBarButtonItemStylePlain) target:self action:@selector(backButtonTapped)];
    self.navigationItem.rightBarButtonItem=backButtonItem;
   backButtonItem.target=[UIColor grayColor];
    self.doneBool=NO;
    UIBarButtonItem *clearButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:(UIBarButtonItemStylePlain) target:self action:@selector(doneButtonTapped)];
    self.navigationItem.rightBarButtonItem=clearButtonItem;
    clearButtonItem.tintColor=[UIColor grayColor];
    self.nameLabel.text=self.postNameStr;
    self.timeLabel.text=self.postDateStr;
    self.titleLabel.text=self.postTitleStr;
    self.iconImage.image=self.postIconImage;
     self.strCONTENT=[NSString stringWithFormat:@"%@",self.postContentStr];
    NSLog(@"**%@",strCONTENT);
}
-(void)backButtonTapped{
    [self.navigationController popViewControllerAnimated:NO];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString *string = [textView.text stringByReplacingCharactersInRange:range withString:text];
    self.textViewTapped.hidden=YES;
    self.strCONTENT=[NSString stringWithFormat:@"%@%@",string,self.postContentStr];

    if ([text isEqualToString:@"\n"])
    {
        NSString *currentString = [string stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
        [textView resignFirstResponder];
        NSLog(@"currentWord==> %@",currentString);
    }
    
    return YES;
}
-(IBAction)arrowButtonTapped:(id)sender{
    
    }
-(void)doneButtonTapped{
   
    if (!doneBool) {
    [[NewPostService sharedInstance] callLoginServiceForTags:@"test" andUID:[LoginService sharedInstance].uId content:self.strCONTENT feed:[LoginService sharedInstance].uId privacy:@"public" recommendID:@"10" parentId:self.postTrackIdStr withCompletionHandler:^(id result, BOOL isError, NSString *strMsg)
     {
         NSLog(@"Result Dic :%@", result);
         NSLog(@"Result Dic :%@", strCONTENT);
         
         if (isError) {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
             //[alert show];
         }
         else{
             if ([result isKindOfClass:[ModelUser class]]) {
                                 //Create Alert for error
             }
         }
         FeedViewController * feedVC=[[FeedViewController alloc]initWithNibName:@"FeedViewController" bundle:nil];
         feedVC.nwFeed=@"nwPost";
         [self.navigationController pushViewController:feedVC animated:NO];
        
  
     }];
         doneBool=YES;
    }
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
