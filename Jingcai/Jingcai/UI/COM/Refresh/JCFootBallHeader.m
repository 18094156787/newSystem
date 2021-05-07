//
//  JCFootBallHeader.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/10/23.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCFootBallHeader.h"

@implementation JCFootBallHeader

- (void)prepare
{
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (int i = 0; i<16; i++) {
//        NSLog(@"%@",[NSString stringWithFormat:@"Final_Animation_000%02lu", (unsigned long)i]);
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Final_Animation_000%02d", i]];
        [idleImages addObject:image];
    }
     [self setImages:idleImages forState:MJRefreshStateIdle];
//
//    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
//    NSMutableArray *refreshingImages = [NSMutableArray array];
//    for (NSUInteger i = 1; i<=3; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%zd", i]];
//        [refreshingImages addObject:image];
//    }
    [self setImages:idleImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:idleImages forState:MJRefreshStateRefreshing];
}

@end
