//
//  InfoEditItem.h
//  SKGDemo
//
//  Created by chensh on 15-5-26.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  InfoEditModel;

@interface InfoEditItem : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *button;

- (id)initWithFrame:(CGRect)frame model:(InfoEditModel*)model;


@end
