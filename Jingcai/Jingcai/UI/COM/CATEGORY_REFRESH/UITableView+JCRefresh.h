//
//  UITableView+JCRefresh.h
//  BlockStar
//
//  Created by Rain on 2018/10/26.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MJDIYFooterViewType) {
    MJDIYFooterViewTypeDefault,
    MJDIYFooterViewTypeHomeGuide
};

@interface UITableView (JCRefresh)
@property (assign, nonatomic) BOOL refreshFooterHidden;
- (void)addDropDownControlWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;
- (void)addPullUpControlWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;
- (void)beginRefreshing;
- (void)endRefreshing;
- (void)endRefreshingWithNoMoreData;

- (void)setStateWithNoMoreData;
@end

NS_ASSUME_NONNULL_END
