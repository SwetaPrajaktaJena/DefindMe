//
//  MyPhotosViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPSImagePickerController.h"
@interface MyPhotosViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,NSCoding,JPSImagePickerDelegate>
@property(nonatomic, strong)IBOutlet UIButton * addButton;
@property(nonatomic, strong)IBOutlet UIImageView * customImageView ;
@property (nonatomic, strong)IBOutlet UIButton * backButton;
@property (nonatomic, strong)IBOutlet UIButton * moreButton;
@property (nonatomic, strong)NSMutableArray * imageArray;
@property (nonatomic, strong)IBOutlet UICollectionView * photosCollectionView;
-(IBAction)addButtonTapped:(id)sender;
-(IBAction)backButtonTapped:(id)sender;
-(IBAction)moreButtonTapped:(id)sender;
-(IBAction)settingsButtonTapped:(id)sender;
@end
