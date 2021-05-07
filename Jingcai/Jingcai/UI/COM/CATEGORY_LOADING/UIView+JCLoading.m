//
//  UIView+JCLoading.m
//  Jingcai
//
//  Created by Administrator on 2019/2/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "UIView+JCLoading.h"
#import "Masonry.h"
#import "JCLoadingView.h"
#import "JCLoadingFailureView.h"
#import "JCCustomLoadingView.h"
#define JCLoadingViewTAG 90001
#define JCLoadingFailureViewTAG 90002
@implementation UIView (JCLoading)
- (void)showLoading {
    [self removeLoadingView];
    [self addLoadingView];
}



- (void)showLoadingTop {
    [self removeLoadingView];
    [self addLoadingTopView];
}

- (void)showLoadingFailureWithRetryBlock:(JCLoadingRetryBlock)retryBlock {
    [self removeLoadingFailureView];
    [self addLoadingFailureView];
    JCLoadingFailureView * loadingFailureView = [self viewWithTag:JCLoadingFailureViewTAG];
    loadingFailureView.failureViewRetryBlock = ^{
        if (retryBlock) {
            retryBlock();
        }
    };
}
- (void)endLoading {
    [self removeLoadingView];
    [self removeLoadingFailureView];
}

#pragma mark - Base
//- (UIView *)addLoadingView {
//    JCLoadingView * loadingView = [JCLoadingView viewFromXib];
//    loadingView.backgroundColor = JCClearColor;
//    loadingView.activity.tintColor = JCBaseColor;
//    loadingView.tag = JCLoadingViewTAG;
//    [self addSubview:loadingView];
//    //添加约束
//    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(self.mas_width);
//        make.height.equalTo(self.mas_height);
//        UIEdgeInsets padding = UIEdgeInsetsZero;
//        make.top.equalTo(self.mas_top).with.offset(padding.top);
//        make.left.equalTo(self.mas_left).with.offset(padding.left);
////        make.bottom.equalTo(self.mas_bottom).with.offset(-padding.bottom);
////        make.right.equalTo(self.mas_right).with.offset(-padding.right);
//    }];
//
//    return loadingView;
//}
- (UIView *)addLoadingView {
    JCCustomLoadingView * loadingView = [JCCustomLoadingView new];
//    loadingView.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
//    loadingView.activity.tintColor = JCBaseColor;
    loadingView.tag = JCLoadingViewTAG;
    [self addSubview:loadingView];
    //添加约束
    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.centerY.equalTo(self);
//        make.width.height.mas_equalTo(135);
        make.width.equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
        UIEdgeInsets padding = UIEdgeInsetsZero;
        make.top.equalTo(self.mas_top).with.offset(padding.top);
        make.left.equalTo(self.mas_left).with.offset(padding.left);
    }];

    return loadingView;
}




- (UIView *)addLoadingTopView {
//    JCLoadingView * loadingView = [JCLoadingView viewFromXib];
    JCCustomLoadingView * loadingView = [JCCustomLoadingView new];
//    loadingView.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
//    loadingView.backgroundColor = JCClearColor;
    loadingView.tag = JCLoadingViewTAG;
    [self addSubview:loadingView];
    //添加约束
    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(self.mas_width);
        make.width.height.mas_equalTo(135);
        UIEdgeInsets padding = UIEdgeInsetsZero;
        make.top.equalTo(self.mas_top).with.offset(padding.top);
        make.centerX.equalTo(self);
//        make.left.equalTo(self.mas_left).with.offset(padding.left);
//        make.bottom.equalTo(self.mas_bottom).with.offset(-padding.bottom);
//        make.right.equalTo(self.mas_right).with.offset(-padding.right);
    }];
    return loadingView;
}
//- (void)removeLoadingView {
//    JCLoadingView * loadingView = [self viewWithTag:JCLoadingViewTAG];
//    if (!loadingView) {
//        return ;
//    }
//    [loadingView removeFromSuperview];
//}
- (void)removeLoadingView {
    JCCustomLoadingView * loadingView = [self viewWithTag:JCLoadingViewTAG];
    if (!loadingView) {
        return ;
    }
    [loadingView removeFromSuperview];
}


- (UIView *)addLoadingFailureView {
    JCLoadingFailureView * loadingFailureView = [JCLoadingFailureView viewFromXib];
    loadingFailureView.tag = JCLoadingFailureViewTAG;
    [self addSubview:loadingFailureView];
    //添加约束
    [loadingFailureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.mas_width);
        make.height.equalTo(self.mas_height);
        UIEdgeInsets padding = UIEdgeInsetsZero;
        make.top.equalTo(self.mas_top).with.offset(padding.top);
        make.left.equalTo(self.mas_left).with.offset(padding.left);
//        make.bottom.equalTo(self.mas_bottom).with.offset(-padding.bottom);
//        make.right.equalTo(self.mas_right).with.offset(-padding.right);
    }];
    return loadingFailureView;
}
- (void)removeLoadingFailureView {
    JCLoadingFailureView * loadingFailureView = [self viewWithTag:JCLoadingFailureViewTAG];
    if (!loadingFailureView) {
        return ;
    }
    [loadingFailureView removeFromSuperview];
}
@end
