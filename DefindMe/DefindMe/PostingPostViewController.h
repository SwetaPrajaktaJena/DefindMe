//
//  PostingPostViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 10/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostingPostViewController : UIViewController<UITextViewDelegate>
@property(nonatomic, strong)IBOutlet UITextView * textView;
@property(nonatomic, strong)IBOutlet UILabel * textViewTapped;
@property(nonatomic, strong)IBOutlet UILabel * titleLabel;
@property(nonatomic, strong)IBOutlet UILabel * nameLabel;
@property(nonatomic, strong)IBOutlet UILabel * timeLabel;
@property(nonatomic, strong)IBOutlet UIImageView * iconImage;
@property (nonatomic, strong)NSString * postNameStr;
@property (nonatomic, strong)NSString * postTitleStr;
@property (nonatomic, strong)NSString * postDateStr;
@property (nonatomic, strong)NSString * postTrackIdStr;
@property (nonatomic, strong)NSString * postContentStr;
@property (nonatomic, strong)NSString * postLikeStatusStr;
@property (nonatomic, strong)NSString * postRatingsStr;
@property (nonatomic, strong)UIImage * postIconImage;
@property (nonatomic, strong)NSString * strCONTENT;
@property (nonatomic, strong)IBOutlet UIButton * arrowButton;
@property (nonatomic, strong)NSString * strType;
-(IBAction)arrowButtonTapped:(id)sender;
@end
