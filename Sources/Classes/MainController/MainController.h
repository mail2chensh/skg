//
//  MainController.h
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainController : NSObject

@property (nonatomic, strong) UITabBarController *tbController;

+ (MainController*)defaultController;


@end
