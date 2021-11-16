//
//  JCMyBuyOrderTjDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongBangOrderDetailVC.h"
#import "JCMyBuyOrderTjDetailMatchCell.h"
#import "JCMyBuyOrderDataInfoCell.h"
#import "JCHongbangInfoTopCell.h"
#import "JCMyBuyOrderTtitleHeadView.h"
#import "JCHongbangOrderDetailModel.h"
#import "JCMyBuyOrderTjDetailMatchInfoCell.h"
#import "JCDakaBuyPayWayTopView.h"
@interface JCHongBangOrderDetailVC ()

@property (nonatomic,strong) JCHongbangOrderDetailModel *detailModel;

@end

@implementation JCHongBangOrderDetailVC

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
    [self refreshData];
}

- (void)refreshData {
    
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getOrderDetailWithOrder_id:self.order_id all_wl:self.all_wl wl:self.wl Success:^(id  _Nullable object) {
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
//    self.tableView.separatorStyle = 0;
    self.tableView.separatorInset = UIEdgeInsetsZero;
//    self.tableView.separatorColor = COLOR_F4F6F9;
    self.tableView.estimatedRowHeight = 100;

     [self.tableView registerClass:[JCMyBuyOrderTjDetailMatchInfoCell class] forCellReuseIdentifier:@"JCMyBuyOrderTjDetailMatchInfoCell"];
//    [self.tableView registerClass:[JCMyBuyOrderTjDetailMatchCell class] forCellReuseIdentifier:@"JCMyBuyOrderTjDetailMatchCell"];
    [self.tableView registerClass:[JCMyBuyOrderDataInfoCell class] forCellReuseIdentifier:@"JCMyBuyOrderDataInfoCell"];
   
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }
    if (section==1) {
        if (self.is_benefit) {
            return 4;
        }
        return 3;
    }

    
    return 4;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        cell.textLabel.text = self.detailModel.title;
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
        return cell;

    }
    

    JCMyBuyOrderDataInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMyBuyOrderDataInfoCell"];
    cell.contentLab.textColor = COLOR_2F2F2F;
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.titleLab.text = [self.type integerValue]==2?@"打赏金额":@"商品总价";
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
    }
    if (indexPath.section==2) {
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
            if (self.is_benefit==YES) {
                cell.titleLab.text = @"";
                cell.contentLab.text = @"";
            }
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
        if ([self.detailModel.hongbao_price integerValue]==0){
            return 0.001f;
        }
    }
    if (indexPath.section==2&&indexPath.row==2&&self.is_benefit) {
        return 0.001f;
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
        return headView;
    }
    return [UIView new];
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


@end
