//
//  XTableView.m
//  im309
//
//  Created by chensh on 15-1-13.
//  Copyright (c) 2015年 chensh. All rights reserved.
//

#import "XTableView.h"
#import "MacroDefs.h"
#import "XRefreshHeaderView.h"

#define XTableView_PullUp_Normal @"上拉加载更多……"
#define XTableView_PullUp_Loading @"正在为您努力加载……"
#define XTableView_PullUp_NoMore @"没有更多数据了!"



@interface XTableView () <XRefreshHeaderViewDelegate>
{
    UIButton *_moreButton;
    UIActivityIndicatorView *_activityView;
    
    
    BOOL _isPullDownLoading;
    XRefreshHeaderView *_headerView;
}

@end

@implementation XTableView

const float HeightOfMoreButton = 40.0f;
const float SizeOfActivityView = 20.0f;
const float leftMarginOfActivityView = 100.0f;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.haveMoreData = YES;
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews
{
    //
    _headerView = [[XRefreshHeaderView alloc] initWithFrame:CGRectMake(0.0f, - self.bounds.size.height, self.width, self.height)];
    _headerView.delegate = self;
    [self addSubview:_headerView];
    
    //
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _moreButton.backgroundColor = [UIColor clearColor];
    _moreButton.frame = CGRectMake(0, 0, ScreenWidth, HeightOfMoreButton);
    _moreButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [_moreButton setTitle:XTableView_PullUp_Normal forState:UIControlStateNormal];
    [_moreButton addTarget:self action:@selector(moreButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];

    //
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityView.frame = CGRectMake((ScreenWidth - _moreButton.titleLabel.size.width ) / 2 - SizeOfActivityView * 2, (HeightOfMoreButton - SizeOfActivityView) / 2, SizeOfActivityView, SizeOfActivityView);
    [_activityView stopAnimating];
    [_moreButton addSubview:_activityView];
    self.tableFooterView = _moreButton;
}


- (void)reloadData
{
    [super reloadData];
    
    [self stopLoading];
}

- (void)moreButtonDidTouch:(id)sender
{
    if ([self.pullDelegate respondsToSelector:@selector(XTableViewPullUp:)]) {
        [self.pullDelegate XTableViewPullUp:self];
        [self startLoadMoreData];
    }
}

- (void)stopLoading
{
    _isPullDownLoading = NO;
    [_headerView scrollViewDataSourceDidFinishedLoading:self];
    [self stopLoadMoreData];
}

#pragma mark - Load More
- (void)startLoadMoreData
{
    [_moreButton setTitle:XTableView_PullUp_Loading forState:UIControlStateNormal];
    _moreButton.hidden = NO;
    [_activityView startAnimating];
}

- (void)stopLoadMoreData
{
    if (self.haveMoreData) {
        [_moreButton setTitle:XTableView_PullUp_Normal forState:UIControlStateNormal];
        _moreButton.hidden = YES;
    } else {
        [_moreButton setTitle:XTableView_PullUp_NoMore forState:UIControlStateNormal];
        _moreButton.hidden = NO;
    }
    [_activityView stopAnimating];
}

#pragma mark - UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    [_headerView scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_headerView scrollViewDidEndDragging:scrollView];
    //
    if (!self.haveMoreData) return;
    float offset = scrollView.contentOffset.y;
    float contentHeight = scrollView.contentSize.height;
    float sub = contentHeight - offset;
    if (sub - scrollView.height < -35) {
        [self startLoadMoreData];
        if ([self.pullDelegate respondsToSelector:@selector(XTableViewPullUp:)]) {
            [self.pullDelegate  XTableViewPullUp:self];
        }
    }
}

#pragma mark - XRefreshHeaderViewDelegate Methods
- (void)XRefreshHeaderViewDidTriggerRefresh:(XRefreshHeaderView *)view
{
    _isPullDownLoading = YES;
    if ([self.pullDelegate respondsToSelector:@selector(XTableViewPullDown:)]) {
        [self.pullDelegate XTableViewPullDown:self];
    }
//    [self performSelector:@selector(stopLoading) withObject:nil afterDelay:3.0f];
}

- (BOOL)XRefreshHeaderViewDataSourceIsLoading:(XRefreshHeaderView *)view
{
    return _isPullDownLoading;
}


@end
