//
//  JCDakaBuyPlanVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaBuyPlanVC.h"
#import "JCDakaBuyPlanHeadView.h"
#import "JCFootBallBuyPlaneFootView.h"
#import "JCBuyPlanLock_GZH_Cell.h"
#import "JCBuyPlanPayWayCell.h"
#import "JCPayMethodManager.h"
#import "JCWMyHongbaoBall.h"
#import "CountDown.h"
#import "WXPaymentBall.h"
#import "WXApiManager.h"
#import "JCDakaPlanDetailStickWMVC.h"
#import "JCChargeVC.h"
#import "JCDakaBuyPayWayTopView.h"
#import "JCDakaBuyPlanProtocolCell.h"
#import "JCPayFreeView.h"
#import "JCBaseTitleAlertView.h"
#import "JCFamousExpertCell.h"
#import "JCFanganSaleOut_BuyCell.h"
#import "JCColumnDetailWMViewController.h"
@interface JCDakaBuyPlanVC ()

@property (nonatomic,strong) JCDakaBuyPlanHeadView *headView;

@property (nonatomic,strong) JCFootBallBuyPlaneFootView *footView;

@property (nonatomic,strong) UIButton *sureProtocolBtn;

@property (nonatomic,strong) NSMutableArray *payWayArray;

@property (strong, nonatomic) CountDown *countDown;

@property (nonatomic,strong) JCPayWayBall *selPayWay;

@property (nonatomic,strong) JCWMyHongbaoBall *mdModel;//免单券

@property (nonatomic,assign) BOOL match_end;//比较已结束,不可购买

@property (nonatomic,assign) double time_distance;

@property (nonatomic,strong) NSString *highest;//可用的最大额红包

@property (nonatomic,assign) BOOL is_saleOut;//已下架


@end

@implementation JCDakaBuyPlanVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.is_saleOut = YES;
    if ([self.payInfoModel.status integerValue]==8) {
        //payInfoModel.status ==8 表示需要展示已下载
        self.is_saleOut = YES;
    }
    [self initViews];
    [self getUserInfo];
    [self getHongbaoList];
    [self getMyFreeCoupon];



    if (self.payInfoModel.is_end==1||self.is_saleOut) {
        [self getTuiJianList];
    }else {
        if (!self.is_saleOut) {
            [self getPeoPleList];
        }
       
    }
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.countDown destoryTimer];
}

- (void)initViews {
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.bottom.right.equalTo(self.view);
    }];
    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(85));
//    self.headView.payInfoModel = self.payInfoModel;
//    self.tableView.tableHeaderView= self.headView;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorStyle = 0;
    
    [self.tableView registerClass:[JCBuyPlanLock_GZH_Cell class] forCellReuseIdentifier:@"JCBuyPlanLock_GZH_Cell"];
    [self.tableView registerClass:[JCBuyPlanPayWayCell class] forCellReuseIdentifier:@"JCBuyPlanPayWayCell"];
    [self.tableView registerClass:[JCDakaBuyPlanProtocolCell class] forCellReuseIdentifier:@"JCDakaBuyPlanProtocolCell"];
    [self.tableView registerClass:[JCFamousExpertCell class] forCellReuseIdentifier:@"JCFamousExpertCell"];
    [self.tableView registerClass:[JCFanganSaleOut_BuyCell class] forCellReuseIdentifier:@"JCFanganSaleOut_BuyCell"];
    
    
    
    self.hbPickerView.dataArray = self.hongbaoArray;
    WeakSelf;
    self.hbPickerView.hbPickerSelBlock = ^(JCWMyHongbaoBall * _Nullable hongbaoBall) {
        weakSelf.useHbModel = hongbaoBall;
        [weakSelf.tableView reloadData];
        [weakSelf caculatePrice];
    };
    
 
    self.time_distance = [self.payInfoModel.end_time doubleValue]-[self.payInfoModel.now_time doubleValue];
    if (self.payInfoModel.is_look.length>0&&[self.payInfoModel.is_look integerValue]==0) {
        self.time_distance = 0;
    }

    self.countDown = [[CountDown alloc] init];
    ///每秒回调一次
    [self.countDown countDownWithPER_SECBlock:^{
        NSLog(@"6");
        [weakSelf updateTimeInVisibleCells];

    }];

   
    self.footView.JCMoreBlock = ^{
        [weakSelf getPeoPleList];
    };
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.tuijianArray.count>0) {
        return 2+self.tuijianArray.count;
    }
    if (self.tuijianArray.count==0&&self.is_saleOut) {
        return 2;
    }
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    if (section==1) {
        if (self.tuijianArray.count>0){
            return 0;
        }
        if (self.is_saleOut) {
            return 0;
        }
        return self.payWayArray.count;
    }


    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0){
        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==1){
        return AUTO(44);
    }

    if (indexPath.section==2) {
        if (self.tuijianArray.count==0) {
            
            return AUTO(44);
        }
    }
    return UITableViewAutomaticDimension;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    if (indexPath.section==0) {
        if (self.is_saleOut) {
            JCFanganSaleOut_BuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCFanganSaleOut_BuyCell"];
            cell.payInfoModel = self.payInfoModel;
            return cell;
        }
        JCBuyPlanLock_GZH_Cell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCBuyPlanLock_GZH_Cell"];
//        cell.infoLab.hidden = NO;
        cell.payInfoModel = self.payInfoModel;
        WeakSelf;
        cell.JCBlock = ^{
            JCColumnDetailWMViewController *vc = [JCColumnDetailWMViewController new];
            vc.column_id = weakSelf.payInfoModel.column_info.id;
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        };
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
                if (self.hongbaoArray.count<2) {
                    cell.infoLab.text = @"暂无优惠券";
                    cell.selHongbaoLab.textColor = COLOR_9F9F9F;
                    cell.selHongbaoLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
                }
               

            }else{

//                cell.infoLab.text = @"选择红包";
                if (self.hongbaoArray.count<2) {
                    cell.infoLab.text = @"暂无优惠券";
                    cell.selHongbaoLab.textColor = COLOR_9F9F9F;
                    cell.selHongbaoLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
                }
            }
            if (self.payInfoModel.is_use==0) {
                cell.infoLab.text = @"该方案不支持优惠券";
                cell.selHongbaoLab.textColor = COLOR_9F9F9F;
                cell.selHongbaoLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
            }
            if (self.useHbModel) {
                cell.infoLab.text = @"";
                if ([self.useHbModel.id integerValue]>0) {
                    cell.selHongbaoLab.text = [NSString stringWithFormat:@"已抵扣%@红币",@(self.useHbModel.total/100.0f)];
                    cell.selHongbaoLab.textColor = COLOR_2F2F2F;
                    cell.selHongbaoLab.font =  [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)];


                }else{

                    cell.selHongbaoLab.text = @"不使用优惠券";
                    cell.selHongbaoLab.textColor = COLOR_9F9F9F;
                    cell.selHongbaoLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
                }
               
            }else{
                cell.selHongbaoLab.text = @"";
                cell.selHongbaoLab.textColor = COLOR_9F9F9F;
                cell.selHongbaoLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
            }
        }else{
            cell.selHongbaoLab.text = @"";
            cell.selHongbaoLab.textColor = COLOR_9F9F9F;
            cell.selHongbaoLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        }
        return cell;
    }
    if (self.tuijianArray.count==0) {
        JCDakaBuyPlanProtocolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDakaBuyPlanProtocolCell"];
        self.sureProtocolBtn = cell.sureProtocolBtn;
        return cell;
    }
    
    JCFamousExpertCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCFamousExpertCell"];
    if(self.tuijianArray.count>0){
        JCWTjInfoBall *model = self.tuijianArray[indexPath.section-2];
        cell.model = model;
    }

    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==1) {
        
        if (indexPath.row==0) {
            if (self.hongbaoArray.count<2) {
                //没有红包不可点击
                return;
            }
            
            
            if (self.payInfoModel.is_use==1) {
                [[UIApplication sharedApplication].keyWindow addSubview:self.hbPickerView];
                [self.hbPickerView show];
            }else{
//                [JCWToastTool showHint:@"该方案不支持使用红包"];
            }

            
        }else{
            [self.payWayArray enumerateObjectsUsingBlock:^(JCPayWayBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.state_issel = NO;
            }];
            JCPayWayBall *payWayBall = self.payWayArray[indexPath.row];
            payWayBall.state_issel = YES;
            self.selPayWay = payWayBall;
            [self.tableView reloadData];
        }

    }
    if (indexPath.section>1&&self.tuijianArray.count>0) {

        if (![JCWUserBall currentUser]) {
            [self presentLogin];
            return ;
        }
        JCWTjInfoBall *model = self.tuijianArray[indexPath.section-2];
        [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:model.id orderID:@"" type:@"" WithViewController:self is_push:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    if (section==0) {
        return AUTO(4);
    }
    if (section==1) {
        if (self.tuijianArray.count>0) {
            return 0.01f;
        }
        return AUTO(4);
    }
    if (section==2) {
        if (self.tuijianArray.count==0) {
            return 0.01f;
        }
    }
    
    return AUTO(4);
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F4F6F9;
    return view;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section==1) {
        if (self.tuijianArray.count>0) {
            UIView *view = [UIView new];
            UILabel *titleLab = [UILabel initWithTitle:@"热门方案推荐" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
            titleLab.frame = CGRectMake(AUTO(15), 10, SCREEN_WIDTH, 30);
            [view addSubview:titleLab];
            return view;
        }
        if (!self.is_saleOut) {
            JCDakaBuyPayWayTopView *headView = [JCDakaBuyPayWayTopView new];
            headView.titleLab.text = @"购买方式";
            return headView;
        }
        


     
    }
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F4F6F9;
    return view;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return AUTO(4);
    }
    if (section==1) {
//        if (self.tuijianArray.count==0) {
//            return 0.01f;
//        }
        if (self.is_saleOut&&self.tuijianArray.count==0) {
            return 0.01f;
        }
        return 50;
        
    }
    return 0.001f;
}

#pragma mark

- (void)sureBtnClick {
    
    if (self.match_end) {
        [JCWToastTool showHint:@"方案购买时间已截止"];
        return;
    }
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"JCFanganAgree"]) {
        [JCWToastTool showHint:@"请阅读《鲸猜足球用户购买协议》并点击同意"];
        [self.tableView scrollToBottomAnimated:YES];
        return ;
    }
    
//    if (!self.sureProtocolBtn.selected) {
//        [JCWToastTool showHint:@"请阅读《鲸猜足球用户购买协议》并点击同意"];
////        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
//        [self.tableView scrollToBottomAnimated:YES];
//        return ;
//    }
    
    
    NSInteger needPayNum = [self.payInfoModel.sf integerValue];
    NSInteger discountNum = 0;
    if (self.useHbModel.total>0) {
        discountNum = self.useHbModel.total;
    }
  
    NSInteger totalPrice = needPayNum-discountNum;
    
    if (totalPrice>0&&[[JCWUserBall currentUser].prize floatValue]<totalPrice) {

        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
    [alertView alertTitle:@"提示" TitleColor:COLOR_2F2F2F Mesasge:@"是否确认支付?" MessageColor:COLOR_666666 SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
        [alertView removeFromSuperview];
        if (self.selPayWay.payWay==JCPayWayEnumCaiyun) {
            [self caiyunPayWithAmount:totalPrice hongbaoId:self.useHbModel.id];
        }

        
    } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
       [alertView removeFromSuperview];
    }];
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    


}



#pragma mark - 支付方法
//创建订单

- (void)caiyunPayWithAmount:(NSInteger)amount hongbaoId:(NSString *)hongbaoId {

    NSString *scene = @"2";

    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:self.payInfoModel.id scene:scene source:@"1" price:@"" Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *order_key = object[@"data"][@"order_key"];
            [self finalPayWithOrder_key:order_key coupon_id:@"" hongbao_id:hongbaoId];

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
                [JCWToastTool showHint:@"支付成功"];
                [JCTuiJianManager loadGZH_ArticleDetailWithArticleID:self.payInfoModel.id orderID:@"" type:@"" WithViewController:self is_push:YES];
            }

            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
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
        NSString *scene = @"2";
        JCHomeService_New *service = [JCHomeService_New new];
        [service getConfirmOrderWithUnique:self.payInfoModel.id scene:scene source:@"1" price:@"" Success:^(id  _Nullable object) {
            [self.jcWindow endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                NSString *order_key = object[@"data"][@"order_key"];
                [self finalPayWithOrder_key:order_key coupon_id:self.mdModel.id hongbao_id:@""];

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

//获取我的免单券
- (void)getMyFreeCoupon {
    JCHomeService_New *service = [JCHomeService_New service];
    [service getMyFreeCouponWithType:@"2" ID:self.payInfoModel.id Success:^(id  _Nullable object) {
        [[UIApplication sharedApplication].keyWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
               self.mdModel = (JCWMyHongbaoBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWMyHongbaoBall class]];
            if (self.mdModel.id.length>0&&self.time_distance>0) {
                if (!self.match_end) {
                    //购买未截止时,再显示免单券
                    [self payFree];
                }
                    return;
                }
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];


}

- (void)getHongbaoList {
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getMyHongbaoListWithType:@"2" ID:self.payInfoModel.id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray* hongbaoArray = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCWMyHongbaoBall class]];
            if (hongbaoArray.count>0) {
                NSMutableArray *hongbao_Array = [NSMutableArray arrayWithArray:hongbaoArray];
                JCWMyHongbaoBall *hbModel = [JCWMyHongbaoBall new];
                hbModel.total = 0;
                [hongbao_Array insertObject:hbModel atIndex:0];
                self.hongbaoArray = [NSArray arrayWithArray:hongbao_Array];
                
                
                if (object[@"data"][@"recommend"]) {

                    if (self.payInfoModel.is_end==0) {
                        self.useHbModel = (JCWMyHongbaoBall *)[JCWJsonTool entityWithJson:object[@"data"][@"recommend"] class:[JCWMyHongbaoBall class]];
                    }
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

- (void)getPeoPleList {

    if (!self.payInfoModel) {
        return;
    }
    @weakify(self);
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New service];
    [service getPlanLookWithTuijian_id:self.payInfoModel.id Page:self.pageNo success:^(id  _Nullable object) {
        @strongify(self);
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"brown_info"] class:[JCPlanBuyPersonModel class]];
            NSString *number = [NSString stringWithFormat:@"%@",object[@"data"][@"brown_num"]];
            [self.dataArray addObjectsFromArray:array];
            
            if (array.count>0) {
                float width = (SCREEN_WIDTH-AUTO(10))/8.0f;
                float height = ceil(self.dataArray.count/8.0)*width+AUTO(120);
                self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
                self.footView.dataArray = self.dataArray;
                self.tableView.tableFooterView = self.footView;



            }

            
            [self.tableView reloadData];
            self.pageNo++;
            if (array.count==24) {
                self.footView.moreBtn.hidden = NO;
            }else {
                self.footView.moreBtn.hidden = YES;
            }
            
            NSString *count = [NSString stringWithFormat:@"该文章已有%@人查看",number];
            
            NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:count];
            if (number.length>0) {
                NSRange range = [count rangeOfString:number];
                [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(18)] range:range];
                [attrString addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
                self.footView.countLab.attributedText = attrString;
            }

            
        }
    } failure:^(NSError * _Nonnull error) {
        self.footView.moreBtn.hidden = YES;
        [self endRefresh];
    }];


}

- (void)getTuiJianList {
    JCHomeService_New *service = [JCHomeService_New service];
    [service getGZHT_TuijianListWithUserid:self.payInfoModel.user_id Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {

            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCWTjInfoBall class]];
            self.tuijianArray = [NSMutableArray arrayWithArray:array];
            if (self.tuijianArray.count==0) {
                [self getPeoPleList];
            }
            [self.tableView reloadData];
            
        }
    } failure:^(NSError * _Nonnull error) {
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




- (void)caculatePrice {
    
    float needPayNum = [self.payInfoModel.sf floatValue]/100.0f;
    float discountNum = self.useHbModel.total/100.0f;
    float price = 0;
    if (discountNum >= needPayNum) {
        price = 0;
    }else{
        price = needPayNum-discountNum;

    }
    NSNumber *number = [[NSNumber alloc] initWithFloat:price];
    NSString *money = [NSString stringWithFormat:@"%@",number];

    if (price<=0) {
        if (self.JCPirceBlock) {
            self.JCPirceBlock(@"0");
        }
    }else{

        if (self.JCPirceBlock) {

            self.JCPirceBlock(money);
        }
    }
}

-(void)updateTimeInVisibleCells{
    if (self.is_saleOut) {
        //下架
        [self.countDown destoryTimer];
    }

    
    NSArray  *cells = self.tableView.visibleCells; //取出屏幕可见ceLl
    for (UITableViewCell *cell in cells) {
        if ([cell isKindOfClass:[JCBuyPlanLock_GZH_Cell class]]) {

            NSDictionary *dic = [self getNowTimeWithString:self.time_distance];
            JCBuyPlanLock_GZH_Cell *timeCell = (JCBuyPlanLock_GZH_Cell *)cell;
            if (self.time_distance<=0) {
                timeCell.timeLab.text = @"00:00:00";
//                return;
                if (self.JCEndBlock) {
                    self.JCEndBlock(YES);
                }
                [self.countDown destoryTimer];
            }

            timeCell.timeLab.text = [NSString stringWithFormat:@"%@:%@:%@",dic[@"hours"],dic[@"minutes"],dic[@"seconds"]];

            if (self.time_distance>0) {
                self.time_distance--;
            }else{
                timeCell.timeLab.text = @"00:00:00";
            }

        }

    }

}

-(NSDictionary *)getNowTimeWithString:(int )aTimeString{
    
//    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
//    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
////    [formater setDateFormat:@"yyyy-MM-dd"];
////    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[aTimeString longValue]];
////    NSString *dateString = [formater stringFromDate:date];
//    // 截止时间date格式
//    NSString  *expireStr = [NSDate wholeTimeStringWithInterval:[aTimeString longValue]];
//    NSDate  *expireDate = [formater dateFromString:expireStr];
////    NSDate *expireDate = [NSDate dateWithTimeIntervalSince1970:[aTimeString longValue]];
//    NSDate  *nowDate = [NSDate date];
//    // 当前时间字符串格式
//    NSString *nowDateStr = [formater stringFromDate:nowDate];
//    // 当前时间date格式
//    nowDate = [formater dateFromString:nowDateStr];
//
//    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
//    NSTimeInterval timeInterval  = [aTimeString longLongValue];
    
    int  timeInterval = aTimeString;
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    if (hours<10) {
        hoursStr = [NSString stringWithFormat:@"%02d",hours+days*24];
    }else{
        hoursStr = [NSString stringWithFormat:@"%d",hours+days*24];
    }

   //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"%02d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"%02d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (days<=0&hours<=0&&minutes<=0&&seconds<=0) {
        hoursStr = @"00";
        minutesStr = @"00";
        secondsStr = @"00";
        self.match_end = YES;
//        return @"活动已经结束！";
         [self.countDown destoryTimer];
    }
    if (days) {
        
    }
    return @{@"hours":hoursStr,@"minutes":minutesStr,@"seconds":secondsStr};
}

-(void)dealloc{
    [self.countDown destoryTimer];

}

- (JCDakaBuyPlanHeadView *)headView {
    if (!_headView) {
        _headView = [JCDakaBuyPlanHeadView new];
//        [_headView hg_setCornerOnTopWithRadius:AUTO(15)];
    }
    return _headView;
}

- (JCFootBallBuyPlaneFootView *)footView {
    if (!_footView) {
        _footView = [JCFootBallBuyPlaneFootView new];
    }
    return _footView;
}


- (NSMutableArray *)payWayArray {
    if (!_payWayArray) {
        _payWayArray = [NSMutableArray array];
        
        JCPayWayBall * hongbaoBall = [[JCPayWayBall alloc] init];
        hongbaoBall.title = @"红包抵扣";
        hongbaoBall.payWay = JCPayWayEnumHongbao;
        
        
        //默认选中第一个
        JCPayWayBall * caiyunBall = [[JCPayWayBall alloc] init];
        caiyunBall.state_issel = YES;
        caiyunBall.payWay = JCPayWayEnumCaiyun;
        caiyunBall.title = @"红币支付";
        self.selPayWay= caiyunBall;


        [_payWayArray addObject:hongbaoBall];
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

@end
