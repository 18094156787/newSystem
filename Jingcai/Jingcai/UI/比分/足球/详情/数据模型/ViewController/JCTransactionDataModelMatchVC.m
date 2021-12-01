//
//  JCTransactionDataModelMatchVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/13.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelMatchVC.h"
#import "JCTransactionDataModelDetailDataCell.h"
#import "JCTransactionDataModelDetailSameMatchCell.h"
#import "JCTransactionDataModelDetailZhiShuCell.h"
#import "JCPoissonDataModelDetailAttackCell.h"
#import "JCTransactionDataModelTitleView.h"
#import "JNMatchSJAgainstTipView.h"
#import "JCPayShowView.h"
#import "JCChargeVC.h"
#import "JCTransactionDataModelDetailVC.h"
#import "JCKellyDataDetailModel.h"
#import "JCTransactionDataContrastModel.h"
#import "JCTransactionDataModelAgainstTitleView.h"
@interface JCTransactionDataModelMatchVC ()

@property (nonatomic,strong) JNMatchSJAgainstTipView *tipView;

@property (nonatomic,strong) NSArray *dataSource;
@end

@implementation JCTransactionDataModelMatchVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleTransparent;

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];


}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}


- (void)refreshData {
    if (self.titleModel&&self.titleModel.is_subscrib!=1) {
        // 从联赛详情展示的数据模型,并且没有订阅时,不请求数据,而是展示购买页面
        self.tableView.hidden = YES;
        [self showOrderMsgView];
        return;
    }else{
        self.tableView.hidden = NO;
        self.tipView.hidden = YES;
    }
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getTransactionDataModeMatchDetailWithMatch_id:self.match_id Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {

            [self.dataArray removeAllObjects];
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCKellyDataDetailModel class]];
            [self.dataArray addObjectsFromArray:array];
            self.dataSource = [JCWJsonTool arrayWithJson:object[@"data"][@"data_contrast"] class:[JCTransactionDataContrastModel class]];

            
            
            [self.tableView reloadData];
   
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}



- (void)initViews {

    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    

    WeakSelf;
    self.tableView.estimatedRowHeight = 300;
//    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCTransactionDataModelDetailDataCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailDataCell"];
    [self.tableView registerClass:[JCTransactionDataModelDetailSameMatchCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailSameMatchCell"];
    [self.tableView registerClass:[JCPoissonDataModelDetailAttackCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailAttackCell"];
    
    [self.tableView registerClass:[JCTransactionDataModelDetailZhiShuCell class] forCellReuseIdentifier:@"JCTransactionDataModelDetailZhiShuCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(0);
    }];

    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(48));
//    self.tableView.tableHeaderView = self.headView;
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = 0;
    self.tableView.ly_emptyView = emptyView;

 

}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.dataSource.count>0) {
        return self.dataArray.count+1;
    }
    return self.dataArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==self.dataArray.count&&self.dataSource.count>0) {
        return self.dataSource.count;
    }


    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section<self.dataArray.count) {
        JCKellyDataDetailModel *model = self.dataArray[indexPath.section];
        NSInteger height = model.compare_odds.count>=2?AUTO(30):0;
        return height+model.odds_change_list.count*AUTO(35);
    }
    return AUTO(50);
}


//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//
//    return AUTO(8);
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UIView *footVew = [UIView new];
//    footVew.backgroundColor = COLOR_F0F0F0;
//    return footVew;
//
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    WeakSelf;
    JCKellyDataDetailModel *model = self.dataArray[section];
    JCTransactionDataModelTitleView *headView = [JCTransactionDataModelTitleView new];
    headView.JCBlock = ^{
        JCTransactionDataModelDetailVC *vc = [JCTransactionDataModelDetailVC new];
        vc.type = model.type;
        vc.match_id = weakSelf.match_id;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    };
    
    headView.titleLab.text = model.title;
    headView.detailView.hidden = NO;
    if(section==self.dataArray.count&&self.dataSource.count>0){
//        headView.detailView.hidden = YES;
//        headView.titleLab.text = @"数据对比";
        JCTransactionDataModelAgainstTitleView *againstView = [JCTransactionDataModelAgainstTitleView new];
        againstView.titleLab.text = @"数据对比";
        return againstView;
    }

    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section==self.dataArray.count){
        if (self.dataSource.count>0) {
            return AUTO(40);
        }
        return 0.01f;
    }
    return AUTO(40);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section<self.dataArray.count) {
        JCKellyDataDetailModel *model = self.dataArray[indexPath.section];
        JCTransactionDataModelDetailDataCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelDetailDataCell"];
        cell.type = [NSString stringWithFormat:@"%@",model.type];
        cell.detailModel = model;
        cell.dataArray = model.compare_odds;
        return cell;
    }



    if (indexPath.section==self.dataArray.count) {
        JCPoissonDataModelDetailAttackCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailAttackCell"];
        JCTransactionDataContrastModel *model = self.dataSource[indexPath.row];
        cell.againstModel = model;

        return cell;
    }
    
    
    UITableViewCell * commomCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return commomCell;
    
}
#pragma mark -- 购买
- (void)showPayView {
    WeakSelf;
    JCPayShowView *payView = [JCPayShowView new];
    payView.price = [NSString stringWithFormat:@"%@",@([self.titleModel.big_data_price longValue]/100)];
    payView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.jcWindow addSubview:payView];
    payView.JCSureBlock = ^(NSString * _Nonnull hb_id) {
        [weakSelf sureBuy];
    };
    payView.JCProtocolBlock = ^{
        WebViewController *vc = [WebViewController new];
        vc.showBackItem = YES;
            vc.titleStr = @"鲸猜足球用户购买协议";
            NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_purchase];
            vc.urlStr = NonNil(urlStr);
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [weakSelf presentViewController:nav animated:YES completion:nil];
    };
    [payView show];

}

- (void)FreeExperienceCheck {
    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
    alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
    [alertView alertTitle:@"确认开通" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_2F2F2F SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
        
        [alertView removeFromSuperview];
        [self FreeExperience];

    } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
       [alertView removeFromSuperview];
    }];
//    NSString *day =  [NSString stringWithFormat:@"%@",self.buyInfoModel.free_day];
    NSString *title = [NSString stringWithFormat:@"是否开通[指数异动] %@天免费体验",self.titleModel.free_day];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange count_range = [title rangeOfString:NonNil(self.titleModel.free_day)];
    if (count_range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
    }

    
    alertView.contentLab.attributedText = attr;
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

//免费体验
- (void)FreeExperience {
    
    [self.view showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getKellyDataModeFreeExperienceWithModel_id:self.titleModel.id Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.titleModel.is_subscrib = 1;
            [self refreshData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

        
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];



}

//确认购买
- (void)sureBuy {
    if ([self.titleModel.big_data_price integerValue]>0&&[[JCWUserBall currentUser].prize floatValue]<[self.titleModel.big_data_price integerValue]/100) {
        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    NSString *scene = @"7";
    //1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5机构分歧 6.指数分歧
    [self.view showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:self.titleModel.id scene:scene source:@"1" price:@"" Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *order_key = object[@"data"][@"order_key"];
            [self finalPayWithOrder_key:order_key coupon_id:@"" hongbao_id:@""];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
    
}
//下单并支付
- (void)finalPayWithOrder_key:(NSString *)order_key coupon_id:(NSString *)coupon_id hongbao_id:(NSString *)hongbao_id {
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getPayOrderWithOrder_key:order_key pay_type:@"3" hongbao_id:hongbao_id coupon_id:coupon_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_pay = object[@"data"][@"is_pay"];
            if ([is_pay intValue]==1) {
                self.titleModel.is_subscrib = 1;
                [self getMyUserInfo];
                [self refreshData];
            }
//            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
}

//消息订阅
- (void)showOrderMsgView {
    self.tipView.frame  = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(430));
    self.tipView.tipImgView.image= JCIMAGE(@"nodata_fangan_small");
    self.tipView.titleLab.text = @"您还未订阅该数据模型...";
    self.tipView.contentLab.text = @"订阅后，当比赛有指数异动的时候，\n可获得即时的数据情报";
    [self.tipView.buyMonthBtn setTitle:[NSString stringWithFormat:@"订阅此数据模型 %ld红币/月",[self.titleModel.big_data_price integerValue]/100] forState:0];
    if (self.titleModel.is_subscrib==3) {
        self.tipView.is_free = YES;
        self.tipView.tipImgView.image= JCIMAGE(@"nodata_bigdata_yidong");
        self.tipView.titleLab.text = @"";
        [self.tipView.buyMonthBtn setTitle:[NSString stringWithFormat:@"免费体验%@天，点击开通",self.titleModel.free_day] forState:0];
    }
    [self.view addSubview:self.tipView];
    WeakSelf;
    self.tipView.JCSingleMatchBlock = ^(NSInteger type) {
        //is_subscrib 是否订阅，1已订阅,2未订阅（曾经免费体验过）,3未订阅（未免费体验过）
        if (![JCWUserBall currentUser]) {
            JCBaseViewController *vc = (JCBaseViewController *)[weakSelf getViewController];
            [vc presentLogin];
            return;
        }
        if (weakSelf.titleModel.is_subscrib==3) {
            [weakSelf FreeExperienceCheck];
        }
        if (weakSelf.titleModel.is_subscrib==2) {
            [weakSelf showPayView];
        }


    };
}
- (JNMatchSJAgainstTipView *)tipView {
    if (!_tipView) {
        _tipView = [JNMatchSJAgainstTipView new];
        _tipView.isOnlyMonth = YES;
    }
    return _tipView;
}

@end
