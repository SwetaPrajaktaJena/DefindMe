//
//  commentsTableViewCell.h
//  DefindMe
//
//  Created by Sumit Mahto on 08/07/1937 SAKA.
//  Copyright © 1937 SAKA Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface commentsTableViewCell : UITableViewCell
@property (nonatomic,strong)IBOutlet UIImageView * profileImageView;
@property (nonatomic,strong)IBOutlet UILabel * nameLabel;
@property (nonatomic,strong)IBOutlet UILabel * timeLabel;
@property (nonatomic,strong)IBOutlet UILabel * commentsLabel;
@end
