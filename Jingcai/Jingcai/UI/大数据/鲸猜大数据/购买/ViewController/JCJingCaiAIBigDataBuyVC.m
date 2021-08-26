//
//  JCJingCaiAIBigDataBuyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataBuyVC.h"
#import "JCBuyPlanPayWayCell.h"
#import "JCPayMethodManager.h"
#import "JCWMyHongbaoBall.h"
#import "JCHongbangWMstckyVC.h"
#import "JCHHongbaoModel.h"
#import "JCHongbaoShowView.h"
#import "RBApplePayManager.h"
#import "WXPaymentBall.h"
#import "WXApiManager.h"
#import "JCHongbangDetailWMstckyVC.h"
#import "JCChargeVC.h"
#import "JCHongbangInfoTopCell.h"
#import "JCJingCaiAIBigDataBuyPriceView.h"
#import "JCJingCaiAIBigDataBuyInfoHeadView.h"
#import "JCJingCaiAIBigDataSingleBuyInfoHeadView.h"
#import "JCBigDataMonthProduceModel.h"
#import "JCDakaBuyPayWayTopView.h"
#import "JCBaseTitleAlertView.h"
@interface JCJingCaiAIBigDataBuyVC ()

@property (nonatomic, strong) JCJingCaiAIBigDataBuyPriceView *priceInfoView;

@property (nonatomic, strong) JCJingCaiAIBigDataBuyInfoHeadView *headView;

@property (nonatomic, strong) JCJingCaiAIBigDataSingleBuyInfoHeadView *singleHeadView;

@property (nonatomic,strong) NSMutableArray *payWayArray;

@property (nonatomic, strong) JCWTjInfoDetailBall *tjInfoDetailBall;//方案详情

@property (nonatomic, strong) JCWExpertBall * tjUserBall;//专家详情

@property (nonatomic, strong) NSArray *matchDataArray;

@property (nonatomic, strong) NSArray *tuiJianArray;

@property (nonatomic,strong) JCWMyHongbaoBall *useHbModel;//当前选中的红包

@property (nonatomic, strong) JCHHongbaoModel *hongbaoModel;

@property (nonatomic, strong) NSArray *hongbaoArray;

@property (nonatomic,strong) JCHongbaoShowView*hbPickerView;

@property (nonatomic,strong) JCPayWayBall *selPayWay;

@property (nonatomic,strong) JCWMyHongbaoBall *mdModel;//免单券

@property (nonatomic,assign) BOOL match_end;//比较已结束,不可购买

@property (nonatomic,strong) UIView *protocolView;

@property (nonatomic,strong) YYLabel *protocolLab;

@property (nonatomic,strong) UIButton *sureProtocolBtn;

@property (nonatomic,strong) NSString *is_pay;// is_pay 是否需要购买 1需要 0不需要 2是已购买

@property (nonatomic,strong) NSString *is_hongbao;//1是可以用,2不能用

@property (nonatomic,strong) UIView *buyUserView;

@property (nonatomic,strong) UILabel *buyCountLab;

@property (nonatomic,strong) JCBigDataMonthProduceModel *productModel;

@end

@implementation JCJingCaiAIBigDataBuyVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}


- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.title = self.is_dc?@"单场比赛数据订阅服务":@"大数据购买";
    self.is_hongbao = @"2";//大数据购买不能使用红包
    [self initViews];
    [self getUserInfo];
    [self refreshData];
    self.view.backgroundColor = COLOR_F0F0F0;
    self.tableView.backgroundColor = COLOR_F0F0F0;
//     self.protocolView.hidden = NO;
}

- (void)refreshData {
    [self.view showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New service];
    [service getBigDataBuyInfooWithMatch_id:self.match_id success:^(id  _Nullable object) {
        [self endRefresh];
        self.protocolView.hidden = NO;
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.productModel = (JCBigDataMonthProduceModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBigDataMonthProduceModel class]];
            self.priceInfoView.is_dc = self.is_dc;
            self.priceInfoView.productModel = self.productModel;

            self.hbPickerView.dataArray = self.hongbaoArray;
            [self getPayWayArray];//构建支付方式
//            [self showBuyUserView];
            [self.tableView reloadData];
            if (self.is_dc) {
                self.singleHeadView.productModel = self.productModel;
            }else{
                self.headView.productModel = self.productModel;
            }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        self.protocolView.hidden = NO;
        [self endRefresh];
    }];

}
- (void)getUserInfo {

    JCUserService_New *service = [JCUserService_New service];
    [service getMyUserInfoWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *token = [JCWUserBall currentUser].token;
            NSLog(@"token=%@",token);
            //缓存userBall对象
            JCWUserBall *userBall = (JCWUserBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWUserBall class]];
//            userBall.fabu = @"1";
            userBall.token = token;
            [JCWUserBall save:userBall];
            [self.tableView reloadData];
        }

    } failure:^(NSError * _Nonnull error) {

    }];

}

- (void)initViews {
    
    if (self.is_dc) {
        self.singleHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(140));
        self.tableView.tableHeaderView = self.singleHeadView;
    }else{
        self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(210));
      self.tableView.tableHeaderView = self.headView;
    }
    
    

    self.protocolView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(30));
    self.tableView.tableFooterView = self.protocolView;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 1;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
    }];
    
    [self.tableView registerClass:[JCBuyPlanPayWayCell class] forCellReuseIdentifier:@"JCBuyPlanPayWayCell"];

    [self.view addSubview:self.buyUserView];
    self.buyUserView.frame = CGRectMake(0, SCREEN_HEIGHT-76-kBottomTabSafeAreaHeight-kNavigationBarHeight-50, SCREEN_WIDTH, AUTO(35));
    [self.buyUserView addSubview:self.buyCountLab];
    [self.buyCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.buyUserView);
    }];

    [self.view addSubview:self.priceInfoView];
    self.priceInfoView.frame = CGRectMake(0, SCREEN_HEIGHT-76-kBottomTabSafeAreaHeight-kNavigationBarHeight, SCREEN_WIDTH, 76+kBottomTabSafeAreaHeight);
 
//    [self.view addSubview:self.protocolView];
//    [self.protocolView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.priceInfoView.mas_top);
//        make.height.mas_equalTo(AUTO(32));
//    }];
    
    [self.protocolView addSubview:self.sureProtocolBtn];
    [self.sureProtocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.protocolView);
        make.left.offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(30)));
    }];
    
    [self.protocolView addSubview:self.protocolLab];
    [self.protocolLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.protocolView);
        make.left.equalTo(self.sureProtocolBtn.mas_right);
    }];
    
        NSString *codeLoginString = @"阅读并同意《鲸猜足球用户购买协议》";
        NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:codeLoginString attributes:@{NSForegroundColorAttributeName:COLOR_A9A9A9,NSFontAttributeName:[UIFont systemFontOfSize:AUTO(12)]}];
        NSRange loginRange = [codeLoginString rangeOfString:@"《鲸猜足球用户购买协议》"];
    //    [atext yy_setFont:[UIFont systemFontOfSize:AUTO(12)] range:atext.yy_rangeOfAll];
        [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_5194E3} range:loginRange];
        YYTextHighlight *hi = [YYTextHighlight new];
        [atext setTextHighlight:hi range:codeLoginString.rangeOfAll];
        
        WeakSelf;
        hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            WebViewController *vc = [WebViewController new];
                            vc.titleStr = @"鲸猜足球用户购买协议";
                            NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_purchase];
                            vc.urlStr = NonNil(urlStr);
                            [weakSelf.navigationController pushViewController:vc animated:YES];
        };

        self.protocolLab.attributedText=atext;
    
    self.priceInfoView.JCSureBtnClickBlock = ^{
        [weakSelf sureBtnClick];
    };
    
//    [self caculatePrice];
    
    self.hbPickerView.dataArray = self.hongbaoArray;
//    WeakSelf;
    self.hbPickerView.hbPickerSelBlock = ^(JCWMyHongbaoBall * _Nullable hongbaoBall) {
        weakSelf.useHbModel = hongbaoBall;
        if ([hongbaoBall.id integerValue]==0) {
            [weakSelf.payWayArray enumerateObjectsUsingBlock:^(JCPayWayBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.state_issel = NO;
            }];

        }
        [weakSelf.tableView reloadData];
        [weakSelf caculatePrice];
//        weakSelf.redpacketLab.text = [NSString stringWithFormat:@"使用一张,抵扣¥%ld",hongbaoBall.prize/100];
    };
    
    

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.payWayArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0&&[self.is_hongbao integerValue]==2) {
        return 0.001f;
    }
    return AUTO(54);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    if (indexPath.section==0) {
        if ([self.is_hongbao integerValue]==2&&indexPath.row==0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
            return cell;
        }
        
            JCBuyPlanPayWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBuyPlanPayWayCell"];
            JCPayWayBall *payWayball = self.payWayArray[indexPath.row];
            cell.payWayball = payWayball;
            if (indexPath.row==0) {
                if (self.hongbaoModel.highest.length>0) {
                    if (!self.useHbModel||[self.useHbModel.id integerValue]==0) {
//                        cell.hongbaoImgView.hidden = NO;
                        cell.infoLab.text = self.hongbaoModel.highest;
                    }else{
//                        cell.hongbaoImgView.hidden = YES;
                        cell.infoLab.text = @"";
                    }

                }else{
//                    cell.hongbaoImgView.hidden = YES;
//                    cell.hongbaoLab.text = @"";
                }
                if (self.useHbModel&&[self.useHbModel.id integerValue]>0) {
                    cell.selHongbaoLab.text = [NSString stringWithFormat:@"-%ld",self.useHbModel.prize/100];
                }else{
                    cell.selHongbaoLab.text = @"";
                }
            }

        NSLog(@"当前多少%@",[JCWUserBall currentUser].caiyun);
        if (indexPath.row==1) {
            if ([self.useHbModel.id integerValue]==0) {
                if ([[JCWUserBall currentUser].caiyun integerValue]<[self.productModel.total integerValue]/100) {
                    cell.selHongbaoLab.text = @"";
                }else{
                    cell.selHongbaoLab.text = @"";
                }
            }else{
                NSInteger discountNum = self.useHbModel.prize/100;
                NSInteger payPrice = [self.productModel.total integerValue]/100-discountNum;//实际付款金额
                if ([[JCWUserBall currentUser].caiyun integerValue]<payPrice) {
                    cell.selHongbaoLab.text = @"";
                }else{
                    cell.selHongbaoLab.text = @"";
                }

            }
            
            
            
            
        }
            return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
  
 
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        if ([self.is_hongbao integerValue]==2) {
            [JCWToastTool showHint:@"该方案不支持使用红包"];
            return;
        }else{
            if (self.hongbaoArray.count==0) {
                [JCWToastTool showHint:@"您目前没有可使用红包"];
                return;
            }
        }
        [[UIApplication sharedApplication].windows.lastObject addSubview:self.hbPickerView];
        [self.hbPickerView show];
        
    }else{
        if (indexPath.row==1) {
            if ([self.useHbModel.id integerValue]>0) {
                NSInteger discountNum = self.useHbModel.prize/100;
                NSInteger payPrice = [self.productModel.total integerValue]/100-discountNum;//实际付款金额
                if ([[JCWUserBall currentUser].caiyun integerValue]<payPrice) {
                    return;
                }
            }else{
                if ([[JCWUserBall currentUser].caiyun integerValue]<[self.productModel.total integerValue]/100) {
                    return;
                }
                
            }

        }
        

        [self.payWayArray enumerateObjectsUsingBlock:^(JCPayWayBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.state_issel = NO;
        }];
        JCPayWayBall *payWayBall = self.payWayArray[indexPath.row];
        payWayBall.state_issel = YES;
        self.selPayWay = payWayBall;
        [self.tableView reloadData];
    }
//    if (indexPath.row==0) {
//        if ([[JCWUserBall currentUser].caiyun integerValue]<[self.productModel.total integerValue]/100.f) {
//            return;
//        }
//
//    }
//
//
//    [self.payWayArray enumerateObjectsUsingBlock:^(JCPayWayBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        obj.state_issel = NO;
//    }];
//    JCPayWayBall *payWayBall = self.payWayArray[indexPath.row];
//    payWayBall.state_issel = YES;
//    self.selPayWay = payWayBall;
//    [self.tableView reloadData];

}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (section==0) {
        UIView *view = [UIView new];
        view.backgroundColor = COLOR_F4F6F9;
        return view;
    }
    
    
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if (section==0) {
//        return AUTO(8);
//    }
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        JCDakaBuyPayWayTopView *headView = [JCDakaBuyPayWayTopView new];
        headView.titleLab.text = @"购买方式";
        headView.backgroundColor = JCWhiteColor;
        return headView;
    }
    return [UIView new];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return 50;
    }
    return 0.001f;
}

#pragma 设置线条画满
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//
////        [cell setSeparatorInset:UIEdgeInsetsZero];
//        if (indexPath.section==0||indexPath.section==1) {
////            self.tableView.separatorInset = UIEdgeInsetsZero;
////             [cell setSeparatorInset:UIEdgeInsetsZero];
//              [cell setSeparatorInset: UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0)];
//        }
//        else{
////             [cell setSeparatorInset: UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0)];
//             [cell setSeparatorInset:UIEdgeInsetsZero];
////            self.tableView.separatorInset = UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0);
//        }
//    }
//
//}


#pragma mark --

- (void)caculatePrice {
    float needPayNum = [self.productModel.total floatValue];
    float discountNum = self.useHbModel.prize/100;
    float price = 0;
    if (discountNum >= needPayNum) {
        price = 0;
    }else{
        price = needPayNum-discountNum;

    }
    NSString *money = [NSString stringWithFormat:@"¥%.1f",price];
//    [NSString stringWithFormat:@"%ld红币",price];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:money];
    NSRange range = [money rangeOfString:@"¥"];
    NSRange range1 = [money rangeOfString:@".0"];
    [attributedStr setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(14)]} range:range];
    [attributedStr setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(14)]} range:range1];
    self.priceInfoView.priceLab.attributedText = attributedStr;

}

- (void)sureBtnClick {
    
    if (!_sureProtocolBtn.selected) {
        [JCWToastTool showHint:@"请阅读“用户服务条款”并点击同意"];
        return ;
    }
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    

    WeakSelf;
    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
    [alertView alertTitle:@"提示" TitleColor:COLOR_2F2F2F Mesasge:@"是否确认支付?" MessageColor:COLOR_666666 SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
        [alertView removeFromSuperview];
        [weakSelf payAction];

        
    } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
       [alertView removeFromSuperview];
    }];
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];

}

- (void)payAction {

    if (self.selPayWay.payWay==JCPayWayEnumCaiyun) {
        [self caiyunPay];
    }

}


#pragma mark - 支付方法


//红币支付
- (void)caiyunPay {
    NSString *price = self.productModel.total;
    if (self.is_dc) {
        price = self.productModel.one_total;
    }
    
    if ([[JCWUserBall currentUser].prize floatValue]<[price integerValue]/100) {
        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    //默认是包月
    NSString *unique = @"0";
    if (self.is_dc) {
        unique = self.match_id;
    }
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:unique scene:@"3" source:@"1" Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *order_key = object[@"data"][@"order_key"];
            [self finalPayWithOrder_key:order_key coupon_id:@"" hongbao_id:self.useHbModel.id];
//            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];

}

//下单并支付
- (void)finalPayWithOrder_key:(NSString *)order_key coupon_id:(NSString *)coupon_id hongbao_id:(NSString *)hongbao_id{
    [self.jcWindow endLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getPayOrderWithOrder_key:order_key pay_type:@"3" hongbao_id:hongbao_id coupon_id:coupon_id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_pay = object[@"data"][@"is_pay"];
            if ([is_pay intValue]==1) {
                [JCWToastTool showHint:@"支付成功"];
            [[NSNotificationCenter defaultCenter] postNotificationName:JingcaiAIProduceBuy object:nil];
            [self.navigationController popViewControllerAnimated:YES];
                
            }



        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
    
}


- (void)sureProtocolBtnClick {
    self.sureProtocolBtn.selected = !self.sureProtocolBtn.selected;
}

- (void)showBuyUserView {
    NSArray *userArray = self.productModel.user_img;
        userArray = [[userArray reverseObjectEnumerator] allObjects];
            for (int i=0; i<userArray.count; i++) {
                 NSString *user_img = userArray[i];
                  UIImageView *imgView = [UIImageView new];
                  [imgView hg_setAllCornerWithCornerRadius:AUTO(16)];
                imgView.frame = CGRectMake(AUTO(15)+AUTO(15)*i, AUTO(4), AUTO(32), AUTO(32));
                imgView.image = JCIMAGE(@"userImg_default");
                 [imgView sd_setImageWithURL:[NSURL URLWithString:user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    //              [self.buyBgView addSubview:imgView];
                [self.buyUserView insertSubview:imgView atIndex:0];
                [imgView bringSubviewToFront:self.buyUserView];
          }
    if ([self.productModel.user_count integerValue]>0) {
        NSString *title = [NSString stringWithFormat:@"%@人购买",self.productModel.user_count];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:self.productModel.user_count];
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:range];
        self.buyCountLab.attributedText = attr;
    }else{
        self.buyCountLab.text = @"";
    }
}


- (NSMutableArray *)getPayWayArray {
        if (!_payWayArray) {
            _payWayArray = [NSMutableArray array];
            
            JCPayWayBall * hongbaoBall = [[JCPayWayBall alloc] init];
            hongbaoBall.title = @"红包抵扣";
            hongbaoBall.payWay = JCPayWayEnumHongbao;
            [_payWayArray addObject:hongbaoBall];
//
            //默认选中第一个
            JCPayWayBall * caiyunBall = [[JCPayWayBall alloc] init];
            caiyunBall.state_issel = YES;

            caiyunBall.payWay = JCPayWayEnumCaiyun;
            caiyunBall.title = @"红币余额";
            self.selPayWay = caiyunBall;
            [_payWayArray addObject:caiyunBall];
 


        }
    return _payWayArray;
}



- (JCHongbaoShowView *)hbPickerView {
    if (!_hbPickerView) {
        _hbPickerView = [JCHongbaoShowView new];
        _hbPickerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _hbPickerView;
}


- (UIView *)protocolView {
    if (!_protocolView) {
        _protocolView = [UIView new];
        _protocolView.backgroundColor = JCClearColor;
        _protocolView.hidden = YES;
    }
    return _protocolView;
}

- (UIButton *)sureProtocolBtn {
    if (!_sureProtocolBtn) {
        _sureProtocolBtn = [UIButton new];
        [_sureProtocolBtn setImage:JCIMAGE(@"protocol_select") forState:UIControlStateSelected];
        [_sureProtocolBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_sureProtocolBtn addTarget:self action:@selector(sureProtocolBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _sureProtocolBtn.selected = YES;
    }
    return _sureProtocolBtn;
}

- (YYLabel *)protocolLab {
    if (!_protocolLab) {
        _protocolLab = [YYLabel new];
        _protocolLab.textColor = COLOR_999999;
        _protocolLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];

    }
    return _protocolLab;
}
- (JCJingCaiAIBigDataBuyPriceView *)priceInfoView{
    if (!_priceInfoView) {
        _priceInfoView = [JCJingCaiAIBigDataBuyPriceView new];
        _priceInfoView.backgroundColor = JCWhiteColor;
    }
    return _priceInfoView;
}

- (JCJingCaiAIBigDataBuyInfoHeadView *)headView {
    if (!_headView) {
        _headView = [JCJingCaiAIBigDataBuyInfoHeadView new];
        
    }
    return _headView;
}
- (JCJingCaiAIBigDataSingleBuyInfoHeadView *)singleHeadView {
    if (!_singleHeadView) {
        _singleHeadView = [JCJingCaiAIBigDataSingleBuyInfoHeadView new];
    }
    return _singleHeadView;
}

- (UIView *)buyUserView {
    if (!_buyUserView) {
        _buyUserView = [UIView new];
    }
    return _buyUserView;
}

- (UILabel *)buyCountLab {
    if (!_buyCountLab) {
        _buyCountLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _buyCountLab;
}

@end
