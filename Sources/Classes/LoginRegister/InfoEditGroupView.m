//
//  InfoEditGroupView.m
//  SKGDemo
//
//  Created by chensh on 15-5-26.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "InfoEditGroupView.h"
#import "CreateManager.h"
#import "InfoEditItem.h"

#define IEGV_HeightOfItem 40

@implementation InfoEditGroupView

- (id)initWithFrame:(CGRect)frame array:(NSArray*)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //
        UIView *sepH = [CreateManager createSeparatorView:self.width];
        sepH.frame = CGRectMake(0, 0, sepH.width, sepH.height);
        [self addSubview:sepH];
        //
        for (int i = 0; i < array.count; i++) {
            InfoEditItem *item = [[InfoEditItem alloc] initWithFrame:CGRectMake(0, sepH.bottom + i * IEGV_HeightOfItem, ScreenWidth, IEGV_HeightOfItem) model:[array objectAtIndex:i]];
            item.tag = i + 1;
            [self addSubview:item];

            if (i == array.count - 1) break;
            UIView *sepM = [CreateManager createSeparatorView:self.width - 10];
            sepM.frame = CGRectMake(5, item.bottom, sepM.width, sepM.height);
            [self addSubview:sepM];
        }
        
        sepH = [CreateManager createSeparatorView:self.width];
        sepH.frame = CGRectMake(0, array.count * (IEGV_HeightOfItem + sepH.height), sepH.width, sepH.height);
        [self addSubview:sepH];
        
        self.height = array.count * (IEGV_HeightOfItem + sepH.height) + sepH.height;
    }
    return self;
    
}

- (void)allTextFieldResignFirstResponder
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[InfoEditItem class]]) {
            [((InfoEditItem *)view).textField resignFirstResponder];
        }
    }
}


@end
