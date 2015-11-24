//
//  MyPhotosViewController.m
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "MyPhotosViewController.h"
#import "SWRevealViewController.h"
#import "PhotosCollectionViewCell.h"
#import "AppDelegate.h"
#import "ProfileImageUploadWebservice.h"
#import "LoginService.h"
#import "ModelUser.h"
#import "GetUserAlbumService.h"
#import "PhotoLibraryServices.h"
#import "PhotosLibraryCollectionViewCell.h"
#import "ProfileImageUploadWebservice.h"
@interface MyPhotosViewController ()<UIAlertViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,JPSImagePickerDelegate>{
    AppDelegate * appdelegate;
}
@property (nonatomic, strong)NSMutableArray * pic;
@property (nonatomic, strong)NSMutableArray * imageArry;
@property (nonatomic, strong)NSMutableArray * titleArray;
@property (nonatomic, strong)NSMutableArray * albumArray;
@property (nonatomic, strong)NSMutableDictionary *albumDict;
@end

@implementation MyPhotosViewController
@synthesize addButton;
@synthesize customImageView;
@synthesize photosCollectionView;
@synthesize pic;
@synthesize imageArry;
@synthesize titleArray;
@synthesize albumArray;
@synthesize albumDict;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"MyPhotos";
   
    SWRevealViewController *revealController = [self revealViewController];
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    [self.backButton addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
      // Do any additional setup after loading the view from its nib.
    self.imageArray=[[NSMutableArray alloc]initWithCapacity:10];
   // [self.photosCollectionView registerClass:[PhotosCollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    self.customImageView.layer.cornerRadius=20.0f;
     [[GetUserAlbumService sharedInstance] GetUserAlbumServiceid:[LoginService sharedInstance].uId withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
        
        if (isError) {
            //alertview
        }
        else{
                if (![result isKindOfClass:[NSNull class]]) {
                    NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                    NSLog(@"***%@",resultDic);
                    albumArray=[resultDic objectForKey:@"albums"];
                    if ([albumArray count]>0) {
                      albumDict=[albumArray objectAtIndex:1];
                    }
                    [PhotoLibraryServices sharedInstance].totalImages=[[albumDict objectForKey:@"Album"] objectForKey:@"total_images"];
                    [PhotoLibraryServices sharedInstance].alubumId=[[albumDict objectForKey:@"Album"] objectForKey:@"id"];
                    [PhotoLibraryServices sharedInstance].userID=[LoginService sharedInstance].uId;
                    [[PhotoLibraryServices sharedInstance] GetUserAlbumServiceidwithCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
                        NSLog(@"Result Dic :%@", result);
                    if ([result isKindOfClass:[NSDictionary class]]) {
                            NSDictionary *resultDic = [NSDictionary dictionaryWithDictionary:result];
                            NSLog(@"Result Dic :%@", resultDic);
                             NSLog(@"Result Album:%@",titleArray);
                            self.titleArray=[resultDic valueForKey:@"imagesDetails"];
                                                       NSLog(@"****%@",self.titleArray);
                        [self.photosCollectionView registerNib:[UINib nibWithNibName:@"PhotosCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
                        self.photosCollectionView.delegate=self;
                        self.photosCollectionView.dataSource=self;
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.photosCollectionView reloadData];
                            
                        });

                           // [ProfileImageUploadWebservice sharedInstance].alubums=self.titleArray;
                        }
                    }];
                    

    }
        }
    }];
    /*titleArray =[[NSMutableArray alloc]initWithObjects:@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",@"group 1.png",@"group 3.png",nil];*/
    
     // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
  
    
    //[self.photosCollectionView reloadData];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.titleArray count];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(PhotosCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   PhotosCollectionViewCell *cell = [self.photosCollectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    // NSData* imageData = [ objectAtIndex:indexPath.row];
    // UIImage* image = [UIImage imageWithData:imageData];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        
        NSString * picId=[[[self.titleArray objectAtIndex:indexPath.row]objectForKey:@"Image"] objectForKey:@"id"];
        NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",@"http://www.defindme.com/defindme_cdn/image/",picId,@"_i"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.photoImgVw.image=image;
        });
    });
    return cell;
}

-(IBAction)addButtonTapped:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"SELECT"
                                                   delegate:self
                                          cancelButtonTitle:@"Take a pic"
                                          otherButtonTitles:@"Choose", nil];
    alert.delegate=self;
    
    [alert show];
   
}
-(IBAction)settingsButtonTapped:(id)sender{
    
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
           
                JPSImagePickerController *imagePicker = [[JPSImagePickerController alloc] init];
                imagePicker.delegate = self;
                imagePicker.flashlightEnabled = NO;
                [self presentViewController:imagePicker animated:YES completion:nil];
                
                }
    }
    else{
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }

}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{

    // Dismiss the image selection, hide the picker and
   
    UIImage *image =  [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [customImageView setImage:image];
    customImageView.contentMode = UIViewContentModeScaleAspectFill;
    CGSize newSize = CGSizeMake(300.0f,300.0f);
    UIGraphicsBeginImageContext(newSize);
    [customImageView.image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData* imageData = UIImagePNGRepresentation(newImage);
    NSData* myEncodedImageData = [NSKeyedArchiver archivedDataWithRootObject:imageData];
    [self.pic addObject:myEncodedImageData];
    [self.imageArray addObject:newImage];
    
//save images into server
    [[ProfileImageUploadWebservice sharedInstance] callLoginServiceForTags:@"tags" andUID:[LoginService sharedInstance].uId content:@"12" feed:[LoginService sharedInstance].uId privacy:@"public" albumID:@"0" fullimage:newImage file:newImage withCompletionHandler:^(id result, BOOL isError, NSString *strMsg) {
    
        NSLog(@"Result Dic :%@", result);
        
        
        if (isError) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            //[alert show];
        }
        else{
            if ([result isKindOfClass:[ModelUser class]]) {
               
            }else{
                //Create Alert for error
            }
        }
    
    }];
     /* */
    
}
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
    self.customImageView.image = picture;
}

- (void)pickerDidCancel:(JPSImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(IBAction)backButtonTapped:(id)sender{
    [self.navigationController popViewControllerAnimated:NO];
}
-(IBAction)moreButtonTapped:(id)sender{
    
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
