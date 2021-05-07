//
//  JCMyBuyOrderDataDetail_Single_VC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/4.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderDataDetail_Single_VC.h"
#import "JCMyBuyOrderDataHeadView.h"
#import "JCMyBuyOrderDataCommomCell.h"
#import "JCMyBuyOrderDataInfoCell.h"
#import "JCMyBuyOrderDataBuyCell.h"
#import "JCMyBuyOrderTtitleHeadView.h"
#import "JCBigDataOrderDetailModel.h"
#import "JCMyBuyOrderDataSingleHeadView.h"
#import "JCJingCaiAIBigDataBuyVC.h"
#import "JCMyBuyOrderTjDetailMatchInfoCell.h"
#import "JCDakaBuyPayWayTopView.h"
#import "JCMatchDetailWMStickVC.h"
@interface JCMyBuyOrderDataDetail_Single_VC ()

@property (nonatomic,strong) JCMyBuyOrderDataHeadView *headView;

@property (nonatomic,strong) JCMyBuyOrderDataSingleHeadView *singleHeadView;

@property (nonatomic,strong) JCBigDataOrderDetailModel *detailModel;

@end

@implementation JCMyBuyOrderDataDetail_Single_VC

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
    [service getOrderDetailWithOrder_id:self.order_id all_wl:self.wl wl:@"" Success:^(id  _Nullable object) {
        [self endRefresh];
        self.tableView.hidden = NO;
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.detailModel = (JCBigDataOrderDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCBigDataOrderDetailModel class]];
            [self.tableView reloadData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        self.tableView.hidden = NO;
        [self endRefresh];
    }];

}


- (void)initSubViews {
//    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorColor = COLOR_F0F0F0;
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(130));
//    self.tableView.tableHeaderView = self.headView;
    [self.tableView registerClass:[JCMyBuyOrderDataCommomCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataCommomCell"];
    [self.tableView registerClass:[JCMyBuyOrderDataInfoCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataInfoCell"];
    [self.tableView registerClass:[JCMyBuyOrderDataBuyCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataBuyCell"];
    [self.tableView registerClass:[JCMyBuyOrderTjDetailMatchInfoCell class] forCellReuseIdentifier:@"JCMyBuyOrderTjDetailMatchInfoCell"];
    
//    WeakSelf;
//    self.singleHeadView.JCDetailBlock = ^{
//        JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
//        vc.is_bigData = YES;
//        vc.matchNum = weakSelf.detailModel.match_id;
//        [ weakSelf.navigationController pushViewController:vc animated:YES];
//    };
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {

        return 1;
    }
    if (section==1) {

        return 3;
    }
    
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        JCMyBuyOrderTjDetailMatchInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyOrderTjDetailMatchInfoCell"];
        if (self.detailModel.match_data.count>0) {
            JCDianPingMatchBall *model = self.detailModel.match_data.firstObject;
            cell.model = model;
        }
        cell.bigDataModel = self.detailModel;
        WeakSelf;
        cell.JCDetailBlock = ^{
            JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
            vc.is_bigData = YES;
            vc.matchNum = weakSelf.detailModel.match_id;
            [ weakSelf.navigationController pushViewController:vc animated:YES];
        };
        return cell;
    }
    
    JCMyBuyOrderDataInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyOrderDataInfoCell"];
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.titleLab.text = @"商品总价";
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
    if (indexPath.section==2) {
        if (indexPath.row==0) {
            cell.titleLab.text = @"支付方式：";
            cell.contentLab.text = self.detailModel.pay_type_str;
        }
        if (indexPath.row==1) {
            cell.titleLab.text = @"付款时间：";
            cell.contentLab.text = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[self.detailModel.pay_time doubleValue]];
            ;
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
    if (indexPath.section==0) {
        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==1&&indexPath.row==1) {
    if ([self.detailModel.hongbao_total integerValue]==0){
        return 0.001f;
        }
    }


    return AUTO(45);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==2) {
        return AUTO(50);
    }
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
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
//    if (section==1&&[self.detailModel.style integerValue]==1) {
//        return 0.001f;
//    }
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
