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
//    [self.view showLoading];
//    JCDataBaseService_New *service = [JCDataBaseService_New new];
//    [service getDataBaseHomeDataWithSuccess:^(id  _Nullable object) {
//        [self endRefresh];
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            NSData *data = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
//            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCBigData_Database];
//            [self deathWithData:object];
//
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//
//    } failure:^(NSError * _Nonnull error) {
//        [self endRefresh];
//    }];
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
//    return self.dataArray.count;
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCDataModelHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDataModelHomeCell"];
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
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    JCTeamMatchWMStickVC *vc = [JCTeamMatchWMStickVC new];
//    JCDataBaseMatchModel *model = self.dataArray[indexPath.row];
//    vc.event_id = model.event_id;
//    [self.navigationController pushViewController:vc animated:YES];
//
    if (indexPath.section==0) {
//        //鲸猜大数据
//        [self.navigationController pushViewController:[JCJingCaiAIBigDataStickVC new] animated:YES];
        //指数异动
        [self.navigationController pushViewController:[JCTransactionDataModelStickVC new] animated:YES];
    }
    if (indexPath.section==1) {
        //历史同赔
        [self.navigationController pushViewController:[JCHistoryPayDataModelStickVC new] animated:YES];
    }
    if (indexPath.section==2) {
        //泊淞
        [self.navigationController pushViewController:[JCPoissonDataModelStickVC new] animated:YES];
    }
    if (indexPath.section==3) {
        //离散指数
        [self.navigationController pushViewController:[JCDiscreteDataModelStickVC new] animated:YES];
    }
    if (indexPath.section==4) {
        //凯利指数
        [self.navigationController pushViewController:[JCKellyDataModelStickVC new] animated:YES];
    }
    if (indexPath.section==5) {
        //指数异动
        [self.navigationController pushViewController:[JCTransactionDataModelStickVC new] animated:YES];
    }
 
   
    
    
}

- (JCDataModelBannerView *)headView {
    if (!_headView) {
        _headView = [JCDataModelBannerView new];
    }
    return _headView;
}

@end
