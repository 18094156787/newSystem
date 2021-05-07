//
//  JCYCExpertYcRecordViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCExpertYcRecordViewController.h"
#import "JCYCExpertYcRecordCell.h"
#import "JCMyZhanJiModel.h"
#import "JCYCMyYcPrizeHeadView.h"
@interface JCYCExpertYcRecordViewController ()

@property (nonatomic,strong) JCYCMyYcPrizeHeadView *headView;

@property (nonatomic,strong) NSString *wx;
@end

@implementation JCYCExpertYcRecordViewController

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
    self.tableView.backgroundColor = JCClearColor;
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
    JCJingCaiService_New *service = [JCJingCaiService_New new];
    [service getUserZhanjiListWithType:@"2" userID:self.expertID page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
     if ([JCWJsonTool isSuccessResponse:object]) {
         if (self.pageNo==1) {
             [self.dataArray removeAllObjects];
         }
//         self.wx = object[@"data"][@"wx"];
         NSString *all_total = [NSString stringWithFormat:@"%@",object[@"data"][@"all_total"]];
         if (all_total.length==0) {
             all_total = @"0";
         }
         self.headView.price = all_total;
         NSArray *array = [NSArray yy_modelArrayWithClass:[JCMyZhanJiModel class] json:object[@"data"][@"total_list"]];
         [self.dataArray addObjectsFromArray:array];
         [self.tableView reloadData];
         if (array.count < PAGE_LIMIT) {
             [self.tableView.mj_footer endRefreshingWithNoMoreData];
         }
         self.pageNo++;
        
         [self chageImageStr:@"nodata_rank" Title:@"目前TA还没有历史上榜战绩哦" BtnTitle:@"刷新"];
     }else{
         [JCWToastTool showHint:object[@"msg"]];
     }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_rank" Title:@"目前TA还没有历史上榜战绩哦" BtnTitle:@"刷新"];
        [self endRefresh];
    }];
 
}

- (void)initViews {
    
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(30));
    self.tableView.tableHeaderView = self.headView;
    
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCYCExpertYcRecordCell class] forCellReuseIdentifier:@"JCYCExpertYcRecordCell"];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(-15);
    }];
    
    WeakSelf;
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

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCYCExpertYcRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCExpertYcRecordCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(120);
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

- (JCYCMyYcPrizeHeadView *)headView {
    if (!_headView) {
        _headView = [JCYCMyYcPrizeHeadView new];
    }
    return _headView;
}

@end
