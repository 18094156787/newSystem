//
//  UIScrollView+JCRefresh.m
//  Jingcai
//
//  Created by Rain on 2018/11/21.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "UIScrollView+JCRefresh.h"

@implementation UIScrollView (JCRefresh)
- (void)addDropControlWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        refreshingBlock();
    }];
}
- (void)addPullControlWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        refreshingBlock();
    }];
    //设定自定义的文字
//    [footer setTitle:@"" forState:MJRefreshStateIdle];
//    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];
    self.mj_footer = footer;
}
- (void)endRefreshing {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}
- (void)beginRefreshing {
    [self.mj_header beginRefreshing];
}
- (void)endRefreshingWithNoMoreData {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshingWithNoMoreData];
}
//- (void)hideFooter:(BOOL)hide {
//    self.mj_footer.alpha = hide ? 0 : 1;
//}
@end
