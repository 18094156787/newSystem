//
//  JCFootBallAuthorColumnVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCFootBallAuthorColumnVC.h"
#import "JCFootBallAuthorColumnCell.h"
#import "JCColumnDetailWMViewController.h"
#import "JCColumnDetailModel.h"
@interface JCFootBallAuthorColumnVC ()

@end

@implementation JCFootBallAuthorColumnVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {

    [self.jcWindow showLoading];

    
    JCHomeService_New *service = [JCHomeService_New new];
    [service getGZHT_TuijianExpertDetailWithExpert_id:self.expertID type:@"5" page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
           
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCColumnDetailModel class]];

            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            self.pageNo++;
            
            if (array.count < PAGE_LIMIT&&self.dataArray.count>0) {
                    self.tableView.tableFooterView = self.noMore_footView;
                    self.tableView.mj_footer.hidden = YES;
                }else{
                    self.tableView.tableFooterView = [UIView new];
                    self.tableView.mj_footer.hidden = NO;
                }
            
            NSLog(@"数据%@",self.dataArray);
            [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有专栏哦~" BtnTitle:@""];



        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_fangan" Title:@"暂时还没有专栏哦~" BtnTitle:@""];
        [self endRefresh];
    }];
}
- (void)initViews {
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCFootBallAuthorColumnCell class] forCellReuseIdentifier:@"JCFootBallAuthorColumnCell"];

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
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCColumnDetailModel *model = self.dataArray[indexPath.section];
    JCFootBallAuthorColumnCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFootBallAuthorColumnCell"];
    cell.model = model;
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
    JCColumnDetailWMViewController *vc = [JCColumnDetailWMViewController new];
    JCColumnDetailModel *model = self.dataArray[indexPath.section];
    vc.column_id = model.zctj_special_column_id;
    [self.navigationController pushViewController:vc animated:YES];



}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(126);
}

@end
