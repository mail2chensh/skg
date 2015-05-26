//
//  ProductTableView.m
//  SKGDemo
//
//  Created by chensh on 15-5-25.
//  Copyright (c) 2015年 Chensh. All rights reserved.
//

#import "ProductTableView.h"
#import "ProductTableViewCell.h"


@interface ProductTableView () <UITableViewDataSource, UITableViewDelegate>
{
    
}

@end

@implementation ProductTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.dataArr = [[NSMutableArray alloc] init];
    }
    return self;
}


#pragma mark - UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (ScreenWidth / 2 + 75);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.dataArr.count / 2 + self.dataArr.count % 2);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"SquareTableViewCell";
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (cell == nil) {
        cell = [[ProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.leftModel = [self.dataArr objectAtIndex:([indexPath row] * 2)];
    if (self.dataArr.count > ([indexPath row] * 2 + 1)) {
        cell.rightModel = [self.dataArr objectAtIndex:([indexPath row] * 2 + 1)];
    } else {
        cell.rightModel = nil;
    }
    
    return cell;
}

//选中一个cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
