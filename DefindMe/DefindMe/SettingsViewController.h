//
//  SettingsViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UITextFieldDelegate>
@property (nonatomic, strong)IBOutlet UITextField * emailID;
@property (nonatomic, strong)IBOutlet UITextField * password;
@property (nonatomic, strong)IBOutlet UIButton * logoutButton;
-(IBAction)logOutButtonTapped:(id)sender;
@end
