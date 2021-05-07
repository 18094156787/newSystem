//
//  JCYCMyYcViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCMyYcViewController.h"
#import "JCJingCaiResultMatchModel.h"
#import "JCYCResultTableViewCell.h"
@interface JCYCMyYcViewController ()


@end

@implementation JCYCMyYcViewController

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
    self.title = @"全民鲸猜";
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
        [self.jcWindow showLoading];
    }
    if (![JCWUserBall currentUser]) {
        return;
    }
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    [service getUserYuCeListWithUserID:[JCWUserBall currentUser].id page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        [self.jcWindow endLoading];
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
            [self chageImageStr:@"nodata_fangan" Title:@"您目前没有参加过预测" BtnTitle:@""];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self.jcWindow endLoading];
        [self chageImageStr:@"nodata_fangan" Title:@"您目前没有参加过预测" BtnTitle:@""];
    }];


}

- (void)initViews {
//    [self.view hg_setAllCornerWithCornerRadius:12];
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCYCResultTableViewCell class] forCellReuseIdentifier:@"JCYCResultTableViewCell"];
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = AUTO(-100);
    self.tableView.ly_emptyView = emptyView;
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    
    
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

    JCJingCaiResultMatchModel *model = self.dataArray[indexPath.row];
    if (model.match.count>0) {
        JCJingCaiResultInfoMatchModel *resultModel = model.match.firstObject;
        JCJingCaiMatchModel *matchInfoModel = resultModel.match_info;
        JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];//JNMatchDetailVC
        detailVC.matchNum = matchInfoModel.match_id;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    
}


@end
