//
//  JCMyBuyColumnDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMyBuyColumnDetailVC.h"
#import "JCFootBallAuthorHistoryPlaneCell.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCColumnDetailTopView.h"
#import "JCMyBuyColumnOrderVC.h"
#import "JCColumnDetailModel.h"
@interface JCMyBuyColumnDetailVC ()

@property (nonatomic,strong) JCColumnDetailTopView *headView;



@end

@implementation JCMyBuyColumnDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
//    [self setNavBackImg];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    self.title = @"专栏方案列表";
    [self initViews];
    [self getTopInfo];
    [self refreshData];
}

- (void)getTopInfo {

    JCColumnService *service = [JCColumnService new];
    [service getColumnDetailTopInfoWithID:NonNil(self.model.special_column_id) WithSuccess:^(id  _Nullable object) {

        if ([JCWJsonTool isSuccessResponse:object]) {
            JCColumnDetailModel *detailModel = (JCColumnDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCColumnDetailModel class]];
            self.headView.detailModel = detailModel;
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];
}


- (void)refreshData {
    [self.view showLoading];
    JCColumnService *service = [JCColumnService new];
    [service getColumn_periodPlanListWithcolumn_id:NonNil(self.model.special_column_id) period_id:NonNil(self.model.unique_id) Page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCWTjInfoBall class]];
            
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
    
    UIButton *detailBtn = [UIButton initWithText:@"订单详情" FontSize:12 Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_2F2F2F];
    [detailBtn addTarget:self action:@selector(detailBtnClick) forControlEvents:UIControlEventTouchUpInside];
    detailBtn.frame = CGRectMake(0, 0, 60, 44);
    UIBarButtonItem *detailItem = [[UIBarButtonItem alloc] initWithCustomView:detailBtn];
    detailItem.tintColor = COLOR_2F2F2F;
    self.navigationItem.rightBarButtonItem = detailItem;
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(126));
    self.tableView.tableHeaderView = self.headView;
    // 表格注册cell
    [self.tableView registerClass:[JCFootBallAuthorHistoryPlaneCell class] forCellReuseIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];
    
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf getTopInfo];
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
//    emptyView.contentViewOffset = -150;
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

    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    JCFootBallAuthorHistoryPlaneCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorHistoryPlaneCell"];
    cell.is_column = YES;
    cell.model = model;
    return cell;

    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F6F6F6;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==self.dataArray.count-1) {
        return 0.001f;
    }
    return AUTO(5);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return ;
    }
    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:model.zctj_newtuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES];

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)detailBtnClick {
    JCMyBuyColumnOrderVC *vc = [JCMyBuyColumnOrderVC new];
    vc.column_id = self.model.special_column_id;
    vc.order_id = self.model.id;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (JCColumnDetailTopView *)headView {
    if (!_headView) {
        _headView = [JCColumnDetailTopView new];
    }
    return _headView;
}
@end
