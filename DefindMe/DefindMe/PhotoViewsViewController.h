//
//  PhotoViewsViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 12/08/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewsViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic, strong)IBOutlet UIButton * backButton;
@property (nonatomic, strong)IBOutlet UIImageView * userImage;
@property (nonatomic, strong)IBOutlet UILabel * nameLabel;
@property (nonatomic, strong)IBOutlet UILabel * locationLabel;
@property (nonatomic, strong)IBOutlet UIImageView * fullImage;
@property (nonatomic, strong)NSString * nameStr;
@property (nonatomic, strong)NSString * locationStr;
@property (nonatomic, strong)UIImage * userparseImage;
@property (nonatomic, strong)UIImage * fullparseImage;
@property (nonatomic, strong)IBOutlet UIScrollView * scrollView;
-(IBAction)backbutton:(id)sender;
@end
