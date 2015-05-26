//
//  ProductViewController.m
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductRootView.h"

#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"
#import "ProductTableView.h"

#import "ProductModel.h"


@interface ProductViewController () <SGFocusImageFrameDelegate>
{
    ProductRootView *_rootView;
}
@end

@implementation ProductViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    //
    _rootView = [[ProductRootView alloc] initWithFrame:self.view.frame];
    [_rootView createSubviewsWithDelegate:self];
    
    self.view = _rootView;
    
    //
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 13; i++) {
        ProductModel *model = [[ProductModel alloc] init];
        [arr addObject:model];
    }
    _rootView.tableView.dataArr = arr;
    [_rootView.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item
{
    
}

- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame currentItem:(int)index;
{
    NSLog(@"%s \n scrollToIndex===>%d",__FUNCTION__,index);
}



@end
