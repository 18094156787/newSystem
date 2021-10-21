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
@interface JCColumnDetailFanganVC ()

@end

@implementation JCColumnDetailFanganVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
//    if (!self.expertID) {
//        return;
//    }
    [self.jcWindow showLoading];
//    @weakify(self);
    
    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:@"6118" type:@"2" page:self.pageNo Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self endRefresh];
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWTjInfoBall class]];
            
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

    UIView *footView = [UIView new];
    footView.backgroundColor = JCClearColor;
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50+kBottomTabSafeAreaHeight);
    self.tableView.tableFooterView = footView;
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
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
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==1) {
        return self.dataArray.count;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0) {
        JCColumnDerailEmptyFanganCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnDerailEmptyFanganCell"];
    //    cell.model = model;
        return cell;
    }
    if (indexPath.section==1) {
        JCWTjInfoBall *model = self.dataArray[indexPath.row];
        JCFootBallAuthorHistoryPlaneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];
        cell.model = model;
        cell.isTop = YES;
        return cell;
    }
//    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//    cell.model = model;
    return cell;

    
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
 
    
    JCColumnHeadTitleView *view = [JCColumnHeadTitleView new];
//    view.isbottom = NO;
//    if (section==1) {
//        view.isbottom = YES;
//    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section==1) {
//        return AUTO(40);
//    }
    return AUTO(52);
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
    return AUTO(8);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

//    JCMyBuyColumnDetailVC *vc = [JCMyBuyColumnDetailVC new];
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

@end
