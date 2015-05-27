//
//  LoginRootView.h
//  SKGDemo
//
//  Created by chensh on 15-5-26.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoEditGroupView;


@interface LoginRootView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UISegmentedControl *segControl;

@property (nonatomic, strong) InfoEditGroupView *loginView;

@property (nonatomic, strong) InfoEditGroupView *registerView;

@property (nonatomic, strong) UIButton *button;


- (void)showViewWithSegIndex:(NSInteger)index;

@end
