//
//  JCHistoryPayDataModelDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelDetailVC.h"
#import "JCHistoryPayDataModelDetailTitleHeadView.h"
#import "JCHistoryPayDataModelDetailTitleHeadCell.h"
@interface JCHistoryPayDataModelDetailVC ()

@end

@implementation JCHistoryPayDataModelDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];

}

- (void)initViews {

    WeakSelf;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCHistoryPayDataModelDetailTitleHeadCell class] forCellReuseIdentifier:@"JCHistoryPayDataModelDetailTitleHeadCell"];
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(48));
//    self.tableView.tableHeaderView = self.headView;
    
    
//    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
//
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -AUTO(100);
    self.tableView.ly_emptyView = emptyView;
    [self chageImageStr:@"jc_dataModel_empty" Title:@"当前暂无比赛数据~" BtnTitle:@""];
    
    if (self.hidetopMatch) {
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
        }];
    }
//    [self showNoDataViewImageStr:@"empty_img_follow_expert" Title:@"暂时没有比赛" BtnTitle:@"" Btnwidth:0 HiddenBtn:YES];
    
//    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//        [weakSelf refreshData];
//    }];

    
//    MJRefreshBackNormalFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [weakSelf getDataList];
//    }];
//    self.tableView.mj_footer = mj_foot;
//    [mj_foot setTitle:@"" forState:MJRefreshStateNoMoreData];


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [JCHistoryPayDataModelDetailTitleHeadView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(44);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCHistoryPayDataModelDetailTitleHeadCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHistoryPayDataModelDetailTitleHeadCell"];
//    JCMatchInfoModel *model = self.dataArray[indexPath.row];
    cell.model = self.dataArray[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
//    JCMatchInfoModel *model = self.dataArray[indexPath.section];
//    JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];//JNMatchDetailVC
//    detailVC.matchNum = model.match_id;//JCMatchDetailWMStickVC
//    detailVC.is_bigData = YES;
////    detailVC.matchNum = @"3518682";
//
//    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)reloadData {
    [self.tableView reloadData];
}


@end
