//
//  XRefreshHeaderView.m
//  im309
//
//  Created by chensh on 15-1-13.
//  Copyright (c) 2015年 chensh. All rights reserved.
//

#import "XRefreshHeaderView.h"
#import <QuartzCore/QuartzCore.h>
#import "MacroDefs.h"

#define XTableView_PullDown_Normal @"松开即可刷新……"
#define XTableView_PullDown_Pulling @"松开即可刷新……"
#define XTableView_PullDown_Loading @"正在为您刷新……"

@interface XRefreshHeaderView()
{
    XRefreshHeaderState _state;
    
    UILabel *_statusLabel;
    UIActivityIndicatorView *_activityView;
}
@end

@implementation XRefreshHeaderView

const float TopMarginOfStateLabel = 30.0f;
const float HeightOfStateLabel = 20.0f;
const float SizeOfHeaderActivityView = 21.0f;

const float ViewOffsetY = -45.0f;
const float TopOfScrollViewEdge = 50.0f;

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
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.backgroundColor = [UIColor clearColor];
    //
    _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, self.frame.size.height - TopMarginOfStateLabel, self.frame.size.width, HeightOfStateLabel)];
    _statusLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _statusLabel.font = [UIFont systemFontOfSize:14.0f];
    _statusLabel.textColor = [UIColor whiteColor];
    _statusLabel.backgroundColor = [UIColor clearColor];
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_statusLabel];
    //
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityView.frame = CGRectMake(0, 0, SizeOfHeaderActivityView, SizeOfHeaderActivityView);
    [_activityView stopAnimating];
    [self addSubview:_activityView];
    //
    [self setState:XRefreshHeader_Normal];    
}

- (void)setState:(XRefreshHeaderState)state
{
    switch (state) {
        case XRefreshHeader_Normal:
            _statusLabel.hidden = YES;
            _statusLabel.text = XTableView_PullDown_Normal;
            [_activityView stopAnimating];
            break;
            
        case XRefreshHeader_Pulling:
            _statusLabel.hidden = NO;
            _statusLabel.text = XTableView_PullDown_Pulling;
            [_activityView stopAnimating];
            break;
            
        case XRefreshHeader_Loading:
            _statusLabel.hidden = NO;
            _statusLabel.text = XTableView_PullDown_Loading;
            [_activityView startAnimating];
            break;
    }
    _state = state;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_statusLabel sizeToFit];
    _statusLabel.frame = CGRectMake((self.width - _statusLabel.width) / 2, _statusLabel.top, _statusLabel.width, HeightOfStateLabel);
    _activityView.frame = CGRectMake(_statusLabel.left - SizeOfHeaderActivityView, _statusLabel.top, SizeOfHeaderActivityView, SizeOfHeaderActivityView);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_state == XRefreshHeader_Loading) {
        CGFloat offset = MAX(-scrollView.contentOffset.y, 0);
        offset = MIN(offset, TopOfScrollViewEdge);
        scrollView.contentInset = UIEdgeInsetsMake(offset, 0, 0, 0);
        
    } else if (scrollView.isDragging) {
        BOOL _loading = NO;
        if ([self.delegate respondsToSelector:@selector(XRefreshHeaderViewDataSourceIsLoading:)]) {
            _loading = [self.delegate XRefreshHeaderViewDataSourceIsLoading:self];
        }
        if (_state == XRefreshHeader_Pulling && scrollView.contentOffset.y > ViewOffsetY && scrollView.contentOffset.y < 0.0f && !_loading) {
            [self setState:XRefreshHeader_Normal];
        } else if (_state == XRefreshHeader_Normal && scrollView.contentOffset.y < ViewOffsetY && !_loading) {
            [self setState:XRefreshHeader_Pulling];
        }
        if (scrollView.contentInset.top != 0) {
            scrollView.contentInset = UIEdgeInsetsZero;
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
{
    BOOL _loading = NO;
    if ([self.delegate respondsToSelector:@selector(XRefreshHeaderViewDataSourceIsLoading:)]) {
        _loading = [self.delegate XRefreshHeaderViewDataSourceIsLoading:self];
    }
    if (scrollView.contentOffset.y <= ViewOffsetY && !_loading) {
        if ([self.delegate respondsToSelector:@selector(XRefreshHeaderViewDidTriggerRefresh:)]) {
            [self.delegate XRefreshHeaderViewDidTriggerRefresh:self];
        }
        [self setState:XRefreshHeader_Loading];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2f];
        scrollView.contentInset = UIEdgeInsetsMake(TopOfScrollViewEdge, 0.0f, 0.0f, 0.0f);
        [UIView commitAnimations];
    }
}

- (void)scrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3f];
    scrollView.contentInset = UIEdgeInsetsZero;
    [UIView commitAnimations];
    [self setState:XRefreshHeader_Normal];
}

@end
