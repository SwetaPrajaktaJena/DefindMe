//
//  YouShouldMeetViewController.h
//  DefindMe
//
//  Created by Sumit Mahto on 01/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YouShouldMeetViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong)IBOutlet UITableView * matchesLeftTableView;
@property (nonatomic, strong)IBOutlet UITableView * matchesRightTableView;
@property (nonatomic, strong) NSMutableArray * fetchDataarray;
@property (nonatomic, strong)NSString * SelectedUserId;
@property (nonatomic, strong)NSString * userName;

@end
