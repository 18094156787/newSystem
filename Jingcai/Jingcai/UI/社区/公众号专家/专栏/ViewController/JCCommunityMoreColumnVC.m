//
//  JCCommunityMoreColumnVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCCommunityMoreColumnVC.h"
#import "JCCommunityMoreColumnCell.h"
#import "JCColumnDetailWMViewController.h"
@interface JCCommunityMoreColumnVC ()

@end

@implementation JCCommunityMoreColumnVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    self.title = @"更多专栏";
    [self initViews];
    [self refreshData];
}

- (void)refreshData {

//    [self.   view showLoading];

    
//    JCHomeService_New *service = [JCHomeService_New new];
//    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:@"2" page:self.pageNo Success:^(id  _Nullable object) {
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            [self endRefresh];
//            if (self.pageNo==1) {
//                [self.dataArray removeAllObjects];
//            }
//            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWTjInfoBall class]];
//
//            [self.dataArray addObjectsFromArray:array];
//            if (array.count < PAGE_LIMIT) {
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//            [self.tableView reloadData];
//            self.pageNo++;
//
//
//
//        }else {
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//    } failure:^(NSError * _Nonnull error) {
//
//        [self endRefresh];
//    }];
}
- (void)initViews {
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCCommunityMoreColumnCell class] forCellReuseIdentifier:@"JCCommunityMoreColumnCell"];

    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    JCCommunityMoreColumnCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCCommunityMoreColumnCell"];
//    cell.model = model;
    return cell;

    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return AUTO(8);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(126);
}

@end
