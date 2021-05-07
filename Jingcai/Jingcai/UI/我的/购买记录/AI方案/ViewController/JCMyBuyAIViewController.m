//
//  JCMyBuyAIViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyAIViewController.h"
#import "JCAIPlanTableCell.h"
#import "JCTuiJianManager.h"
@interface JCMyBuyAIViewController ()

@end

@implementation JCMyBuyAIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refreshData];
}

- (void)refreshData{
    WeakSelf;
    if (self.dataArray.count==0) {
        [self.fatherView showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getMyBuyPlanListWithType:@"3" WithPage:self.pageNo DataSuccess:^(id  _Nullable object) {
        [weakSelf endRefresh];
        [self.fatherView endLoading];

        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCHongBangBall class]];
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];

            }
            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                self.tableView.tableFooterView = self.noMore_footView;
                self.tableView.mj_footer.hidden = YES;
            }else{
                self.tableView.tableFooterView = [UIView new];
                self.tableView.mj_footer.hidden = NO;
            }            [self chageImageStr:@"nodata_buyRecord" Title:@"暂时没有你的购买记录~" BtnTitle:@""];
            self.pageNo++;
        }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_buyRecord" Title:@"暂时没有你的购买记录~" BtnTitle:@""];
        [weakSelf endRefresh];
        [self.fatherView endLoading];
    }];

    
    
}

- (void)initSubViews {
    [self.tableView registerClass:[JCAIPlanTableCell class] forCellReuseIdentifier:@"JCAIPlanTableCell"];
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCAIPlanTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCAIPlanTableCell"];
    cell.is_zh = YES;
    cell.is_round_num= YES;
    cell.isMine =YES;
    cell.dianPingBall = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCHongBangBall * dianPingBall = self.dataArray[indexPath.row];
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:dianPingBall.base_info.zucai_order_id type:@"2" WithViewController:self is_push:YES success:^{
        
    }];
}

@end
