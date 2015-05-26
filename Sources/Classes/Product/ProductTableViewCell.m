//
//  ProductTableViewCell.m
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "ProductTableViewCell.h"
#import "ProductSummaryView.h"

#define MarginOfPSView 5
#define WidthOfPSView (ScreenWidth / 2 - 7.5)

@interface ProductTableViewCell ()
{
    ProductSummaryView *_leftView;
    ProductSummaryView *_rightView;
}
@end

@implementation ProductTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    _leftView = [[ProductSummaryView alloc] initWithFrame:CGRectMake(MarginOfPSView, 0, WidthOfPSView, WidthOfPSView + 75)];
    [self addSubview:_leftView];
    //
    _rightView = [[ProductSummaryView alloc] initWithFrame:CGRectMake(_leftView.right + MarginOfPSView, 0, _leftView.width, _leftView.height)];
    [self addSubview:_rightView];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
