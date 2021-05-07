//
//  JCWithDrawRecordVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWithDrawRecordVC.h"
#import "JCWithDrawRecordCell.h"
#import "JCWithdrawalModel.h"
#import "JCIncomeDetailHeadView.h"
@interface JCWithDrawRecordVC ()

@property (nonatomic,strong) NSString *money;

@end

@implementation JCWithDrawRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initView];
    [self refreshData];
//    [self showNonetView];
}

- (void)initView {

    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.backgroundColor = COLOR_F0F0F0;
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, AUTO(27), 0, AUTO(27));
    [self.tableView registerClass:[JCWithDrawRecordCell class] forCellReuseIdentifier:@"JCWithDrawRecordCell"];
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

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    JCWithDrawRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCWithDrawRecordCell"];
    cell.selectionStyle = 0;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return AUTO(67);
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.dataArray.count>0) {
        JCIncomeDetailHeadView *headView = [JCIncomeDetailHeadView new];
        if (self.money.length>0) {
            headView.timeLab.text = @"累计";
            headView.moneyLab.text = [NSString stringWithFormat:@"合计：%@",self.money];
        }
        return headView;
    }
    return [UIView new];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.dataArray.count>0) {
         return AUTO(32);
    }
    return 0.001f;;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)backBtnClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)refreshData {

    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getMyWithDrawDetailLsitWithPage:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
     if ([JCWJsonTool isSuccessResponse:object]) {
         self.money = object[@"data"][@"all_total"];
         if (self.pageNo==1) {
             [self.dataArray removeAllObjects];
         }
         NSArray *array = [NSArray yy_modelArrayWithClass:[JCWithdrawalModel class] json:object[@"data"][@"detail"]];
         [self.dataArray addObjectsFromArray:array];
         [self.tableView reloadData];
         if (array.count < PAGE_LIMIT) {
             [self.tableView.mj_footer endRefreshingWithNoMoreData];
         }
         self.pageNo++;
             [self showNoDataView];

     }else{
         [JCWToastTool showHint:object[@"msg"]];
     }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}

@end
