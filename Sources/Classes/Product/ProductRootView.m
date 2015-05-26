//
//  ProductRootView.m
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "ProductRootView.h"
#import "MacroDefs.h"

#import "SGFocusImageItem.h"
#import "ProductTableView.h"

const int CountOfImageFrame = 7;
const int HeightOfImageFrame = 150;

@interface ProductRootView()
{
    NSMutableArray *_itemArr;
}
@end

@implementation ProductRootView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)createSubviewsWithDelegate:(id<SGFocusImageFrameDelegate>)delegate
{
//    //
//    _itemArr = [[NSMutableArray alloc] init];
//    //
//    for (int i = 0; i < CountOfImageFrame; i++) {
//        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithTitle:[NSString stringWithFormat:@"title_%d", i] image:@"icon_home.png" tag:i + 1];
//        [_itemArr addObject:item];
//    }
//    _imageFrame = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, HeightOfImageFrame) delegate:delegate imageItems:_itemArr];
//    [_imageFrame scrollToIndex:0];
    
    //
    _tableView = [[ProductTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - HeightOfXTabBarController - HeightOfStatusBar - HeightOfNavicontroller) style:UITableViewStylePlain];
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _tableView.tableHeaderView = _imageFrame;
    [self addSubview:_tableView];
}




@end
