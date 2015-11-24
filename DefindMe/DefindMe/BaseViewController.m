//
//  BaseViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 29/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)alertStatusWithTitle:(NSString *)strTitle andMessage:(NSString*)strMessage{
    UIAlertView * alert=[[UIAlertView alloc]initWithTitle:strTitle message:strMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil]
    ;
    [alert show];
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
