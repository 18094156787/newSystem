//
//  JCPoissonDataModelDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPoissonDataModelDetailVC.h"
#import "JCPoissonDataModelDetailHeadView.h"
#import "JCPoissonDataModelDetailTitleView.h"
#import "JCPoissonDataModelDetailAttackCell.h"
#import "JCPoissonDataModelDetailDistributionCell.h"
#import "JCPoissonDataModelDetailPredictCell.h"
#import "JCKellyDataDetailModel.h"
#import "JNMatchSJAgainstTipView.h"
#import "JCPayShowView.h"
#import "JCChargeVC.h"
@interface JCPoissonDataModelDetailVC ()

@property (nonatomic,strong) JCPoissonDataModelDetailHeadView *headView;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic,strong) JNMatchSJAgainstTipView *tipView;

@property (nonatomic,strong) JCKellyDataDetailModel *detailModel;

@end

@implementation JCPoissonDataModelDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
//    [self initViews];
    if (!self.hidetopMatch) {
        if (!self.topColorView) {
            [self setupColorView];
        }else{
            [self setNavEffect];
        }
    }

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//      self.navigationBarStyle = JCNavigationBarStyleTransparent;
    self.topColorView.alpha = 0;
    [self.topColorView removeFromSuperview];

}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.topColorView removeAllSubviews];
    [self.topColorView removeFromSuperview];
    self.topColorView = nil;
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {
    if (self.isMatch&&self.titleModel&&self.titleModel.is_subscrib!=1) {
        // 从联赛详情展示的数据模型,并且没有订阅时,不请求数据,而是展示购买页面
        self.tableView.hidden = YES;
        [self showOrderMsgView];
        return;
    }else{
        self.tableView.hidden = NO;
        self.tipView.hidden = YES;
    }
    [self.view showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getPoissonDataModeDetailWithMatch_id:self.match_id Success:^(id  _Nullable object) {
        [self endRefresh];

        if ([JCWJsonTool isSuccessResponse:object]) {

            self.detailModel = (JCKellyDataDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCKellyDataDetailModel class]];
            self.headView.match_id = self.match_id;
            self.headView.model = self.detailModel;
            if (!self.hidetopMatch&&self.detailModel.competition_type!=1) {
                self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(160)+kNavigationBarHeight);
                self.tableView.tableHeaderView = self.headView;
            }
            
            [self.tableView reloadData];
            self.tableView.tableFooterView = self.noMore_footView;
            self.tableView.mj_footer.hidden = YES;


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}


- (void)initViews {
//    JCJingCaiAIBigDataMatchTitleView *titleView = [[JCJingCaiAIBigDataMatchTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AUTO(45))];
//    titleView.backgroundColor = JCWhiteColor;
//    titleView.titleLab.text = @"比赛列表";
//    titleView.iconView.hidden = NO;
//    self.tableView.tableHeaderView = titleView;
//
//    titleView.JCBlcok = ^{
//        [weakSelf.navigationController pushViewController:[JCJingCaiAIBigDataHomeVC new] animated:YES];
//    };
    
    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];
    
    
    
    if (!self.hidetopMatch) {
        self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(200)+kNavigationBarHeight);
        self.tableView.tableHeaderView = self.headView;
    }else{
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view).offset(0);
        }];
    }
    

    
    WeakSelf;
    self.tableView.estimatedRowHeight = 300;
//    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCPoissonDataModelDetailAttackCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailAttackCell"];
    [self.tableView registerClass:[JCPoissonDataModelDetailDistributionCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailDistributionCell"];
    [self.tableView registerClass:[JCPoissonDataModelDetailPredictCell class] forCellReuseIdentifier:@"JCPoissonDataModelDetailPredictCell"];
    
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


- (void)setupColorView {
    self.topColorView = [UIView new];
    self.topColorView.backgroundColor = JCWhiteColor;
    self.topColorView.alpha = 0;
    self.topColorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight);
        [self.navigationController.view insertSubview:self.topColorView belowSubview:self.navigationController.navigationBar];
//    [self.navigationController.view addSubview:self.topColorView];
    
    UIButton *backBtn = [UIButton new];
    [self.topColorView addSubview:backBtn];
    [backBtn setImage:JCIMAGE(@"common_title_back_black_bold") forState:0];
    [backBtn setImage:JCIMAGE(@"common_title_back_black_bold") forState:UIControlStateHighlighted];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(StatusBar_HEIGHT);
        make.bottom.offset(0);
        make.width.mas_equalTo(44);
    }];
//    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLab = [UILabel initWithTitle:@"泊松预测详情" andFont:17 andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.topColorView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.topColorView);
    }];
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 4;
    }
    if (section==1) {
        return 2;
    }
    if (section==2) {
        if (self.detailModel.score_guess.count>0) {
            return 1;
        }
    }
    return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(50);
    }
    if (indexPath.section==1) {
        return AUTO(56);
    }
    if (indexPath.section==2) {
        int row = ceil(self.detailModel.score_guess.count/6.0);
        return row*AUTO(48);
    }
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section<2) {
        return AUTO(8);
    }
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footVew = [UIView new];
    footVew.backgroundColor = UIColorFromRGB(0xF5F5F5);
    return footVew;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCPoissonDataModelDetailTitleView *headView = [JCPoissonDataModelDetailTitleView new];
    if (section==0) {
        headView.titleLab.text = @"进攻防守实力";
    }
    if (section==1) {
        headView.titleLab.text = @"泊松分布预测";
    }
    if (section==2) {
        headView.titleLab.text = @"泊松预测比分概率";
    }
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return AUTO(50);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCPoissonDataModelDetailAttackCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailAttackCell"];
        if (indexPath.row==0) {
            cell.titleLab.text = @"场均进球";
            cell.dataArray = self.detailModel.goals_avg;
        }
        if (indexPath.row==1) {
            cell.titleLab.text = @"进攻能力";
            cell.dataArray = self.detailModel.attacking;
        }
        if (indexPath.row==2) {
            cell.titleLab.text = @"场均失球";
            cell.dataArray = self.detailModel.goals_against_avg;
        }
        if (indexPath.row==3) {
            cell.titleLab.text = @"防守能力";
            cell.dataArray = self.detailModel.defending;
        }
    //    JCMatchInfoModel *model = self.dataArray[indexPath.section];
    //    cell.model = model;

        return cell;
    }
    if (indexPath.section==1) {
        JCPoissonDataModelDetailDistributionCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailDistributionCell"];
        cell.lineView.hidden = indexPath.row==0?NO:YES;
        if (indexPath.row==0) {
            cell.bf_array = self.detailModel.bi_fen;
        }else{
            cell.jqs_array = self.detailModel.jin_qiu_shu;
        }
        return cell;
    }
    if (indexPath.section==2) {
        JCPoissonDataModelDetailPredictCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCPoissonDataModelDetailPredictCell"];
        cell.dataArray = self.detailModel.score_guess;
        return cell;
    }

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
    
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (!self.hidetopMatch) {
        [self setNavEffect];
    }


    NSLog(@"%.0f",scrollView.contentOffset.y);
}

- (void)setNavEffect {

    CGFloat offsetY = self.tableView.contentOffset.y;
    CGFloat maxOffsetY = AUTO(200);
    float percent = offsetY/maxOffsetY;
    self.topColorView.alpha = percent;
//    NSLog(@"%.2f",percent);
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if (percent>=0.98) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
//    self.navShadow.alpha= percent;

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
    NSString *title = [NSString stringWithFormat:@"是否开通[泊松分布] %@天免费体验",self.titleModel.free_day];
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
    self.tipView.contentLab.text = @"根据泊松分布公式，计算球队进球和比分的概率分布数据";
    [self.tipView.buyOneBtn setTitle:[NSString stringWithFormat:@"订阅此数据模型 %@红币/月",@([self.titleModel.big_data_one_price integerValue]/100.0f)] forState:0];
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

- (JCPoissonDataModelDetailHeadView *)headView {
    if (!_headView) {
        _headView = [JCPoissonDataModelDetailHeadView new];
    }
    return _headView;
}
- (JNMatchSJAgainstTipView *)tipView {
    if (!_tipView) {
        _tipView = [JNMatchSJAgainstTipView new];
        _tipView.isOnlyMonth = YES;
    }
    return _tipView;
}

@end
