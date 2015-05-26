//
//  InfoEditItem.m
//  SKGDemo
//
//  Created by chensh on 15-5-26.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "InfoEditItem.h"
#import "InfoEditModel.h"


#define IEI_LeftMarginOfLabel 10
#define IEI_TopMarginOfLabel 10
#define IEI_HeightOfLabel 30
#define IEI_WidthOfLabel 90

#define IEI_WidthOfButton 120


@interface InfoEditItem ()
{

}
@end

@implementation InfoEditItem

- (id)initWithFrame:(CGRect)frame model:(InfoEditModel*)model
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(IEI_LeftMarginOfLabel, IEI_TopMarginOfLabel, IEI_WidthOfLabel, IEI_HeightOfLabel)];
        _titleLabel.text = model.title;
        [self addSubview:_titleLabel];
        //
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(_titleLabel.left + IEI_LeftMarginOfLabel, _titleLabel.height, self.width - _titleLabel.width - IEI_LeftMarginOfLabel * 3, _titleLabel.height)];
        _textField.placeholder = model.placeholder;
        [self addSubview:_textField];
        //
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _button.frame = CGRectMake(self.width - IEI_LeftMarginOfLabel, IEI_TopMarginOfLabel / 2, IEI_WidthOfButton, self.height - IEI_TopMarginOfLabel);
        [_button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self addSubview:_button];
        //    _button.hidden = YES;
    }
    return self;
}




@end
