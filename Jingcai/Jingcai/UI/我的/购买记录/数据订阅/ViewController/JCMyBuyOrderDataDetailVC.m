//
//  JCMyBuyOrderDataDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderDataDetailVC.h"
#import "JCMyBuyOrderDataHeadView.h"
#import "JCMyBuyOrderDataCommomCell.h"
#import "JCMyBuyOrderDataInfoCell.h"
#import "JCMyBuyOrderDataBuyCell.h"
#import "JCMyBuyOrderTtitleHeadView.h"
#import "JCBigDataOrderDetailModel.h"
#import "JCMyBuyOrderDataSingleHeadView.h"
#import "JCJingCaiAIBigDataBuyVC.h"
#import "JCDakaBuyPayWayTopView.h"
#import "JCPayShowView.h"
#import "JCChargeVC.h"
@interface JCMyBuyOrderDataDetailVC ()

@property (nonatomic,strong) JCMyBuyOrderDataHeadView *headView;

@property (nonatomic,strong) JCMyBuyOrderDataSingleHeadView *singleHeadView;

@property (nonatomic,strong) JCBigDataOrderDetailModel *detailModel;

@end

@implementation JCMyBuyOrderDataDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F4F6F9;
    self.title = @"订单详情";
    self.tableView.hidden = YES;
    [self refreshData];
}

- (void)refreshData {
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getOrderDetailWithOrder_id:self.order_id all_wl:@"" wl:@"" Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.detailModel = (JCBigDataOrderDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBigDataOrderDetailModel class]];
            self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(220));
            self.headView.detailModel = self.detailModel;
            self.tableView.tableHeaderView = self.headView;
            WeakSelf;
            self.headView.JCBuyBlock = ^{
                [weakSelf showPayView];
//                [weakSelf.navigationController pushViewController:[JCJingCaiAIBigDataBuyVC new] animated:YES];
            };


            [self.tableView reloadData];
            self.tableView.hidden = NO;
        }else{
            self.tableView.hidden = NO;
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        self.tableView.hidden = NO;
        [self endRefresh];
    }];

}
- (void)showPayView {
    WeakSelf;
    JCPayShowView *payView = [JCPayShowView new];
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
//确认购买
- (void)sureBuy {
    if ([self.detailModel.total_price floatValue]>0&&[[JCWUserBall currentUser].prize floatValue]<[self.detailModel.total_price floatValue]) {
        [JCWToastTool showHint:@"红币余额不足,请及时充值"];
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    NSString *scene = @"7";
    //1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5机构分歧 6.指数分歧
    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New new];
    [service getConfirmOrderWithUnique:self.detailModel.zucai_ai_set_id scene:scene source:@"1" price:@"" Success:^(id  _Nullable object) {
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
                [JCWToastTool showHint:@"购买成功"];
            }
//            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
}


- (void)initSubViews {
    self.tableView.separatorColor = COLOR_F0F0F0;
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(130));
    self.tableView.tableHeaderView = self.headView;
    [self.tableView registerClass:[JCMyBuyOrderDataCommomCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataCommomCell"];
    [self.tableView registerClass:[JCMyBuyOrderDataInfoCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataInfoCell"];
    [self.tableView registerClass:[JCMyBuyOrderDataBuyCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataBuyCell"];
    WeakSelf;
    self.singleHeadView.JCDetailBlock = ^{
        JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
        vc.model_id = @"1";
        vc.matchNum = weakSelf.detailModel.match_id;
        [ weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 3;
    }
    if (section==1) {

        return 0;
    }
    
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCMyBuyOrderDataInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyOrderDataInfoCell"];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.titleLab.text = @"商品原价";
            cell.contentLab.text = [NSString stringWithFormat:@"%@红币",@([self.detailModel.total_price floatValue])];

        }
        if (indexPath.row==1) {
            if ([self.detailModel.hongbao_price floatValue]>0) {
                 cell.titleLab.text = @"红包抵扣";
                  cell.contentLab.text = [NSString stringWithFormat:@"%@红币",@([self.detailModel.hongbao_price floatValue])];
             }else{
                 cell.titleLab.text = @"";
                 cell.contentLab.text = @"";
             }

         }

        if (indexPath.row==2) {
            cell.titleLab.text = @"实际付款";
            NSString *price = [NSString stringWithFormat:@"%@",@([self.detailModel.pay_price floatValue])];
            NSString *title = [NSString stringWithFormat:@"%@红币",price];
          NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
            NSRange range = [title rangeOfString:price];
          [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
          cell.contentLab.attributedText = attr;

        }
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.titleLab.text = @"生效时间";
            cell.contentLab.text = self.detailModel.start_time;
        }
        if (indexPath.row==1) {
            cell.titleLab.text = @"到期时间";
            cell.contentLab.text = self.detailModel.end_time;
        }
    }
    
    if (indexPath.section==2) {
        if (indexPath.row==0) {
            cell.titleLab.text = @"支付方式：";
            cell.contentLab.text = self.detailModel.pay_type_str;
        }
        if (indexPath.row==1) {
            cell.titleLab.text = @"付款时间：";
            cell.contentLab.text = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm:ss" time:[self.detailModel.pay_time doubleValue]];
        }
        if (indexPath.row==2) {
            cell.titleLab.text = @"订单编号：";
            cell.contentLab.text = self.detailModel.order_id;
        }
        if (indexPath.row==3) {
            cell.titleLab.text = @"订单状态：";
            if (self.detailModel.paid==2) {
                NSString *time = [NSString stringWithFormat:@"已退款(%@)",self.detailModel.refund_reason_time];
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:time];
                NSRange range = [time rangeOfString:@"已退款"];
                if (range.location!=NSNotFound) {
                    [attr addAttributes:@{NSForegroundColorAttributeName: COLOR_30B27A} range:range];
                }
                cell.contentLab.attributedText = attr;
            }else {
                cell.contentLab.text = @"正常";
            }

                }
    }


    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&indexPath.row==1) {
        if ([self.detailModel.hongbao_total integerValue]==0) {
            return 0.001f;
        }
    }

    return AUTO(45);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
         return AUTO(8);
    }
    if (section==2) {
        return AUTO(50);
    }
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        UIView *backView= [UIView new];
        backView.backgroundColor = COLOR_F4F6F9;
        return backView;
    }
    if (section==2) {
        JCDakaBuyPayWayTopView *headView = [JCDakaBuyPayWayTopView new];
        headView.backgroundColor = JCWhiteColor;
        headView.titleLab.text = @"订单信息";
        headView.lineView.hidden = YES;
        return headView;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==1) {
        return 0.001f;
    }
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (JCMyBuyOrderDataHeadView *)headView {
    if (!_headView) {
        _headView = [JCMyBuyOrderDataHeadView new];
    }
    return _headView;
}

- (JCMyBuyOrderDataSingleHeadView *)singleHeadView {
    if (!_singleHeadView) {
        _singleHeadView = [JCMyBuyOrderDataSingleHeadView new];
    }
    return _singleHeadView;
}

@end
