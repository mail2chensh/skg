//
//  ProductSummaryView.m
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "ProductSummaryView.h"

const int PSV_TopMargin = 5;

@interface ProductSummaryView ()
{
    UIImageView *_imageView;
    UILabel *_nameLabel;
    UILabel *_priceLabel;
    UIImageView *_favImageview;
    UILabel *_favLabel;
}
@end

@implementation ProductSummaryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}


- (void)createSubviews
{
    //
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.width)];
    _imageView.image = [UIImage imageNamed:@"product.jpg"];
    [self addSubview:_imageView];
    //
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.bottom + PSV_TopMargin, self.width, 30)];
    _nameLabel.text = @"namefjaslgjlas jglsajgfjslfjsdlfjsld sdfls";
    [self addSubview:_nameLabel];
    //
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.left, _nameLabel.bottom + PSV_TopMargin, self.width / 2, 30)];
    _priceLabel.text = @"$399.0";
    [self addSubview:_priceLabel];
    //
    _favLabel = [[UILabel alloc] init];
    _favLabel.text = @"9999";
    [_favLabel sizeToFit];
    _favLabel.frame = CGRectMake(self.width - _favLabel.width, _priceLabel.top, _favLabel.width, 30);
    [self addSubview:_favLabel];
    
}

- (void)setModel:(ProductModel *)model
{
    if (model == nil) {
        _model = nil;
        self.hidden = YES;
    } else if (_model != model) {
        _model = model;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    
}



@end
