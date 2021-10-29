//
//  JCColumnDetailFanganVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailFanganVC.h"
#import "JCColumnHeadTitleView.h"
#import "JCColumnDerailEmptyFanganCell.h"
#import "JCFootBallAuthorHistoryPlaneCell.h"
#import "JCColumnListPlanModel.h"
@interface JCColumnDetailFanganVC ()

@end

@implementation JCColumnDetailFanganVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:JCRefreshBuyColumn object:nil];
}

- (void)refreshData {

    [self.jcWindow showLoading];
    JCColumnService *service = [JCColumnService new];
    [service getColumnPlanListWithcolumn_id:NonNil(self.column_id) page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCColumnListPlanModel class]];
            
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
//该专栏已购买
- (void)columnIsBuy {

    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
    }];
}


- (void)initViews {

    UIView *footView = [UIView new];
    footView.backgroundColor = JCClearColor;
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50+kBottomTabSafeAreaHeight);
    self.tableView.tableFooterView = footView;
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 1;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCColumnDerailEmptyFanganCell class] forCellReuseIdentifier:@"JCColumnDerailEmptyFanganCell"];
    [self.tableView registerClass:[JCFootBallAuthorHistoryPlaneCell class] forCellReuseIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];
//    [self.tableView registerClass:[JCColumnDetailZhanjiChartCell class] forCellReuseIdentifier:@"JCColumnDetailZhanjiChartCell"];
//    [self.tableView registerClass:[JCColumnRuleCell class] forCellReuseIdentifier:@"JCColumnRuleCell"];
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(AUTO(-76)-kBottomTabSafeAreaHeight);
    }];
    

    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
//    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
//        [weakSelf refreshData];
//    }];
//    self.tableView.ly_emptyView = emptyView;
    

    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JCColumnListPlanModel *model = self.dataArray[section];
    if (model.plans.count>0) {
        return  model.plans.count;
    }
    if ([model.status integerValue]==0&&model.plans.count==0) {
        return 0;
    }
    return 1;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCColumnListPlanModel *model = self.dataArray[indexPath.section];

    if (model.plans.count>0) {
        JCFootBallAuthorHistoryPlaneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];
        JCWTjInfoBall *amdel = model.plans[indexPath.row];
//        amdel.is_end = 0;
        cell.is_column = YES;
        cell.model = amdel;
        cell.isTop = NO;
        return cell;
    }
    JCColumnDerailEmptyFanganCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnDerailEmptyFanganCell"];
    cell.model = model;
    return cell;

//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
////    cell.model = model;
//    return cell;

    
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
 
    
    JCColumnHeadTitleView *view = [JCColumnHeadTitleView new];
    JCColumnListPlanModel *model = self.dataArray[section];
    view.isbottom = model.plans.count>0?YES:NO;
    view.model = model;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    JCColumnListPlanModel *model = self.dataArray[section];
    
    return  model.plans.count>0?AUTO(40):AUTO(52);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (section==1) {
//        return 0.01f;
//    }
    JCColumnListPlanModel *model = self.dataArray[section];
    if (model.plans.count>0) {
        return AUTO(8);
    }
    return 1.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCColumnListPlanModel *model = self.dataArray[indexPath.section];
    if (model.plans.count>0) {
        JCWTjInfoBall *tjModel = model.plans[indexPath.row];
        [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:tjModel.id orderID:@"" type:@"" WithViewController:self is_push:YES];
    }

//    JCMyBuyColumnDetailVC *vc = [JCMyBuyColumnDetailVC new];
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCColumnListPlanModel *model = self.dataArray[indexPath.section];
    if ([model.status integerValue]==4) {
        if (model.plans.count==0) {
            return 0.01;
        }

    }
    return UITableViewAutomaticDimension;
}

@end
