//
//  ProductModel.h
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) long productID;

@property (nonatomic, assign) float price;

@property (nonatomic, assign) NSInteger favorite;

@end
