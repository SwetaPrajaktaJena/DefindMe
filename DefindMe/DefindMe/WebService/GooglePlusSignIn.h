//
//  GooglePlusSignIn.h
//  DefindMe
//
//  Created by Sumit Mahto on 27/07/1937 SAKA.
//  Copyright © 1937 SAKA Digi Interacts. All rights reserved.
//

#import "WebServiceBaseClass.h"
#import <UIKit/UIKit.h>
@interface GooglePlusSignIn : WebServiceBaseClass
@property (strong, nonatomic) NSMutableData *receivedData;
@property (strong, nonatomic)NSString *strImageData;
+(GooglePlusSignIn *)sharedInstance;

-(void)callGooglePlusSignInServiceForEmail:(NSString *)strEmail UserID:(NSString *)strUID deviceToken:(NSString *)devicetoken name:(NSString *)strName location:(NSString *)strLocation dob:(NSString *)strDOB gender:(NSString *)strGender profileImage:(UIImage *)imageName withCompletionHandler:(CompletionHandler)handler;

@end
