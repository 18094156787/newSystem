//
//  JCYCExpertYcViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCExpertYcViewController.h"
#import "JCJingCaiResultMatchModel.h"
#import "JCYCResultTableViewCell.h"
@interface JCYCExpertYcViewController ()



@end

@implementation JCYCExpertYcViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}



- (void)getDataList {

    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    [service getUserYuCeListWithUserID:self.expertID page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCJingCaiResultMatchModel class] json:object[@"data"][@"history_data_list"]];
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            self.pageNo++;
            [self chageImageStr:@"nodata_rank" Title:@"当前还没有排行榜哟" BtnTitle:@"刷新"];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_rank" Title:@"当前还没有排行榜哟" BtnTitle:@"刷新"];
        [self endRefresh];
    }];


}

- (void)initViews {
//    [self.view hg_setAllCornerWithCornerRadius:12];
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCYCResultTableViewCell class] forCellReuseIdentifier:@"JCYCResultTableViewCell"];
    
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -100;
    self.tableView.ly_emptyView = emptyView;
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCYCResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCResultTableViewCell"];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(160);
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
    
}

@end
