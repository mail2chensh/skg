//
//  ProductRootView.h
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGFocusImageFrame.h"
@class ProductTableView;


@interface ProductRootView : UIView

@property (nonatomic, strong) SGFocusImageFrame *imageFrame;

@property (nonatomic, strong) ProductTableView *tableView;

- (void)createSubviewsWithDelegate:(id<SGFocusImageFrameDelegate>)delegate;

@end
