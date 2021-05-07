//
//  JCCoinRecordsViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/11/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCCoinRecordsViewController.h"
#import "JCCoinRecordsTableViewCell.h"
@interface JCCoinRecordsViewController ()

@end

@implementation JCCoinRecordsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"红币记录";
    [self initViews];
    [self refreshData];

}

- (void)initViews {
  
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView registerClass:[JCCoinRecordsTableViewCell class] forCellReuseIdentifier:@"JCCoinRecordsTableViewCell"];
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
}

- (void)refreshData {
//    [self.view showLoading];
    WeakSelf;
    JCUserService_New * service = [[JCUserService_New alloc] init];
    [service getCoinRecordWithPage:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSLog(@"%@",object);
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCWCoinRecordBall class]];
            [weakSelf.dataArray addObjectsFromArray:array];
            [weakSelf.tableView reloadData];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            self.pageNo++;
             [self showNoDataView];
            [self chageImageStr:@"nodata_fangan" Title:@"您暂时还没有红币数据哦~~" BtnTitle:@""];
        }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_fangan" Title:@"您暂时还没有红币数据哦~~" BtnTitle:@""];
        [self endRefresh];
    }];

}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCCoinRecordsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCCoinRecordsTableViewCell"];
    cell.recordBall = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(76);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

@end
