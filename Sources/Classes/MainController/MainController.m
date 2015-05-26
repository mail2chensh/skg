//
//  MainController.m
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "MainController.h"
#import "ProductViewController.h"
#import "CategoryViewController.h"
#import "CartViewController.h"
#import "UserCenterViewController.h"

static MainController* _instance = nil;

@implementation MainController

+ (MainController *)defaultController
{
    if (_instance == nil) {
        _instance = [[MainController alloc] init];
        _instance.tbController = [[UITabBarController alloc] init];
        [_instance createSubViewControllers];
    }
    return _instance;
}

- (void)createSubViewControllers
{
    //
    ProductViewController *product = [[ProductViewController alloc] init];
    product.tabBarItem.title = @"首页";
    product.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    product.tabBarItem.badgeValue = @"132";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:product];
    
    //
    CategoryViewController *category = [[CategoryViewController alloc] init];
    category.tabBarItem.title = @"分类";
    category.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:category];
    
    //
    CartViewController *cart = [[CartViewController alloc] init];
    cart.tabBarItem.title = @"购物车";
    cart.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:cart];
    
    //
    UserCenterViewController *userCenter = [[UserCenterViewController alloc] init];
    userCenter.tabBarItem.title = @"账户中心";
    userCenter.tabBarItem.image = [UIImage imageNamed:@"icon_home.png"];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:userCenter];

    //
    [[[MainController defaultController] tbController] setViewControllers:[NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nil]];
    
}

@end
