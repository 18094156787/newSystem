//
//  JCChargeVC.m
//  Jingcai
//
//  Created by Administrator on 2019/1/10.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCChargeVC.h"
#import "JCChargeAccountCell.h"
#import "JCChargeAreaCell.h"
#import "JCChargeWayCell.h"
#import "JCChargeHeaderView.h"
#import "TTTAttributedLabel.h"
#import "PayProtocolViewController.h"
#import "JCWJsonTool.h"
#import "JCWToastTool.h"
#import "JCCaiyunBall.h"
#import "JCPayWayBall.h"
#import "JCWUserBall.h"
#import "JCBaseViewController.h"
#import "WXPaymentBall.h"
#import "WXApiManager.h"
#import "UPAPayPlugin.h"
#import "RBApplePayManager.h"
#import "JCWConst.h"
#import "JCPayMethodManager.h"
#import "JCContactUsVC.h"
#import "UIView+JCLoading.h"
//#import "JCPayManager.h"
#import "JCDakaBuyPayWayTopView.h"
#import "IAPManager.h"
#import "JCRechareHeadView.h"
#import "JCRechareBannerCell.h"
static NSString * const productId001 = @"com.zhisheng.zq.price.001";
static NSString * const productId002 = @"com.zhisheng.zq.price.002";
static NSString * const productId003 = @"com.zhisheng.zq.price.003";
static NSString * const productId004 = @"com.zhisheng.zq.price.004";
static NSString * const productId006 = @"com.zhisheng.zq.price.006";
static NSString * const productId007 = @"com.zhisheng.zq.price.007";

#define JCChargeHeaderH     44.f
#define JCChargeAccountH    60.f
#define JCChargeInputH      190.f
#define JCChargeWayH        62

@interface JCChargeVC () <UITableViewDelegate, UITableViewDataSource, TTTAttributedLabelDelegate,IApRequestResultsDelegate>
@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollow;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint * tableHeightConstraint;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel * agreeLabel;
@property (weak, nonatomic) IBOutlet UIButton *rechargeBgView;
@property (strong, nonatomic) NSArray * chargeItemArray;
@property (strong, nonatomic) NSMutableArray * chargeWayArray;
@property (strong, nonatomic) NSString * caiyun;
@property (strong, nonatomic) NSString *user_name;
@property (strong, nonatomic) UIButton *rechargeBtn;
@property (weak, nonatomic) IBOutlet UILabel *infoLab;
@property (strong, nonatomic) JCRechareHeadView *headView;
@property (strong, nonatomic) UIButton *sureProtocolBtn;
@property (strong, nonatomic) NSArray *bannnerArray;
@property (strong, nonatomic) NSArray *actTipArray;
@property (assign, nonatomic) float bannerHeight;
@end

@implementation JCChargeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
    [[IAPManager shared] checkMyBuyGoods];

}

- (void)back:(UIButton *)sender {
    if (self.JCRefreshBlock) {
        self.JCRefreshBlock();
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"充值";
    self.bannerHeight = 0;
    
    [self getChargeList];
    [self getBanner];
    [IAPManager shared].delegate = self;
    WeakSelf;
    [IAPManager shared].JNSuccessBlock = ^{
        
       
       
        [JCWToastTool showHint:@"充值成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf getBanner];
            [weakSelf getChargeList];
        });
    };
    
    [[IAPManager shared] checkMyBuyGoods];//重新进入该页面,重新检查是否有未完成的订单


}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[IAPManager shared] checkMyBuyGoods];//退出该页面,重新检查是否有未完成的订单

}

- (void)initSubViews {
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 136);
//    self.tableView.tableHeaderView = self.headView;

    
    [self.scrollow addSubview:self.sureProtocolBtn];
    [self.sureProtocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.agreeLabel).offset(-3);
        make.right.equalTo(self.agreeLabel.mas_left);
        make.width.height.mas_equalTo(30);
    }];
    
    
    self.tableHeightConstraint.constant = JCChargeAccountH + JCChargeInputH + JCChargeWayH*self.chargeWayArray.count + JCChargeHeaderH+AUTO(16)+self.bannerHeight;
    
    self.rechargeBgView.backgroundColor = JCWhiteColor;

    [self.rechargeBgView addSubview:self.rechargeBtn];
    [self.rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(44));
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JCChargeAccountCell" bundle:nil] forCellReuseIdentifier:@"JCChargeAccountCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JCChargeAreaCell" bundle:nil] forCellReuseIdentifier:@"JCChargeAreaCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JCChargeWayCell" bundle:nil] forCellReuseIdentifier:@"JCChargeWayCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView registerClass:[JCRechareBannerCell class] forCellReuseIdentifier:@"JCRechareBannerCell"];
    
    self.agreeLabel.textAlignment = NSTextAlignmentCenter;
    self.agreeLabel.delegate = self;
    NSAttributedString * attString = [[NSAttributedString alloc] initWithString:@"支付即表示同意《鲸猜足球用户购买协议》"
                                                                    attributes:@{
                                                                                 NSForegroundColorAttributeName:(id)UIColorFromRGB(0x999999).CGColor,
                                                                                 NSFontAttributeName:[UIFont systemFontOfSize:13.f]}];
    self.agreeLabel.text = attString;
    self.agreeLabel.linkAttributes = @{NSForegroundColorAttributeName:(id)UIColorFromRGB(0x0099ff).CGColor};
    NSRange range = [self.agreeLabel.text rangeOfString:@"《鲸猜足球用户购买协议》"];
    [self.agreeLabel addLinkToURL:[NSURL URLWithString:@""] withRange:range];
    
   NSString *info = [NSString stringWithFormat:@"温馨提示：\n1.鲸猜足球非购彩平台，红币一经充值成功，只可用于购买专家方案，不支持提现、购彩等操作。\n2.红币充值和消费过程上遇到问题，请及时联系客服。客服微信号：%@。\n3.严禁未满18周岁的未成年人参与购买方案",[JCConfigModel currentConfigModel].customer];
    self.infoLab.text = info;
    

    WeakSelf;
    self.scrollow.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [[IAPManager shared] checkMyBuyGoods];
        [weakSelf getBanner];
//        weakSelf.actTipArray = @[];
        [weakSelf getChargeList];
    }];
}

- (void)getChargeList {
    [self.view showLoading];
    JCPayService_New * service = [JCPayService_New new];
    [service getChargeListWithType:@"1" success:^(id  _Nullable object) {
        [self.view endLoading];
        [self.scrollow.mj_header endRefreshing];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.chargeItemArray = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCCaiyunBall class]];
            self.caiyun = [NSString stringWithFormat:@"%@",object[@"data"][@"hongbi"]];
            self.user_name = object[@"data"][@"user_name"];
            dispatch_async(dispatch_get_main_queue(), ^{
                //刷新UI的代码放到主线程执行
                [self.tableView reloadData];
            });
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.scrollow.mj_header endRefreshing];
        [self.view endLoading];
        [JCWToastTool showHint:@"网络异常"];
    }];
}

- (void)getBanner {

    JCActivityService *service = [JCActivityService service];
    [service getRechargeBannerInfoWithsuccess:^(id  _Nullable object) {
        [self.scrollow.mj_header endRefreshing];
        if ([JCWJsonTool isSuccessResponse:object]) {
            
            NSLog(@"想要的%@",object);
           self.bannnerArray = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"][@"banner_info"]];
            self.actTipArray = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"][@"activity_notable"]];

//            JCWSlideBall *model = [JCWSlideBall new];
//            model.desc = @"54sdfdf";
//            self.actTipArray = @[model];

            
            float bannerHeihgt = 0;
            float tipHeihgt = 0;
            if (self.bannnerArray.count>0) {
                bannerHeihgt = 128;
            }
            if (self.actTipArray.count>0) {
                tipHeihgt = 40;
            }

            self.bannerHeight = bannerHeihgt+tipHeihgt;
            self.tableHeightConstraint.constant = JCChargeAccountH + JCChargeInputH + JCChargeWayH*self.chargeWayArray.count + JCChargeHeaderH+AUTO(16)+self.bannerHeight;
            [self.tableView reloadData];

       }else{
           [JCWToastTool showHint:object[@"msg"]];
       }

    } failure:^(NSError * _Nonnull error) {
        [self.scrollow.mj_header endRefreshing];
    }];

}

#pragma mark -
- (void)kefuBtnClick {
    [self.navigationController pushViewController:[JCContactUsVC new] animated:YES];
}

#pragma mark - Setter && Getter
- (void)setChargeItemArray:(NSArray *)chargeItemArray {
    _chargeItemArray = chargeItemArray;
    [self.tableView reloadData];
}
- (NSMutableArray *)chargeWayArray {
    if (!_chargeWayArray) {
        _chargeWayArray = [NSMutableArray array];
        
    }
    return _chargeWayArray;
}

#pragma mark - TTTAttributedLabelDelegate
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url {
    NSLog(@"点击了用户充值协议");
    [self.navigationController pushViewController:[PayProtocolViewController new] animated:YES];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (section==2) {
        return JCChargeHeaderH;
    }
    return 0.001f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return self.bannerHeight;
    }
    if (indexPath.section == 1) {
        return JCChargeAccountH;
    }
    if (indexPath.section == 2) {
        return JCChargeInputH;
    }
    return JCChargeWayH;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    JCChargeHeaderView * headerView = [JCChargeHeaderView viewFromXib];
    JCDakaBuyPayWayTopView *headerView = [JCDakaBuyPayWayTopView new];
    
    if (section == 2) {
       headerView.titleLab.text = @"充值金额";
        headerView.infoLab.text = @"1元 = 1红币";
        return headerView;
    }

    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    if (section==2) {
        view.backgroundColor = JCWhiteColor;
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==3) {
        return 0.001f;
    }
    if (section==0) {
        return self.bannerHeight>0?AUTO(8):0;
    }
    return AUTO(8);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (self.bannnerArray.count>0||self.actTipArray.count>0) {
            JCRechareBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCRechareBannerCell"];
            cell.bannerArray = self.bannnerArray;
            cell.tipArray = self.actTipArray;
            return cell;
        }
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

        return cell;
    }
    if (indexPath.section == 1) {
        JCChargeAccountCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCChargeAccountCell"];
        cell.name = self.user_name;
        cell.caiyun = self.caiyun;
        return cell;
    }
    if (indexPath.section == 2) {
        JCChargeAreaCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCChargeAreaCell"];
        cell.chargeItemArray = self.chargeItemArray;
        return cell;
    }
    //支付方式
    JCChargeWayCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCChargeWayCell"];
    cell.payWayBall = self.chargeWayArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
- (IBAction)payBtnClick:(UIButton *)sender {
    if (!self.sureProtocolBtn.selected) {
        [JCWToastTool showHint:@"请先勾选同意《鲸猜足球用户购买协议》"];
//        [self.scrollow scrollToBottomAnimated:YES];
        NSLog(@"屏幕高%.0f",SCREEN_HEIGHT-kNavigationBarHeight-kBottomTabSafeAreaHeight-100);
        float content = SCREEN_HEIGHT-kNavigationBarHeight-kBottomTabSafeAreaHeight-100;
        if (self.sureProtocolBtn.bottom>content) {
            [self.scrollow setContentOffset:CGPointMake(0, self.sureProtocolBtn.bottom-content+50) animated:YES];
        }
        NSLog(@"按钮位置%.0f",self.sureProtocolBtn.bottom);
//        [self.scrollow setContentOffset:CGPointMake(0, 150) animated:YES];
        return;
    }
    

    dispatch_async(dispatch_get_main_queue(), ^{
        JCWUserBall * userBall = [JCWUserBall currentUser];
        if (!userBall) {
            [self presentLogin];
            return ;
        }
        
        JCCaiyunBall * caiyunBall = nil;
        for (JCCaiyunBall * itemBall in self.chargeItemArray) {
            if (itemBall.state_issel) {
                caiyunBall = itemBall;
                break;
            }
        }
        if (!caiyunBall) {
            [JCWToastTool showHint:@"请选择充值金额"];
            return ;
        }
        [SVProgressHUD show];
        JCPayService_New *service = [JCPayService_New service];
        [service getUserRechareWithRecharge_id:caiyunBall.id success:^(id  _Nullable object) {
            [SVProgressHUD dismiss];
            if ([JCWJsonTool isSuccessResponse:object]) {
                NSString *order_id = object[@"data"][@"order_id"];
                if (order_id.length>0) {
                    [[NSUserDefaults standardUserDefaults] setObject:order_id forKey:@"recharge_order_id"];
                    [IAPManager shared].order_id = order_id;
                    [[IAPManager shared] requestProductWithId:caiyunBall.apple_price_id order_id:order_id];

                }else{
                    [JCWToastTool showHint:@"订单id不存在"];
                }

            }else{
                
            }

            
        } failure:^(NSError * _Nonnull error) {
            [SVProgressHUD dismiss];
        }];

    });


}
- (void)sureProtocolBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if(sender.selected){
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"JCAgreeRecharge"];
    }else{
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JCAgreeRecharge"]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCAgreeRecharge"];
        }
        
    }
}
#pragma mark IApRequestResultsDelegate
- (void)filedWithErrorCode:(NSInteger)errorCode andError:(NSString *)error {
    [SVProgressHUD dismiss];
    dispatch_async(dispatch_get_main_queue(), ^{
        [JCWToastTool showHint:@"充值失败"];
    });

  
    switch (errorCode) {
        case IAP_FILEDCOED_APPLECODE:
            NSLog(@"用户禁止应用内付费购买:%@",error);
            break;

        case IAP_FILEDCOED_NORIGHT:
            NSLog(@"用户禁止应用内付费购买");
            break;

        case IAP_FILEDCOED_EMPTYGOODS:
            NSLog(@"商品为空");
            break;

        case IAP_FILEDCOED_CANNOTGETINFORMATION:
            NSLog(@"无法获取产品信息，请重试");
            break;

        case IAP_FILEDCOED_BUYFILED:
            NSLog(@"购买失败，请重试");
            break;

        case IAP_FILEDCOED_USERCANCEL:
            NSLog(@"用户取消交易");
            break;
            
        default:
            break;
    }
}

- (UIButton *)rechargeBtn {
    if (!_rechargeBtn) {
        _rechargeBtn = [UIButton initWithText:@"立即支付" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_rechargeBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        _rechargeBtn.userInteractionEnabled = NO;
    }
    return _rechargeBtn;
}

- (JCRechareHeadView *)headView {
    if (!_headView) {
        _headView = [JCRechareHeadView new];
    }
    return _headView;
}

- (UIButton *)sureProtocolBtn {
    if (!_sureProtocolBtn) {
        _sureProtocolBtn = [UIButton new];
        [_sureProtocolBtn setImage:JCIMAGE(@"protocol_select") forState:UIControlStateSelected];
        [_sureProtocolBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_sureProtocolBtn addTarget:self action:@selector(sureProtocolBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JCAgreeRecharge"]) {
            _sureProtocolBtn.selected = YES;
        }
    }
    return _sureProtocolBtn;
}
@end
