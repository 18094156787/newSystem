//
//  JCIncomeDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/1/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCIncomeDetailVC.h"
#import "JCIncomeDetailCell.h"
#import "JCIncomeDetailHeadView.h"
#import "JCMyIncomeModel.h"
#import "JCMyIncomeTitleModel.h"
#import "JCHongBangOrderDetailVC.h"
@interface JCIncomeDetailVC ()

//@property (nonatomic,strong) NSString *time;

@property   (nonatomic,strong) JCMyIncomeTitleModel *model;

@end

@implementation JCIncomeDetailVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F4F6F9;
    [self initView];
    [self refreshData];
//    [self showNonetView];
}

- (void)initView {

    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.backgroundColor = COLOR_F0F0F0;
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, AUTO(27), 0, AUTO(27));
    [self.tableView registerClass:[JCIncomeDetailCell class] forCellReuseIdentifier:@"JCIncomeDetailCell"];
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
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JCMyIncomeTitleModel *model = self.dataArray[section];
    return model.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    JCIncomeDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCIncomeDetailCell"];
    cell.selectionStyle = 0;
    JCMyIncomeTitleModel *model = self.dataArray[indexPath.section];
    cell.model = model.array[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return AUTO(67);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCIncomeDetailHeadView *headView = [JCIncomeDetailHeadView new];
    headView.model = self.dataArray[section];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AUTO(32);
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCMyIncomeTitleModel *titleModel = self.dataArray[indexPath.section];
    JCMyIncomeModel *model = titleModel.array[indexPath.row];
    if ([model.paid integerValue]<5) {
        JCHongBangOrderDetailVC *vc = [JCHongBangOrderDetailVC new];
        vc.order_id  = model.id;
        
        if ([model.paid integerValue]==1||[model.paid integerValue]==2) {
            vc.is_benefit = YES;
        }
        if ([model.paid integerValue]==3||[model.paid integerValue]==4) {
            vc.type = model.type;
        }

        [self.navigationController pushViewController:vc animated:YES];
    }

}

- (void)backBtnClick {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)refreshData {

    if (self.dataArray.count==0) {
//        [self.jcWindow showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getMyIncomeDetailLsitWithPage:self.pageNo success:^(id  _Nullable object) {

        [self endRefresh];
     if ([JCWJsonTool isSuccessResponse:object]) {
         if (self.pageNo==1) {
             self.model = nil;
             [self.dataArray removeAllObjects];
         }
         NSArray *array = [NSArray yy_modelArrayWithClass:[JCMyIncomeModel class] json:object[@"data"]];
//         [self.dataArray addObjectsFromArray:array];
//
         for (int i=0; i<array.count; i++) {
             JCMyIncomeModel *obj = array[i];
             if (!self.model) {
                  JCMyIncomeTitleModel *model =[JCMyIncomeTitleModel new];
                  model.get_pay_time = obj.get_pay_time;
                  model.money = obj.money;
                  NSMutableArray *dataArray = [NSMutableArray array];
                  [dataArray addObject:obj];
                  model.array = dataArray;
                  [self.dataArray addObject:model];
                 self.model = model;
              }else{
                  if ([obj.get_pay_time isEqualToString:self.model.get_pay_time]) {
                      [self.model.array addObject:obj];
                  }else{
                      JCMyIncomeTitleModel *model =[JCMyIncomeTitleModel new];
                      model.get_pay_time = obj.get_pay_time;
                      model.money = obj.money;
                      NSMutableArray *dataArray = [NSMutableArray array];
                      [dataArray addObject:obj];
                      model.array = dataArray;
                      [self.dataArray addObject:model];
                      self.model = model;
                  }


              }
         }

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
        [self showNoDataView];
    }];



}

@end
