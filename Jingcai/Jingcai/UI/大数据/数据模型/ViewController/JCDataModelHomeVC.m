//
//  JCDataModelHomeVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDataModelHomeVC.h"
#import "JCDataModelBannerView.h"
#import "JCDataModelHomeCell.h"
#import "JCJingCaiAIBigDataStickVC.h"
#import "JCHistoryPayDataModelStickVC.h"
#import "JCPoissonDataModelStickVC.h"
#import "JCDiscreteDataModelStickVC.h"
#import "JCKellyDataModelStickVC.h"
#import "JCTransactionDataModelStickVC.h"
#import "JCDataModelModel.h"
@interface JCDataModelHomeVC ()

@property (nonatomic,strong) JCDataModelBannerView *headView;

@end

@implementation JCDataModelHomeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    [self.view showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getHomeDataModelWithSuccess:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCDataModelModel class]];
            self.dataArray = [NSMutableArray arrayWithArray:dataArray];
            NSString *banner =  object[@"data"][@"banner"];
            self.headView.url = banner;
            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];
 
}



- (void)initViews {
    self.view.backgroundColor = COLOR_F4F6F9;
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(136));
    self.tableView.tableHeaderView = self.headView;
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorColor = COLOR_F4F6F9;
    [self.tableView registerClass:[JCDataModelHomeCell class] forCellReuseIdentifier:@"JCDataModelHomeCell"];
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
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

    JCDataModelHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDataModelHomeCell"];
    cell.model = self.dataArray[indexPath.section];
//    cell.dataSource = self.dataArray;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(153);
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    JCDataModelModel *model = self.dataArray[indexPath.section];
////1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5机构分歧 6.指数分歧
    if ([model.id integerValue]==1) {
        //鲸猜大数据
        JCJingCaiAIBigDataStickVC *vc =[JCJingCaiAIBigDataStickVC new];
        vc.model_id = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.id integerValue]==2) {
        //指数异动
        JCTransactionDataModelStickVC *vc = [JCTransactionDataModelStickVC new];
        vc.model_id = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.id integerValue]==3) {
        //历史同赔
        JCHistoryPayDataModelStickVC *vc = [JCHistoryPayDataModelStickVC new];
        vc.model_id = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.id integerValue]==4) {
        //泊淞
        JCPoissonDataModelStickVC *vc = [JCPoissonDataModelStickVC new];
        vc.model_id = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.id integerValue]==5) {
        //机构分歧
        JCKellyDataModelStickVC *vc = [JCKellyDataModelStickVC new];
        vc.model_id = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.id integerValue]==6) {
        //指数分歧
        JCDiscreteDataModelStickVC *vc = [JCDiscreteDataModelStickVC new];
        vc.model_id = model.id;
        [self.navigationController pushViewController:vc animated:YES];
    }


 
   
    
    
}

- (JCDataModelBannerView *)headView {
    if (!_headView) {
        _headView = [JCDataModelBannerView new];
    }
    return _headView;
}

@end
