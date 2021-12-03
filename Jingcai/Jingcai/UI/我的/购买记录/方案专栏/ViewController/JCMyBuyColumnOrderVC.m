//
//  JCMyBuyColumnOrderVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMyBuyColumnOrderVC.h"
#import "JCMyBuyOrderDataHeadView.h"
#import "JCMyBuyOrderDataCommomCell.h"
#import "JCMyBuyOrderDataInfoCell.h"
#import "JCMyBuyOrderTtitleHeadView.h"
#import "JCBigDataOrderDetailModel.h"
#import "JCMyBuyOrderDataSingleHeadView.h"
#import "JCJingCaiAIBigDataBuyVC.h"
#import "JCMyBuyOrderTjDetailMatchInfoCell.h"
#import "JCDakaBuyPayWayTopView.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCColumnDetailTopView.h"
@interface JCMyBuyColumnOrderVC ()

@property (nonatomic,strong) JCHongbangOrderDetailModel *detailModel;

@property (nonatomic,strong) JCColumnDetailTopView *headView;

@end

@implementation JCMyBuyColumnOrderVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F4F6F9;
    self.tableView.hidden = YES;
    self.title = @"订单详情";
    [self getTopInfo];
    [self refreshData];
}

- (void)getTopInfo {

    JCColumnService *service = [JCColumnService new];
    [service getColumnDetailTopInfoWithID:NonNil(self.column_id) Period_id:self.period_id WithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCColumnDetailModel *detailModel = (JCColumnDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCColumnDetailModel class]];
            self.headView.detailModel = detailModel;
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];

}

- (void)refreshData {
    
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getOrderDetailWithOrder_id:self.order_id all_wl:@"" wl:@"" Success:^(id  _Nullable object) {
        [self endRefresh];
        self.tableView.hidden = NO;
        if ([JCWJsonTool isSuccessResponse:object]) {
            if ([JCWJsonTool isSuccessResponse:object]) {
                self.detailModel = (JCHongbangOrderDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCHongbangOrderDetailModel class]];
                self.tableView.hidden = NO;
                [self.tableView reloadData];
            }else{
                self.tableView.hidden = NO;
                [JCWToastTool showHint:object[@"msg"]];
            }
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        self.tableView.hidden = NO;
        [self endRefresh];
    }];

}


- (void)initSubViews {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(126));
    self.tableView.tableHeaderView = self.headView;
//    self.tableView.separatorStyle = 0;
    self.tableView.separatorInset = UIEdgeInsetsZero;
//    self.tableView.separatorColor = COLOR_F4F6F9;
    self.tableView.estimatedRowHeight = 100;

     [self.tableView registerClass:[JCMyBuyOrderTjDetailMatchInfoCell class] forCellReuseIdentifier:@"JCMyBuyOrderTjDetailMatchInfoCell"];
//    [self.tableView registerClass:[JCMyBuyOrderTjDetailMatchCell class] forCellReuseIdentifier:@"JCMyBuyOrderTjDetailMatchCell"];
    [self.tableView registerClass:[JCMyBuyOrderDataInfoCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataInfoCell"];
   
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {

        return 3;
    }

    
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    


    JCMyBuyOrderDataInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyOrderDataInfoCell"];
    cell.contentLab.textColor = COLOR_2F2F2F;
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.titleLab.text = @"商品原价";
            cell.contentLab.text = [NSString stringWithFormat:@"%@红币",@([self.detailModel.total_price floatValue])];

        }
        if (indexPath.row==1) {
            if ([self.detailModel.hongbao_price integerValue]>0) {
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
        if (indexPath.row==3) {
            cell.titleLab.text = @"提成金额";
            NSString *price = [NSString stringWithFormat:@"%@",@([self.detailModel.commission floatValue])];
            NSString *title = [NSString stringWithFormat:@"%@红币",price];
          NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
            NSRange range = [title rangeOfString:price];
          [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
          cell.contentLab.attributedText = attr;

         }
        return cell;
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.titleLab.text = @"支付方式：";
            cell.contentLab.text = self.detailModel.pay_type_str;
        }
        if (indexPath.row==1) {
            cell.titleLab.text = @"付款时间：";
            cell.contentLab.text =  self.detailModel.get_pay_time;
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
        return cell;
    }
    UITableViewCell *commomCell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

    return commomCell;

    
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0&&indexPath.row==1) {
        if ([self.detailModel.hongbao_price integerValue]==0){
            return 0.001f;
        }
    }


    return AUTO(45);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return AUTO(8);
    }
    if (section==1) {
        return AUTO(40);
    }
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (section==1) {
        JCDakaBuyPayWayTopView *headView = [JCDakaBuyPayWayTopView new];
        headView.lineView.hidden = YES;
        headView.backgroundColor = JCWhiteColor;
        headView.titleLab.text = @"订单信息";
        return headView;
    }
    UIView *headView =  [UIView new];
    headView.backgroundColor = COLOR_F0F0F0;
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (JCColumnDetailTopView *)headView {
    if (!_headView) {
        _headView = [JCColumnDetailTopView new];
    }
    return _headView;
}
@end
