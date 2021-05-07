//
//  UIView+NoData.h
//  Jingcai
//
//  Created by Rain on 2018/11/21.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NoDataRetryBlock)(void);
typedef void (^NoDataClickBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface UIView (NoData)
- (void)showData;
- (void)showNoData;//暂无数据
- (void)showNoDataViewClearColor;
- (void)showNoDataTopWithView:(UIView *)view;
- (void)showNoDataWithRetryBlock:(NoDataRetryBlock)retryBlock;//暂无数据(点击重试)
- (void)showNoNetwork;//无网络连接
- (void)showNoNetworkWithRetryBlock:(NoDataRetryBlock)retryBlock;//无网络连接(点击重试)
- (void)showBlank;//显示空白
- (void)showNoTuijianData;//暂无推荐(专家列表页)
- (void)showNoNewTuijianDataWithClickBlock:(NoDataClickBlock)clickBlock;//暂无最新推荐(首页)
- (UIView *)getNoDataView;

- (void)clearColor;
#pragma mark - Extend


- (void)showNoSubscribeDataWithClickBlock:(void(^)(void))clickBlock;//无关注数据
- (void)showNoMatchSKData; //本场暂无文字直播
@end
NS_ASSUME_NONNULL_END
