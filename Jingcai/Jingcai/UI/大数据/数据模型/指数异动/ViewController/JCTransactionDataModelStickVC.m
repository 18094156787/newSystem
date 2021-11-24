//
//  JCTransactionDataModelStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelStickVC.h"
#import "JCTransactionDataModelVC.h"
#import "JCHistoryPayHeadView.h"
#import "NSDate+BRPickerView.h"
#import "JCMatchTimeModel.h"
#import "JCPayShowView.h"
#import "JCChargeVC.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCTransactionDataModelStickVC ()

@property (nonatomic, strong) JCHistoryPayHeadView *headView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *topColorView;

@property (nonatomic, assign) float height;

@property (nonatomic,strong) JCKellyDataModelPayInfoModel *buyInfoModel;

@property (nonatomic,strong) JCTransactionDataModelVC *allVC;

@property (nonatomic,strong) JCTransactionDataModelVC *spfVC;

@property (nonatomic,strong) JCTransactionDataModelVC *rqVC;

@property (nonatomic,strong) JCTransactionDataModelVC *jqsVC;
@end

@implementation JCTransactionDataModelStickVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"全部",@"胜平负",@"让球",@"进球数"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
//    [self initViews];
    if (!self.topColorView) {
        [self setupColorView];
    }else{
        [self setNavEffect];
    }


}

- (void)setNavEffect {

    CGFloat offsetY = self.contentView.contentOffset.y;
    CGFloat maxOffsetY = AUTO(228);
    float percent = offsetY/maxOffsetY;
    self.topColorView.alpha = percent;
//    NSLog(@"%.2f",percent);
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    if (percent>=0.98) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;//
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
//    self.contentView.backgroundColor = percent>=0.98?JCWhiteColor:COLOR_F0F0F0;
//    self.view.backgroundColor = percent>=0.98?JCWhiteColor:COLOR_F0F0F0;
//    self.scrollView.backgroundColor = percent>=0.98?JCWhiteColor:COLOR_F0F0F0;
    if (percent>=0.98) {
        self.contentView.backgroundColor = JCWhiteColor;
        self.menuView.backgroundColor = JCWhiteColor;
    }else{
        self.contentView.backgroundColor = COLOR_F0F0F0;
        self.menuView.backgroundColor = COLOR_F0F0F0;
    }
//    self.navShadow.alpha= percent;

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.topColorView removeAllSubviews];
    [self.topColorView removeFromSuperview];
    self.topColorView = nil;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//      self.navigationBarStyle = JCNavigationBarStyleTransparent;
    self.topColorView.alpha = 0;

}

- (instancetype)init {
    
    if (self = [super init]) {
        self.height = AUTO(228)+kNavigationBarHeight;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.titleColorSelected = COLOR_2F2F2F;//COLOR_FE1F19
        self.titleColorNormal = COLOR_2F2F2F;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressWidth = 24;
        self.progressHeight = 3;
        self.progressColor = JCBaseColor;
        self.progressViewBottomSpace = 1;
        self.viewTop = self.height;
        self.menuViewHeight = kWMMenuViewHeight;
//        self.progressColor = [UIColor redColor];
        self.menuItemWidth = SCREEN_WIDTH/4.0f;
        self.maximumHeaderViewHeight = self.height-kNavigationBarHeight;
//        self.minimumHeaderViewHeight = kNavigationBarHeight;
        self.contentView.bounces = NO;
//        self.view.backgroundColor = COLOR_F0F0F0;
    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    [self initViews];
    [self getTopInfoData];
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTopInfoData) name:NotificationUserLogin object:nil];
    
}

- (void)backItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)getTopInfoData {

    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getDataModelPayInfoWithModel_id:self.model_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        [self.contentView.mj_header endRefreshing];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCKellyDataModelPayInfoModel *buyInfoModel = (JCKellyDataModelPayInfoModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCKellyDataModelPayInfoModel class]];
            self.buyInfoModel = buyInfoModel;
            self.headView.model = buyInfoModel;
            if (self.selectIndex==0) {
                self.allVC.buyInfoModel = buyInfoModel;
            }
            if (self.selectIndex==1) {
                self.spfVC.buyInfoModel = buyInfoModel;
            }
            if (self.selectIndex==2) {
                self.rqVC.buyInfoModel = buyInfoModel;
            }
            if (self.selectIndex==3) {
                self.jqsVC.buyInfoModel = buyInfoModel;
            }
//            [self reloadData];



        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.contentView.mj_header endRefreshing];
        [self.jcWindow endLoading];
    }];



}


- (void)initViews {
    
    UIButton *customView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [customView addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:customView];

    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.height);
    [self.view addSubview:self.headView];
    
//    self.contentView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
//        [weakSelf getTopInfoData];
////        [weakSelf.dataVC refreshData];
//    }];
        

    WeakSelf;
    self.headView.JCBuyClickBlock = ^{
        [weakSelf payAction];
    };

        
}


- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)payAction {
    if (self.buyInfoModel.model_status!=4) {
        if (![JCWUserBall currentUser]) {
            [self presentLogin];
            return;
        }
    }
    if (self.buyInfoModel.show_status==1) {
        //免费体验
        [self FreeExperienceCheck];
        return;
    }
    if (self.buyInfoModel.show_status==2) {
        if (self.buyInfoModel.model_status==1) {
            //免费体验中不能续费
            return;
        }
        if (self.buyInfoModel.model_status==3) {
            //下架不能购买
            return;
        }
        if (self.buyInfoModel.model_status==4) {
            //免费,不能购买
            return;
        }
    }
    if (self.buyInfoModel.show_status==4) {
        //下架
        return;
    }

    [self showPayView];
    
}

- (void)showPayView {
    WeakSelf;
    JCPayShowView *payView = [JCPayShowView new];
    payView.price = [NSString stringWithFormat:@"%@",@(self.buyInfoModel.big_data_price/100)];
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
    NSString *title = [NSString stringWithFormat:@"是否开通[指数异动] %@天免费体验",self.buyInfoModel.free_day];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange count_range = [title rangeOfString:self.buyInfoModel.free_day];
    if (count_range.location!=NSNotFound) {
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
    }

    
    alertView.contentLab.attributedText = attr;
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

//免费体验
- (void)FreeExperience {
    
    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getKellyDataModeFreeExperienceWithModel_id:self.model_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self getTopInfoData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];



}

//确认购买
- (void)sureBuy {
    if (self.buyInfoModel.big_data_price>0&&[[JCWUserBall currentUser].prize floatValue]<self.buyInfoModel.big_data_price) {
        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    NSString *scene = @"7";
    //1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5机构分歧 6.指数分歧
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:self.model_id scene:scene source:@"1" price:@"" Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *order_key = object[@"data"][@"order_key"];
            [self finalPayWithOrder_key:order_key coupon_id:@"" hongbao_id:@""];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
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
                [self getMyUserInfo];
                [self getTopInfoData];
            }
//            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
}
#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (scrollView.contentOffset.y < 0) {
        [self.view setNeedsLayout];
    }
    [self setNavEffect];
//    self.headView.dateHeadView.clearBg = self.dataVC.isTop?NO:YES;
//    self
//    if ([scrollView isKindOfClass:[WMMagicScrollView class]]) {
//        if (scrollView.contentOffset.y>AUTO(50)) {
//            self.autherHeadView.bgView.hidden = YES;
////            self.title = self.expertDetailModel.user_name;
//        }else {
//            self.autherHeadView.bgView.hidden = NO;
////            self.title = @"";
//        }
//    }

    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
//    JCTransactionDataModelVC *vc = [JCTransactionDataModelVC new];
//    vc.type = [NSString stringWithFormat:@"%ld",index];
    if (index==0) {
        self.allVC.buyInfoModel = self.buyInfoModel;
        return self.allVC;;
    }
    if (index==1) {
        self.spfVC.buyInfoModel = self.buyInfoModel;
        return self.spfVC;;
    }
    if (index==2) {
        self.rqVC.buyInfoModel = self.buyInfoModel;
        return self.rqVC;;
    }
    if (index==3) {
        self.jqsVC.buyInfoModel = self.buyInfoModel;
        return self.jqsVC;;
    }

    return [UIViewController new];

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
//    menuView.backgroundColor = COLOR_F0F0F0;
    return CGRectMake(0, _viewTop, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height-kWMMenuViewHeight-kNavigationBarHeight);
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    if (self.selectIndex==0) {
        self.allVC.buyInfoModel = self.buyInfoModel;
//        return self.allVC;;
    }
    if (self.selectIndex==1) {
        self.spfVC.buyInfoModel = self.buyInfoModel;
//        return self.spfVC;;
    }
    if (self.selectIndex==2) {
        self.rqVC.buyInfoModel = self.buyInfoModel;
//        return self.rqVC;;
    }
    if (self.selectIndex==3) {
        self.jqsVC.buyInfoModel = self.buyInfoModel;
//        return self.jqsVC;;
    }

}

- (void)setupColorView {
    self.menuView.backgroundColor = COLOR_F0F0F0;
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
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *titleLab = [UILabel initWithTitle:@"指数异动" andFont:17 andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.topColorView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backBtn);
        make.centerX.equalTo(self.topColorView);
    }];
    

}


- (JCHistoryPayHeadView *)headView {
    if (!_headView) {
        _headView = [JCHistoryPayHeadView new];
        _headView.type = 4;
    }
    return _headView;
}
- (JCTransactionDataModelVC *)allVC {
    if (!_allVC) {
        _allVC = [JCTransactionDataModelVC new];
        _allVC.type = @"0";
        WeakSelf;
        _allVC.JCOpenBlock = ^{
            [weakSelf payAction];
        };
        _allVC.JCRefreshBlock = ^{
            [weakSelf getTopInfoData];
        };
    }
    return _allVC;
}

- (JCTransactionDataModelVC *)spfVC {
    if (!_spfVC) {
        _spfVC = [JCTransactionDataModelVC new];
        _spfVC.style = 1;
        _spfVC.type = @"1";
        WeakSelf;
        _spfVC.JCOpenBlock = ^{
            [weakSelf payAction];
        };
        _spfVC.JCRefreshBlock = ^{
            [weakSelf getTopInfoData];
        };
    }
    return _spfVC;
}

- (JCTransactionDataModelVC *)rqVC {
    if (!_rqVC) {
        _rqVC = [JCTransactionDataModelVC new];
        _rqVC.type = @"2";
        _rqVC.style = 1;
        WeakSelf;
        _rqVC.JCOpenBlock = ^{
            [weakSelf payAction];
        };
        _rqVC.JCRefreshBlock = ^{
            [weakSelf getTopInfoData];
        };
    }
    return _rqVC;
}

- (JCTransactionDataModelVC *)jqsVC {
    if (!_jqsVC) {
        _jqsVC = [JCTransactionDataModelVC new];
        _jqsVC.type = @"3";
        _jqsVC.style = 1;
        WeakSelf;
        _jqsVC.JCOpenBlock = ^{
            [weakSelf payAction];
        };
        _jqsVC.JCRefreshBlock = ^{
            [weakSelf getTopInfoData];
        };
    }
    return _jqsVC;
}
@end
