//
//  JCBaseTableViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/6.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCDiXianFootView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBaseTableViewController : JCBaseViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, assign) UITableViewStyle style;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *dataArray;

- (void)endRefresh;

@property (nonatomic, assign) NSInteger pageNo; // 当前页码、下标默认从1开始。

@property (nonatomic, assign) NSInteger pageSize; // 每页请求数。

/**< override 刷新数据，从第一页开始 */
- (void)refreshData;


- (void)chageImageStr:(NSString *)ImageStr Title:(NSString *)title BtnTitle:(NSString *)btnTtitle;

- (void)chageTitle:(NSString *)title DetailStr:(NSString *)detail BtnTitle:(NSString *)btnTtitle;

//无网络页面
- (void)showNonetView;
//无数据页面
- (void)showNoDataView;

@property (nonatomic, strong) JCDiXianFootView *noMore_footView;


@end

NS_ASSUME_NONNULL_END
