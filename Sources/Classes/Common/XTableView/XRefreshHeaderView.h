//
//  XRefreshHeaderView.h
//  im309
//
//  Created by chensh on 15-1-13.
//  Copyright (c) 2015年 chensh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ENUMDefs.h"

@class XRefreshHeaderView;

@protocol XRefreshHeaderViewDelegate <NSObject>

- (void)XRefreshHeaderViewDidTriggerRefresh:(XRefreshHeaderView*)view;
- (BOOL)XRefreshHeaderViewDataSourceIsLoading:(XRefreshHeaderView *)view;

@end

@interface XRefreshHeaderView : UIView

@property (nonatomic, weak) id<XRefreshHeaderViewDelegate> delegate;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)scrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;

@end
