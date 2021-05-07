//
//  UIView+JCLoading.h
//  Jingcai
//
//  Created by Administrator on 2019/2/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JCLoadingRetryBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface UIView (JCLoading)
- (void)showLoading;
- (void)showLoadingTop;
//- (void)showLoadingFailure;
- (void)showLoadingFailureWithRetryBlock:(JCLoadingRetryBlock)retryBlock;
- (void)endLoading;
@end
NS_ASSUME_NONNULL_END
