//
//  LoginRootView.m
//  SKGDemo
//
//  Created by chensh on 15-5-26.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "LoginRootView.h"
#import "InfoEditGroupView.h"
#import "InfoEditModel.h"

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
    
    //
    _loginView = [[InfoEditGroupView alloc] initWithFrame:CGRectMake(0, _segControl.bottom + TopMarginOfSegControl * 2, ScreenWidth, 0) array:[self loginModelArray]];
    [_scrollView addSubview:_loginView];
    
    //
    _registerView = [[InfoEditGroupView alloc] initWithFrame:CGRectMake(0, _segControl.bottom + TopMarginOfSegControl * 2, ScreenWidth, 0) array:[self registerModelArray]];
    [_scrollView addSubview:_registerView];
    
    //
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(LeftMarginOfSegControl, _loginView.bottom + TopMarginOfSegControl, ScreenWidth - LeftMarginOfSegControl * 2, 40);
    [_scrollView addSubview:_button];
    
    //
    _segControl.selectedSegmentIndex = 1;
    [self showViewWithSegIndex:1];
}

- (void)showViewWithSegIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            _loginView.hidden = YES;
            _registerView.hidden = NO;
            [_button setTitle:@"注册" forState:UIControlStateNormal];
            _button.top = _registerView.bottom + TopMarginOfSegControl;
            break;
        case 1:
            _loginView.hidden = NO;
            _registerView.hidden = YES;
            [_button setTitle:@"马上登录" forState:UIControlStateNormal];
            _button.top = _loginView.bottom + TopMarginOfSegControl;
            
            break;
        default:
            break;
    }
}


#pragma mark -
- (NSArray*)loginModelArray
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    InfoEditModel *model = [[InfoEditModel alloc] init];
    model.title = @"登录账号:";
    model.placeholder = @"用户名/邮箱/手机号";
    [arr addObject:model];
    
    
    model = [[InfoEditModel alloc] init];
    model.title = @"登录密码:";
    model.placeholder = @"请填写密码";
    [arr addObject:model];
    
    return arr;
}

- (NSArray*)registerModelArray
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    InfoEditModel *model = [[InfoEditModel alloc] init];
    model.title = @"登录账号:";
    model.placeholder = @"用户名/邮箱/手机号";
    [arr addObject:model];
    
    
    model = [[InfoEditModel alloc] init];
    model.title = @"验证码:";
    model.placeholder = @"请填写收到的验证码";
    [arr addObject:model];
    
    model = [[InfoEditModel alloc] init];
    model.title = @"邮箱:";
    model.placeholder = @"请填写最常用的邮箱";
    [arr addObject:model];
    
    model = [[InfoEditModel alloc] init];
    model.title = @"登录密码:";
    model.placeholder = @"请填写密码";
    [arr addObject:model];
    
    model = [[InfoEditModel alloc] init];
    model.title = @"确认密码:";
    model.placeholder = @"请再次填写密码";
    [arr addObject:model];
    
    return arr;

}



@end
