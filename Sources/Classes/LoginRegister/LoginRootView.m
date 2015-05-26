//
//  LoginRootView.m
//  SKGDemo
//
//  Created by chensh on 15-5-26.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "LoginRootView.h"

#define LeftMarginOfSegControl 20
#define TopMarginOfSegControl 15
#define HeightOfSegcControl 40


@implementation LoginRootView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    //
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - HeightOfNavicontroller - HeightOfStatusBar - HeightOfXTabBarController)];
    _scrollView.contentSize = CGSizeMake(ScreenWidth, _scrollView.height + 10);
    _scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollView];
    //
    NSArray *titleArr = @[@"注册", @"登录"];
    _segControl = [[UISegmentedControl alloc] initWithItems:titleArr];
    _segControl.frame = CGRectMake(LeftMarginOfSegControl, TopMarginOfSegControl, ScreenWidth - LeftMarginOfSegControl * 2, HeightOfSegcControl);
    _segControl.tintColor = [UIColor redColor];
    [_scrollView addSubview:_segControl];

}




@end
