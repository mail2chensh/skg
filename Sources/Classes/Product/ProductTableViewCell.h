//
//  ProductTableViewCell.h
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ProductModel;

@interface ProductTableViewCell : UITableViewCell

@property (nonatomic, strong) ProductModel *leftModel;

@property (nonatomic, strong) ProductModel *rightModel;

@end
