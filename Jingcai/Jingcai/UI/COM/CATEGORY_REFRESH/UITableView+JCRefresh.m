//
//  UITableView+JCRefresh.m
//  BlockStar
//
//  Created by Rain on 2018/10/26.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "UITableView+JCRefresh.h"

@implementation UITableView (JCRefresh)

@dynamic refreshFooterHidden;
- (void)setRefreshFooterHidden:(BOOL)refreshFooterHidden {
    self.mj_footer.hidden = refreshFooterHidden;
}
- (void)addDropDownControlWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        refreshingBlock();
    }];
}
- (void)addPullUpControlWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock; {
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        refreshingBlock();
    }];
    //设定自定义的文字
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];
    self.mj_footer = footer;
}
- (void)beginRefreshing {
    [self.mj_header beginRefreshing];
}
- (void)endRefreshing {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}
- (void)endRefreshingWithNoMoreData {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshingWithNoMoreData];
}
- (void)setStateWithNoMoreData {
    self.mj_footer.state = MJRefreshStateNoMoreData;
}
@end
