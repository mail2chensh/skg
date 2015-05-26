//
//  MacroDefs.h
//  im309
//
//  Created by wuruijian on 14-11-14.
//  Copyright (c) 2014年 chensh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MacroDefs : NSObject

//====================================================================//
#pragma mark --
//====================================================================//

// 系统版本号
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

// 是否是iOS7
#define iOS_7 ((SystemVersion >= 7.0 && SystemVersion < 8.0)?YES:NO)

// 是否为iOS8
#define iOS_8 ((SystemVersion >= 8.0)?YES:NO)

//颜色值
#define RGBColorMake(_R_,_G_,_B_,_alpha_) [UIColor colorWithRed:_R_/255.0 green:_G_/255.0 blue:_B_/255.0 alpha:_alpha_]


//====================================================================//
#pragma mark --
//====================================================================//

// 获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

// 获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

// 底部导航栏高度
#define HeightOfXTabBarController 49

// 导航栏高度
#define HeightOfNavicontroller 44

// 状态栏高度
#define HeightOfStatusBar 20




//====================================================================//
#pragma mark --
//====================================================================//




//====================================================================//
#pragma mark --
//====================================================================//

//
#define RESPONSE_CONST_FLAG @"flag"

#define RESPONSE_CONST_DATA @"data"

#define RESPONSE_CONST_FLAG_ERROR @"ERROR"

#define RESPONSE_CONST_FLAG_DATA @"DATA"

#define RESPONSE_CONST_FLAG_TOKEN @"TOKEN"



//====================================================================//
#pragma mark --
//====================================================================//











@end
