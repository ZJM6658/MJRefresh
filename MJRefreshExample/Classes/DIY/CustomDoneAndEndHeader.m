//
//  CustomDoneAndEndHeader.m
//  MJRefreshExample
//
//  Created by zhujiamin on 2016/12/8.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "CustomDoneAndEndHeader.h"

@implementation CustomDoneAndEndHeader

#pragma mark - 重写方法
#pragma mark 基本设置
- (void)prepare
{
    [super prepare];
    
    self.mj_h = 80;
    
    // 设置普通状态的动画图片
    NSArray *idleImage = @[[UIImage imageNamed:@"cus_refresh_0"]];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 0; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"cus_refresh_%zd", i]];
        [refreshingImages addObject:image];
        
    }
    
    // 设置正在刷新状态的动画图片
    [self setImages:idleImage forState:MJRefreshStateIdle];
    [self setImages:idleImage forState:MJRefreshStatePulling];
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    [self setImages:idleImage forState:MJRefreshStateRefreshSucceed];
    
    self.lastUpdatedTimeLabel.hidden = YES;
    
    [self setTitle:@"下拉刷新数据" forState:MJRefreshStateIdle];
    [self setTitle:@"松手即可刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"正在为您拼命加载中..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"刷新成功" forState:MJRefreshStateRefreshSucceed];
    
}

- (void)placeSubviews {
    [super placeSubviews];
    self.gifView.contentMode = UIViewContentModeCenter;
    self.gifView.frame = CGRectMake(0, 4, self.mj_w, self.mj_h - 20);
    self.stateLabel.frame = CGRectMake(0, self.gifView.mj_h - 10, self.mj_w, 30);
}

@end
