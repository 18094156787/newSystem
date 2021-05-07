//
//  UIView+RNNoData.h
//  NASA
//
//  Created by Administrator on 2019/7/9.
//  Copyright © 2019 rain. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIView (RNNoData)

- (void)showNoDataClearViewWithTitle:(NSString *)title;
- (void)showNoDataClearViewWithTitle:(NSString *)title isTop:(BOOL)isTop;
- (void)showNoData;
- (void)hideNoData;
- (void)showTopNoData;

//扩展
- (void)showNoQingbaoData;//暂无情报
- (void)showNoCommentData;//暂无评论
- (void)showNoZhiBoData;//暂无直播
@end
NS_ASSUME_NONNULL_END
