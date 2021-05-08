//
//  JCJingCaiAIBigDataMatchListVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataMatchListVC.h"
#import "JCMatchInfoModel.h"
#import "JCJingCaiAIBigDataMatchCell.h"
#import "JCJingCaiAIBigDataSearchView.h"
#import "JCJingCaiAIBigDataSearchVC.h"
@interface JCJingCaiAIBigDataMatchListVC ()

@property (nonatomic,strong) JCJingCaiAIBigDataSearchView *headView;

@property (nonatomic,strong) UIButton *searchBtn;

@end

@implementation JCJingCaiAIBigDataMatchListVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.searchBtn.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.searchBtn.hidden = YES;
}

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

    [self.jcWindow showLoading];
    JCMatchService_New *service = [JCMatchService_New new];
    [service getPredictedMatchListWithType:@"2" Key_word:@"" Page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
         
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCMatchInfoModel class]];
             [self.dataArray addObjectsFromArray:array];
            if (array.count <PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            [self.tableView reloadData];
            self.pageNo++;
            [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
            
            if (array.count ==0&&self.dataArray.count>0) {
                  self.tableView.tableFooterView = self.noMore_footView;
                  self.tableView.mj_footer.hidden = YES;
              }else{
                  self.tableView.tableFooterView = [UIView new];
                  self.tableView.mj_footer.hidden = NO;
              }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"nodata" Title:@"暂无更多比赛" BtnTitle:@""];
    }];

}


- (void)initViews {
    self.tableView.estimatedRowHeight = 100;
    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCJingCaiAIBigDataMatchCell class] forCellReuseIdentifier:@"JCJingCaiAIBigDataMatchCell"];
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(48));
//    self.tableView.tableHeaderView = self.headView;
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = 0;
    self.tableView.ly_emptyView = emptyView;
//    [self showNoDataViewImageStr:@"empty_img_follow_expert" Title:@"暂时没有比赛" BtnTitle:@"" Btnwidth:0 HiddenBtn:YES];
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];

    
    MJRefreshBackNormalFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
    self.tableView.mj_footer = mj_foot;
    [mj_foot setTitle:@"" forState:MJRefreshStateNoMoreData];

    [self.jcWindow addSubview:self.searchBtn];
    self.searchBtn.frame = CGRectMake(SCREEN_WIDTH-45, SCREEN_HEIGHT-120-kTabBarHeight, 50, 46);
    [self.searchBtn bk_whenTapped:^{
        [weakSelf.navigationController pushViewController:[JCJingCaiAIBigDataSearchVC new] animated:YES];
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;

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
    if (section==0) {
        return 0.01f;
    }
    return AUTO(8);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCJingCaiAIBigDataMatchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCJingCaiAIBigDataMatchCell"];
    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    cell.model = model;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    
//    JCMatchInfoTitleModel *titleModel = self.dataArray[indexPath.section];
    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];//JNMatchDetailVC
    detailVC.matchNum = model.match_id;//JCMatchDetailWMStickVC
    detailVC.is_bigData = YES;
//    detailVC.matchNum = @"3518682";
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (JCJingCaiAIBigDataSearchView *)headView {
    if (!_headView) {
        _headView = [JCJingCaiAIBigDataSearchView new];
    }
    return _headView;
}
- (UIButton *)searchBtn {
    if (!_searchBtn) {
        _searchBtn = [UIButton new];
        [_searchBtn setBackgroundImage:JCIMAGE(@"ic_bigData_ser") forState:0];
        [_searchBtn setBackgroundImage:JCIMAGE(@"ic_bigData_ser") forState:UIControlStateHighlighted];
        _searchBtn.hidden = YES;
    }
    return _searchBtn;
}

@end
