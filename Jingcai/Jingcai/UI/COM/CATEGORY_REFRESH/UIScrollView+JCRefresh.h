//
//  UIScrollView+JCRefresh.h
//  Jingcai
//
//  Created by Rain on 2018/11/21.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

NS_ASSUME_NONNULL_BEGIN
@interface UIScrollView (JCRefresh)
- (void)addDropControlWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;
- (void)addPullControlWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;
- (void)beginRefreshing;
- (void)endRefreshing;
- (void)endRefreshingWithNoMoreData;
//- (void)hideFooter:(BOOL)hide;
@end
NS_ASSUME_NONNULL_END
