//
//  JCJingCaiAIHomeVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIHomeVC.h"
#import "JCAIPlanTableCell.h"
#import "JCTuiJianManager.h"
@interface JCJingCaiAIHomeVC ()

@end

@implementation JCJingCaiAIHomeVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tableView.scrollEnabled = NO;
//    [self refreshData];
    self.classfly = @"0";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}


- (void)getDataList {
//    if (self.dataArray.count==0) {
//        [self.contentView showLoading];classfly
//    }
    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getJingCaiAiTuiJianListWithType:self.type classfly:NonNil(self.classfly) Page:self.pageNo success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        [self endRefresh];
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
            }

            [self chageImageStr:@"nodata" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
            self.pageNo++;

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
        [self chageImageStr:@"nodata" Title:@"暂时还没有发布方案哦~" BtnTitle:@""];
    }];


}

- (void)initSubViews {
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCAIPlanTableCell class] forCellReuseIdentifier:@"JCAIPlanTableCell"];
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [self refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    emptyView.contentViewOffset = AUTO(-100);
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self getDataList];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCAIPlanTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCAIPlanTableCell"];
    cell.showPriceView = YES;
    cell.is_zh = NO;
    cell.is_round_num = YES;
    cell.isMine = YES;
    cell.dianPingBall = self.dataArray[indexPath.section];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [UIView new];
    headView.backgroundColor = COLOR_F0F0F0;
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

     JCHongBangBall * dianPingBall = self.dataArray[indexPath.section];
    [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
        
    }];
}
@end
