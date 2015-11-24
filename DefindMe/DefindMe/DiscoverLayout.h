//
//  DiscoverLayout.h
//  DefindMe
//
//  Created by Sumit Mahto on 02/07/15.
//  Copyright (c) 2015 Sumit Mahto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverLayout : UICollectionViewLayout
@property(nonatomic,strong)NSMutableArray * discoverArray;
@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat interItemSpacingY;
@property (nonatomic) NSInteger numberOfColumns;
@property (nonatomic) CGFloat titleHeight;

@end
