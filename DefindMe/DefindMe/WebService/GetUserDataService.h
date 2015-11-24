//
//  GetUserDataService.h
//  DefindMe
//
//  Created by Sumit Mahto on 31/06/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import "WebServiceBaseClass.h"

@interface GetUserDataService : WebServiceBaseClass
@property(nonatomic, strong)NSString * userName;
@property (nonatomic, strong)NSString * strSearch;
+(GetUserDataService *)sharedInstance;
-(void)getUserDatawithUSerId:(NSString *)userID withLoginUSerId:(NSString *)LoginID withCompletionHandler:(CompletionHandler)handler;

@end
