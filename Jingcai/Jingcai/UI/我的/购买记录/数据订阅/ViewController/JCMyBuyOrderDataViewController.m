//
//  JCMyBuyOrderDataViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderDataViewController.h"
#import "JCBuyOrderDataMonthCell.h"
#import "JCBuyOrderDataSingleCell.h"
#import "JCMyBuyOrderDataDetailVC.h"
#import "JCMyBuyOrderDataModel.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCMyBuyOrderDataDetail_Single_VC.h"
@interface JCMyBuyOrderDataViewController ()

@end

@implementation JCMyBuyOrderDataViewController

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F4F6F9;
    [self refreshData];
}
- (void)refreshData{
    WeakSelf;
    if (self.dataArray.count==0) {
        [self.fatherView showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getMyBuyPlanListWithType:@"4" WithPage:self.pageNo DataSuccess:^(id  _Nullable object) {
        [weakSelf endRefresh];
        [self.fatherView endLoading];

        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            
            
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCMyBuyOrderDataModel class]];
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
            }
            [self chageImageStr:@"nodata_buyRecord" Title:@"暂时没有你的购买记录~" BtnTitle:@""];
            self.pageNo++;
        }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_buyRecord" Title:@"暂时没有你的购买记录~" BtnTitle:@""];
        [weakSelf endRefresh];
        [self.fatherView endLoading];
    }];

    
    
}



- (void)initSubViews {
    [self.tableView registerClass:[JCBuyOrderDataMonthCell class] forCellReuseIdentifier:@"JCBuyOrderDataMonthCell"];
    [self.tableView registerClass:[JCBuyOrderDataSingleCell class] forCellReuseIdentifier:@"JCBuyOrderDataSingleCell"];
    
    WeakSelf;
    self.tableView.separatorStyle = 0;
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
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCMyBuyOrderDataModel *model = self.dataArray[indexPath.section];
    if ([model.is_monthly integerValue]==2) {
        JCBuyOrderDataSingleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBuyOrderDataSingleCell"];
        WeakSelf;
        cell.JCDetailBlock = ^{
            JCMyBuyOrderDataDetail_Single_VC *vc = [JCMyBuyOrderDataDetail_Single_VC new];
            vc.order_id = model.zucai_order_id;
            [weakSelf.navigationController pushViewController:vc animated:YES];


        };
        cell.model = model;
        return cell;
    }
    JCBuyOrderDataMonthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBuyOrderDataMonthCell"];
    cell.model = model;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    JCMyBuyOrderDataModel *model = self.dataArray[indexPath.section ];
//    if ([model.style intValue]==1) {
//        return AUTO(210);
//    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section>self.dataArray.count-1) {
        return 0.01f;
    }
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


    JCMyBuyOrderDataModel *model = self.dataArray[indexPath.section];
    if ([model.is_monthly intValue]==2) {
        JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
        vc.model_id = @"1";
        vc.matchNum = model.match_id;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    JCMyBuyOrderDataDetailVC *vc = [JCMyBuyOrderDataDetailVC new];
    vc.order_id = model.zucai_order_id;
    [self.navigationController pushViewController:vc animated:YES];

    
    
}

@end
