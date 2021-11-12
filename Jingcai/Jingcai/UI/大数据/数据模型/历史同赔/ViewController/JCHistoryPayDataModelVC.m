//
//  JCHistoryPayDataModelVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelVC.h"
#import "JCHistoryPayDataModelLockedCell.h"
#import "JCHistoryPayDataModelOpenCell.h"
#import "JCHistoryPayDataModelDetailStickVC.h"
@interface JCHistoryPayDataModelVC ()

@end

@implementation JCHistoryPayDataModelVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}


- (void)refreshData {
    self.pageNo = 1;
    [self getDataList];
}

- (void)getDataList {

//    [self.jcWindow showLoading];
//    JCMatchService_New *service = [JCMatchService_New new];
//    [service getPredictedMatchListWithType:@"2" Key_word:@"" Page:self.pageNo Success:^(id  _Nullable object) {
//        [self endRefresh];
//         
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            if (self.pageNo==1) {
//                [self.dataArray removeAllObjects];
//            }
//            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];
//             [self.dataArray addObjectsFromArray:array];
//            if (array.count <PAGE_LIMIT) {
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//            [self.tableView reloadData];
//            self.pageNo++;
//            [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
//            
//            if (array.count ==0&&self.dataArray.count>0) {
//                  self.tableView.tableFooterView = self.noMore_footView;
//                  self.tableView.mj_footer.hidden = YES;
//              }else{
//                  self.tableView.tableFooterView = [UIView new];
//                  self.tableView.mj_footer.hidden = NO;
//              }
//
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//
//    } failure:^(NSError * _Nonnull error) {
//        [self endRefresh];
//        [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
//    }];

}


- (void)initViews {
//    JCJingCaiAIBigDataMatchTitleView *titleView = [[JCJingCaiAIBigDataMatchTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AUTO(45))];
//    titleView.backgroundColor = JCWhiteColor;
//    titleView.titleLab.text = @"比赛列表";
//    titleView.iconView.hidden = NO;
//    self.tableView.tableHeaderView = titleView;
//
//    titleView.JCBlcok = ^{
//        [weakSelf.navigationController pushViewController:[JCJingCaiAIBigDataHomeVC new] animated:YES];
//    };
    
    
    WeakSelf;
    self.tableView.estimatedRowHeight = 300;
    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCHistoryPayDataModelLockedCell class] forCellReuseIdentifier:@"JCHistoryPayDataModelLockedCell"];
    [self.tableView registerClass:[JCHistoryPayDataModelOpenCell class] forCellReuseIdentifier:@"JCHistoryPayDataModelOpenCell"];
    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(48));
//    self.tableView.tableHeaderView = self.headView;
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = 0;
    self.tableView.ly_emptyView = emptyView;
//    [self showNoDataViewImageStr:@"empty_img_follow_expert" Title:@"暂时没有比赛" BtnTitle:@"" Btnwidth:0 HiddenBtn:YES];
    
//    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//        [weakSelf refreshData];
//    }];

    
    MJRefreshBackNormalFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    self.tableView.mj_footer = mj_foot;
    [mj_foot setTitle:@"" forState:MJRefreshStateNoMoreData];

 

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;

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
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(4);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        JCHistoryPayDataModelLockedCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHistoryPayDataModelLockedCell"];
    //    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    //    cell.model = model;

        return cell;
    }
    JCHistoryPayDataModelOpenCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHistoryPayDataModelOpenCell"];
//    JCMatchInfoModel *model = self.dataArray[indexPath.section];
//    cell.model = model;

    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCHistoryPayDataModelDetailStickVC *vc = [JCHistoryPayDataModelDetailStickVC new];
    [self.navigationController pushViewController:vc animated:YES];
    
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    self.isTop = self.tableView.contentOffset.y>0?YES:NO;
}
@end
