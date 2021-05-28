//
//  JCHongbangOrderVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangOrderVC.h"
#import "JCBuyPlanPayWayCell.h"
#import "JCPayMethodManager.h"
#import "JCWMyHongbaoBall.h"
#import "JCWVerTjInfoMatchBall.h"
#import "JCHongbangMatchInfoCell.h"
#import "JCCommentCell.h"
#import "JCHongbangWMstckyVC.h"
#import "JCHHongbaoModel.h"
#import "JCHongbaoShowView.h"
#import "RBApplePayManager.h"
#import "WXPaymentBall.h"
#import "WXApiManager.h"
#import "JCHongbangDetailWMstckyVC.h"
#import "JCPayFreeView.h"
#import "JCChargeVC.h"
#import "JCHongbangDetailCommentCell.h"
#import "JCHongbangDetailOtherCell.h"
#import "JCHongbangCommomCell.h"
#import "JCFootBallBuyPlanEndBuyCell.h"
#import "JCHongbangOrderVC.h"
#import "JCHongbangOrderInfoCell.h"
#import "ProtocolViewController.h"
#import "JCHongbangPriceInfoView.h"
#import "JCHongbangInfoTopCell.h"
#import "JCDakaBuyPayWayTopView.h"
#import "JCHongbangBuylWMstckyVC.h"
#import "JCHongbangOrderWMstckyVC.h"
@interface JCHongbangOrderVC ()


@property (nonatomic, strong) JCHongbangPriceInfoView *priceInfoView;

@property (nonatomic,strong) NSMutableArray *payWayArray;

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

@property (nonatomic,strong) NSString *highest;

@end

@implementation JCHongbangOrderVC



- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    [self initViews];
    [self getUserInfo];
    [self loadDataInfo];
    [self getHongbaoList];
    [self getMyFreeCoupon];
//    [self loadTjDetailData];
}

- (void)getHongbaoList {
    WeakSelf;
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getMyHongbaoListWithType:@"1" ID:self.tjInfoDetailBall.id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
           NSArray *hongbaoArray = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCWMyHongbaoBall class]];
            if (hongbaoArray>0) {
                NSMutableArray *hongbao_Array = [NSMutableArray arrayWithArray:hongbaoArray];
                JCWMyHongbaoBall *hbModel = [JCWMyHongbaoBall new];
                hbModel.total = 0;
                [hongbao_Array insertObject:hbModel atIndex:0];
                self.hongbaoArray = [NSArray arrayWithArray:hongbao_Array];
                if (object[@"data"][@"recommend"]) {
                    self.useHbModel = (JCWMyHongbaoBall *)[JCWJsonTool entityWithJson:object[@"data"][@"recommend"] class:[JCWMyHongbaoBall class]];
                    [self caculatePrice];
                    for (JCWMyHongbaoBall *hmModel in self.hongbaoArray) {
                        if ([self.useHbModel.id integerValue]==[hmModel.id integerValue]) {
                            hmModel.is_select = YES;
                            break;
                        }
                    }
                }
                self.hbPickerView.dataArray = self.hongbaoArray;
            }
           
            NSString *highest =  object[@"data"][@"highest"];
            if ([highest integerValue]>0) {
                self.highest = [NSString stringWithFormat:@"%@",@([highest integerValue]/100.f)];
            }

            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
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
//获取我的免单券
- (void)getMyFreeCoupon {
    JCHomeService_New *service = [JCHomeService_New service];
    [service getMyFreeCouponWithType:@"1" ID:self.tjInfoDetailBall.id Success:^(id  _Nullable object) {
        [[UIApplication sharedApplication].keyWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
               self.mdModel = (JCWMyHongbaoBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWMyHongbaoBall class]];
            if (self.mdModel.id.length>0) {
                    [self payFree];
                    return;
                }
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];


}

- (void)initViews {
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60);
//    self.tableView.tableHeaderView = self.headView;
    

    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 1;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCHongbangOrderInfoCell class] forCellReuseIdentifier:@"JCHongbangOrderInfoCell"];
    [self.tableView registerClass:[JCBuyPlanPayWayCell class] forCellReuseIdentifier:@"JCBuyPlanPayWayCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-76);
    }];

    

    [self.view addSubview:self.priceInfoView];
    self.priceInfoView.frame = CGRectMake(0, SCREEN_HEIGHT-55-kBottomTabSafeAreaHeight-kNavigationBarHeight, SCREEN_WIDTH, 55+kBottomTabSafeAreaHeight);
 
//    [self.view addSubview:self.protocolView];
//    [self.protocolView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.priceInfoView.mas_top);
//        make.height.mas_equalTo(AUTO(32));
//    }];
    
//    [self.protocolView addSubview:self.protocolLab];
//    [self.protocolLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.centerX.equalTo(self.protocolView);
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
//        if ([hongbaoBall.id integerValue]==0) {
//            [weakSelf.payWayArray enumerateObjectsUsingBlock:^(JCPayWayBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                obj.state_issel = NO;
//
//            }];
//
//
//
//
//        }
        [weakSelf.tableView reloadData];
        [weakSelf caculatePrice];
//        weakSelf.redpacketLab.text = [NSString stringWithFormat:@"使用一张,抵扣¥%ld",hongbaoBall.prize/100];
    };
    
    

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    return self.payWayArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return UITableViewAutomaticDimension;
    }
 
    return AUTO(44);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0&&self.tjInfoDetailBall) {
        JCHongbangOrderInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangOrderInfoCell"];
        cell.infoModel = self.tjInfoDetailBall;
        cell.matchDataArray= self.matchDataArray;
        cell.lineView.hidden = YES;
        return cell;
    }
    if (indexPath.section==1) {
            JCBuyPlanPayWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBuyPlanPayWayCell"];
            JCPayWayBall *payWayball = self.payWayArray[indexPath.row];
            cell.payWayball = payWayball;
            if (indexPath.row==0) {
                if (self.highest.length>0) {
                    cell.infoLab.text = @"";
                    if (!self.useHbModel||[self.useHbModel.id integerValue]==0) {

                        cell.infoLab.text = [NSString stringWithFormat:@"最高可以抵扣%@元",self.highest];
                    }
                    if (self.hongbaoArray.count<0) {
                        cell.infoLab.text = @"暂无红包";
                    }
                   

                }else{

                    cell.infoLab.text = @"选择红包";
                    if (self.hongbaoArray.count<2) {
                        cell.infoLab.text = @"暂无红包";
                    }
                }
                if ([self.tjInfoDetailBall.is_use integerValue]==0) {
                    cell.infoLab.text = @"该方案不支持红包";
                }

//                }
                if (self.useHbModel) {
//                    cell.selHongbaoLab.text = [NSString stringWithFormat:@"已抵扣%ld红币",self.useHbModel.prize/100];
                    cell.infoLab.text = @"";
                    if ([self.useHbModel.id integerValue]>0) {
                        cell.selHongbaoLab.text = [NSString stringWithFormat:@"已抵扣%@红币",@(self.useHbModel.total/100)];
                    }else{
                        cell.selHongbaoLab.text = @"不使用红包";
                    }
                }else{
                    cell.selHongbaoLab.text = @"";
                }
            }
        JCWUserBall *user =[JCWUserBall currentUser];
        NSLog(@"当前多少%@",[JCWUserBall currentUser].prize);
        if (indexPath.row==1) {
            if ([self.useHbModel.id integerValue]==0) {
                if ([[JCWUserBall currentUser].prize integerValue]<[self.tjInfoDetailBall.sf integerValue]) {
                    cell.selHongbaoLab.text = @"";
                }else{
                    cell.selHongbaoLab.text = @"";
                }
            }else{
                NSInteger discountNum = self.useHbModel.prize/100;
                NSInteger payPrice = [self.tjInfoDetailBall.sf integerValue]-discountNum;//实际付款金额
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
        if (self.hongbaoArray.count<=1) {
            //没有红包不可点击
            return;
        }
        if ([self.tjInfoDetailBall.is_use intValue]==0) {
            [JCWToastTool showHint:@"该方案不支持使用红包"];
            return;
        }else{
            if (self.hongbaoArray.count==0) {
                [JCWToastTool showHint:@"您目前没有可使用红包"];
                return;
            }
        }
        [[UIApplication sharedApplication].keyWindow addSubview:self.hbPickerView];
        [self.hbPickerView show];
        
    }else{
        if (indexPath.row==1) {
            if ([self.useHbModel.id integerValue]>0) {
                NSInteger discountNum = self.useHbModel.prize/100;
                NSInteger payPrice = [self.tjInfoDetailBall.sf integerValue]-discountNum;//实际付款金额
                if ([[JCWUserBall currentUser].caiyun integerValue]<payPrice) {
                    return;
                }
            }else{
                if ([[JCWUserBall currentUser].caiyun integerValue]<[self.tjInfoDetailBall.sf integerValue]) {
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
    if (section==0) {
        return AUTO(8);
    }
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==1&&self.tjInfoDetailBall) {
        JCDakaBuyPayWayTopView *headView = [JCDakaBuyPayWayTopView new];
        headView.titleLab.text = @"购买方式";
        return headView;
    }
    return [UIView new];

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==1) {
        return 50;
    }
    return 0.001f;
}

#pragma mark --

- (void)caculatePrice {
    float needPayNum = [self.tjInfoDetailBall.sf floatValue]/100.0f;
    float discountNum = self.useHbModel.total/100;
    float price = 0;
    if (discountNum >= needPayNum) {
        price = 0;
    }else{
        price = needPayNum-discountNum;

    }
    NSNumber *number = [[NSNumber alloc] initWithFloat:price];
    NSString *money = [NSString stringWithFormat:@"%@",number];
    if (self.JCPriceBlock) {
        self.JCPriceBlock(money);
    }

}

- (void)sureBtnClick {
    
    if (!_sureProtocolBtn.selected) {
        [JCWToastTool showHint:@"请阅读“用户服务条款”并点击同意"];
        return ;
    }
    
    
    //已付费过,就直接查看
//    if ([self.mdModel.is_ff integerValue]==1||([self.is_pay integerValue]!=1&&self.is_pay)) {
//        JCHongbangDetailWMstckyVC *vc = [JCHongbangDetailWMstckyVC new];
//        vc.tjInfoId = self.expertID;
//        [self.navigationController pushViewController:vc animated:YES];
//        [self clearPopVC];
//        return;
//    }
    
    if (self.match_end) {
        [JCWToastTool showHint:@"方案购买时间已截止"];
        return;
    }
//    if (self.mdModel.id.length>0) {
//        [self payFree];
//        return;
//    }
    [self payAction];

}

- (void)payAction {
        NSInteger needPayNum = [self.tjInfoDetailBall.sf integerValue];
        NSInteger discountNum = self.useHbModel.total;

        
        NSInteger totalPrice = needPayNum-discountNum;
    if (totalPrice>0&&[[JCWUserBall currentUser].prize floatValue]<totalPrice) {
        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    
        if (self.selPayWay.payWay==JCPayWayEnumCaiyun) {
            [self caiyunPayWithAmount:totalPrice hongbaoId:self.useHbModel.id];
        }

}


- (void)payFree {
    JCPayFreeView *freeView = [JCPayFreeView new];
    freeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:freeView];
    freeView.beginTimeLab.text = [NSString stringWithFormat:@"领取日期:%@",self.mdModel.start_time];//self.mdModel.end_time
    freeView.endTimeLab.text = [NSString stringWithFormat:@"截止日期:%@",self.mdModel.end_time];
    @weakify(freeView);
    freeView.JCUseBlock = ^{
        NSLog(@"使用免费查看机会");
        @strongify(freeView);
         [freeView removeFromSuperview];
        [self.jcWindow showLoading];
        JCHomeService_New *service = [JCHomeService_New new];
        [service getConfirmOrderWithUnique:self.tjInfoDetailBall.id scene:@"4" source:@"1" Success:^(id  _Nullable object) {
            [self.jcWindow endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                NSString *order_key = object[@"data"][@"order_key"];
                [self finalPayWithOrder_key:order_key coupon_id:self.mdModel.id hongbao_id:@""];
    //            [self.tableView reloadData];

            }else{
                [JCWToastTool showHint:object[@"msg"]];
            }
            
        } failure:^(NSError * _Nonnull error) {
            [self.jcWindow endLoading];
        }];

        
    };
    
    freeView.JCCloseBlock = ^{
        @strongify(freeView);
        [freeView removeFromSuperview];
//        NSLog(@"不使用免费查看机会");
//        [self payAction];
    };
}

#pragma mark - 支付方法
//创建订单
- (void)caiyunPayWithAmount:(NSInteger)amount hongbaoId:(NSString *)hongbaoId {

    NSString *scene = @"4";
    if (self.tjInfoDetailBall.is_ai) {
        scene =@"5";
    }
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:self.tjInfoDetailBall.id scene:scene source:@"1" Success:^(id  _Nullable object) {
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
                WeakSelf;
                [JCTuiJianManager getTuiJianDetailWithTuiJianID:self.tjInfoDetailBall.id orderID:@"" type:@"" WithViewController:self is_push:NO success:^{
                    [weakSelf clearPopVC];
                }];
            }

            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
    
}


- (void)clearPopVC {
    NSMutableArray*tempMarr = [NSMutableArray arrayWithArray : self.navigationController.viewControllers];
//    [tempMarr removeObject:weakSelf];
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[JCHongbangBuylWMstckyVC class]]||[vc isKindOfClass:[JCHongbangOrderWMstckyVC class]]) {
            [tempMarr removeObject:vc];
        }
    }
    [self.navigationController setViewControllers:tempMarr animated:YES];
}

- (void)loadDataInfo {
//    _object = object;
    if (!self.tjInfoDetailBall) {
        return;
    }
    self.protocolView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(30));
    self.tableView.tableFooterView = self.protocolView;


        
//        self.object = object;
     self.priceInfoView.hidden = NO;
     self.protocolView.hidden = NO;
     [self getPayWayArray];//构建支付方式
    [self.tableView reloadData];

}

- (void)sureProtocolBtnClick {
    self.sureProtocolBtn.selected = !self.sureProtocolBtn.selected;
}


- (NSMutableArray *)getPayWayArray {
        if (!_payWayArray) {
            _payWayArray = [NSMutableArray array];
            
            JCPayWayBall * hongbaoBall = [[JCPayWayBall alloc] init];
            hongbaoBall.title = @"红包抵扣";
            hongbaoBall.payWay = JCPayWayEnumHongbao;
            
            //默认选中第一个
            JCPayWayBall * caiyunBall = [[JCPayWayBall alloc] init];
            
            caiyunBall.payWay = JCPayWayEnumCaiyun;
            caiyunBall.title = @"红币支付";
            caiyunBall.state_issel = YES;
            self.selPayWay = caiyunBall;//默认红币支付

            [_payWayArray addObject:hongbaoBall];
            [_payWayArray addObject:caiyunBall];


        }
    return _payWayArray;
}

//- (NSMutableArray *)payWayArray {
//
//    return _payWayArray;
//}

- (JCHongbaoShowView *)hbPickerView {
    if (!_hbPickerView) {
        _hbPickerView = [JCHongbaoShowView new];
        _hbPickerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _hbPickerView;
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

- (UIView *)protocolView {
    if (!_protocolView) {
        _protocolView = [UIView new];
//        _protocolView.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.15];
//        _protocolView.hidden = YES;
    }
    return _protocolView;
}

- (YYLabel *)protocolLab {
    if (!_protocolLab) {
        _protocolLab = [YYLabel new];
        _protocolLab.textColor = COLOR_999999;
        _protocolLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];

    }
    return _protocolLab;
}
- (JCHongbangPriceInfoView *)priceInfoView{
    if (!_priceInfoView) {
        _priceInfoView = [JCHongbangPriceInfoView new];
        _priceInfoView.hidden = YES;
    }
    return _priceInfoView;
}

@end
