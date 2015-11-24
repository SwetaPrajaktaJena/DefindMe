//
//  NotificationViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)IBOutlet UITableView * notificationTableView;
@property (nonatomic, strong)NSMutableArray * imageArray;
@property (nonatomic, strong)NSMutableArray * nameArray;
@property (nonatomic, strong)NSMutableArray * commentArray;
@property (nonatomic, strong)NSMutableArray * timeArray;
@property (nonatomic, strong)NSMutableArray * posterUrlArray;
@property (nonatomic, strong)NSMutableArray * itemIdArray;
@property (nonatomic, strong)NSMutableArray * userItemIdArray;
@end
