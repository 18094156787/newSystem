//
//  JCMyBuyColumnViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMyBuyColumnViewController.h"
#import "JCMyBuyColumnViewCell.h"
#import "JCMyBuyColumnDetailVC.h"
#import "JCColumnDetailModel.h"
#import "JCMyBuyColumnOrderVC.h"
@interface JCMyBuyColumnViewController ()

@end

@implementation JCMyBuyColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {

    [self.view showLoading];
    JCColumnService *service = [JCColumnService new];
    [service getMyBuyColumnPlanListWithPage:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCColumnDetailModel class]];
            
            [self.dataArray addObjectsFromArray:array];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;


        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}
- (void)initViews {
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 300;
    // 表格注册cell
    [self.tableView registerClass:[JCMyBuyColumnViewCell class] forCellReuseIdentifier:@"JCMyBuyColumnViewCell"];

    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    JCMyBuyColumnViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyColumnViewCell"];
    JCColumnDetailModel *model = self.dataArray[indexPath.section];
    cell.model = model;
    WeakSelf;
    cell.JCBlock = ^{
        JCMyBuyColumnOrderVC *vc = [JCMyBuyColumnOrderVC new];
        vc.order_id = model.id;
        vc.column_id = model.special_column_id;
        vc.period_id = model.period;
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    };
    return cell;

    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return AUTO(8);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCMyBuyColumnDetailVC *vc = [JCMyBuyColumnDetailVC new];
    JCColumnDetailModel *model = self.dataArray[indexPath.section];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
@end
