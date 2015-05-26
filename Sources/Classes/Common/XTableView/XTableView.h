//
//  XTableView.h
//  im309
//
//  Created by chensh on 15-1-13.
//  Copyright (c) 2015年 chensh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XTableView;

@protocol XTableViewDelegate <NSObject>

- (void)XTableViewPullDown:(XTableView*)tableView;
- (void)XTableViewPullUp:(XTableView*)tableView;

@end


@interface XTableView : UITableView

@property (nonatomic, assign) BOOL needPullDown;

@property (nonatomic, weak) id<XTableViewDelegate> pullDelegate;

@property (nonatomic, assign) BOOL haveMoreData;

- (void)stopLoading;


@end
