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

@end

@implementation JCChargeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
    [[IAPManager shared] checkMyBuyGoods];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"充值";

    
    [self getChargeList];
    [IAPManager shared].delegate = self;
    WeakSelf;
    [IAPManager shared].JNSuccessBlock = ^{
        
        [weakSelf getChargeList];
        [JCWToastTool showHint:@"充值成功"];
    };
    
    [[IAPManager shared] checkMyBuyGoods];//重新进入该页面,重新检查是否有未完成的订单


//    [[IAPManager shared] startManager];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCaiyun) name:UserRechargeSuccess object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[IAPManager shared] checkMyBuyGoods];//退出该页面,重新检查是否有未完成的订单

}

- (void)initSubViews {
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
    
    self.tableHeightConstraint.constant = JCChargeAccountH + JCChargeInputH + JCChargeWayH*self.chargeWayArray.count + JCChargeHeaderH+AUTO(16);
    
    //self.agreeLabel.textAlignment = NSTextAlignmentCenter;
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
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    if (section==1) {
        return JCChargeHeaderH;
    }
    return 0.001f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return JCChargeAccountH;
    }
    if (indexPath.section == 1) {
        return JCChargeInputH;
    }
    return JCChargeWayH;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    JCChargeHeaderView * headerView = [JCChargeHeaderView viewFromXib];
    JCDakaBuyPayWayTopView *headerView = [JCDakaBuyPayWayTopView new];
    
    if (section == 1) {
       headerView.titleLab.text = @"充值金额";
        headerView.infoLab.text = @"1元 = 1红币";
        return headerView;
    }

    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==2) {
        return 0.001f;
    }
    return AUTO(8);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        JCChargeAccountCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCChargeAccountCell"];
        cell.name = self.user_name;
        cell.caiyun = self.caiyun;
        return cell;
    }
    if (indexPath.section == 1) {
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
    //充值方式
    if (indexPath.section == 2) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        for (JCPayWayBall * itemBall in self.chargeWayArray) {
            itemBall.state_issel = NO;
        }
        JCPayWayBall * currentBall = self.chargeWayArray[indexPath.row];
        currentBall.state_issel = YES;
        [self.tableView reloadData];
    }
}
- (IBAction)payBtnClick:(UIButton *)sender {

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
//        [service userClickPayMoneyWithMoney:[NSString stringWithFormat:@"%ld",caiyunBall.prize] success:^(id  _Nullable object) {
//            if ([JCWJsonTool isSuccessResponse:object]) {
//
//            }
//
//        } failure:^(NSError * _Nonnull error) {
//
//
//
//        }];
        
        

    });


//    if (caiyunBall.prize==6) {
//         [[IAPManager shared] requestProductWithId:productId001];
//    }
//    if (caiyunBall.prize==30) {
//         [[IAPManager shared] requestProductWithId:productId002];
//    }
//    if (caiyunBall.prize==60) {
//         [[IAPManager shared] requestProductWithId:productId003];
//    }
//    if (caiyunBall.prize==88) {
//         [[IAPManager shared] requestProductWithId:productId004];
//    }
//    if (caiyunBall.prize==188) {
//         [[IAPManager shared] requestProductWithId:productId006];
//    }
//    if (caiyunBall.prize==388) {
//         [[IAPManager shared] requestProductWithId:productId007];
//    }
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
@end
