//
//  JCWithDrawRecordDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWithDrawRecordDetailVC.h"
#import "JCWithDrawRecordItemCell.h"
#import "JCPostCheckRuleHeadView.h"
#import "JCPostCheckRuleTitleView.h"
#import "JCWithDrawRecordDetailHeadView.h"
#import "JCBaseTitleAlertView.h"
#import "JCMyGaoChouDetailModel.h"
@interface JCWithDrawRecordDetailVC ()

@property (nonatomic,strong) JCWithDrawRecordDetailHeadView *headView;

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UIButton *cancelBtn;

@property (nonatomic,strong) UIButton *surelBtn;

@property (nonatomic,strong) JCMyGaoChouDetailModel *model;



@end

@implementation JCWithDrawRecordDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"收入提现";
    [self initView];
    [self refreshData];
}

- (void)refreshData {
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getMyIncomeGaoChouDetaillWithsuccess:^(id  _Nullable object) {
        self.tableView.hidden = NO;
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCMyGaoChouDetailModel *model = (JCMyGaoChouDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCMyGaoChouDetailModel class]];
            self.model = model;
            self.headView.model = model;
            [self.tableView reloadData];
        }else{
            if ([object[@"code"] integerValue]) {
                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"提现规则" TitleColor:COLOR_333333 Mesasge:object[@"msg"] MessageColor:COLOR_666666 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
                    [alertView removeFromSuperview];
                }];
                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];
            }
            

        }
    } failure:^(NSError * _Nonnull error) {
        self.tableView.hidden = NO;
        [self.view endLoading];
    }];

}

- (void)initView {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(140));
    
    self.tableView.backgroundColor = COLOR_F0F0F0;
    self.tableView.hidden = YES;
    self.tableView.tableHeaderView = self.headView;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCWithDrawRecordItemCell class] forCellReuseIdentifier:@"JCWithDrawRecordItemCell"];

    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(80));
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom);
        make.height.mas_equalTo(AUTO(80));
    }];
    
    [self.bottomView addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomView.mas_centerX).offset(AUTO(-15));
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(128), AUTO(44)));
    }];
    
    [self.bottomView addSubview:self.surelBtn];
    [self.surelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView.mas_centerX).offset(AUTO(15));
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(128), AUTO(44)));
    }];

}
- (void)withdrawalAction {
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New service];
    [service getUserWithdrawalActionWithsuccess:^(id  _Nullable object) {
        
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
            [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:@"已成功提交提现申请\n审核通过后，将在10号统一转账至指定账户，请耐心等待" MessageColor:COLOR_666666 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
                if (self.JCRefreshBlock) {
                    self.JCRefreshBlock();
                }
                [alertView removeFromSuperview];
                [self.navigationController popViewControllerAnimated:YES];
            }];
            alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];

        
    }];


}
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.titleArray[section];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    NSArray *array = self.titleArray[indexPath.section];
    if (indexPath.section==0) {
        JCWithDrawRecordItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCWithDrawRecordItemCell"];
        cell.selectionStyle = 0;
        cell.showAttr = NO;
        cell.contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
         cell.titleLabel.text = array[indexPath.row];
        if (indexPath.row==0&&[self.model.base_pay floatValue]>0) {
            cell.content = self.model.base_pay;
            return cell;
        }
        if (indexPath.row==1&&[self.model.basic_remuneration floatValue]>0) {
            cell.content = self.model.basic_remuneration;
            return cell;
        }
        if (indexPath.row==2) {
            cell.content = self.model.ios;
            return cell;
        }
        if (indexPath.row==3) {
            cell.content = self.model.android;
            return cell;
        }
        if (indexPath.row==4) {

            cell.content = self.model.h5;
            return cell;
        }
        if (indexPath.row==5) {

            cell.content = self.model.pc;
            return cell;
        }

        if (indexPath.row==6&&[self.model.full_work_attendance floatValue]>0) {
            cell.content = self.model.full_work_attendance;
            return cell;
        }
        if (indexPath.row==7&&[self.model.ds_money floatValue]>0) {
            cell.content = self.model.ds_money;
            return cell;
        }
        

    }
    if (indexPath.section==1) {
            JCWithDrawRecordItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCWithDrawRecordItemCell"];
        cell.showAttr = NO;
        cell.titleLabel.text = array[indexPath.row];

            if (indexPath.row==0) {
                cell.content = self.model.remuneration_total;
            }
            if (indexPath.row==1) {
                if ([self.model.tax_revenue floatValue]>0) {
//                    self.model.tax_revenue = [NSString stringWithFormat:@"%@",self.model.tax_revenue];
                    cell.contentLabel.text = [NSString stringWithFormat:@"-¥%.2f",[self.model.tax_revenue floatValue]];
                }else{
                    cell.content= self.model.tax_revenue;
                }
               
            }
            if (indexPath.row==2) {
                cell.showAttr = YES;
                cell.content = self.model.total;
                cell.contentLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(20)];
            }
        
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (indexPath.row==0&&[self.model.base_pay floatValue]==0) {
            return 0;
        }
        if (indexPath.row==1&&[self.model.basic_remuneration floatValue]==0) {
            return 0;
        }
//        if (indexPath.row==2) {
//            return 0;
//        }
//        if (indexPath.row==3) {
//            return 0;
//        }
//        if (indexPath.row==4) {
//
//            return 0;
//        }

        if (indexPath.row==6&&[self.model.full_work_attendance floatValue]==0) {
            return 0;
        }
        if (indexPath.row==7&&[self.model.ds_money floatValue]==0) {
            return 0;
        }
    }
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0) {
        return AUTO(8);
    }
    return 0.0001;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {

    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F0F0F0;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}



- (void)cancelBtnClick {
    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
    [alertView alertTitle:@"" TitleColor:COLOR_333333 Mesasge:[NSString stringWithFormat:@"若对收益有异议，\n请联系官方客服%@\n若不愿提现，提现将自动顺延至下个月，将可能导致代缴个税提高，请知悉",[JCConfigModel currentConfigModel].customer] MessageColor:COLOR_666666 ComfirmTitle:@"知道了" ComfirmColor:JCBaseColor confirmHandler:^{
        
        [alertView removeFromSuperview];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}

- (JCWithDrawRecordDetailHeadView *)headView {
    if (!_headView) {
        _headView = [JCWithDrawRecordDetailHeadView new];
    }
    return _headView;
}



- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@[@"基本工资",@"基本稿酬",@"iOS端提成",@"安卓端提成",@"H5端提成",@"网页端提成",@"满勤奖",@"用户打赏"],@[@"稿酬总计",@"代缴个人所得税",@"可提现"]];
    }
    return _titleArray;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = COLOR_F0F0F0;
    }
    return _bottomView;
}
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton initWithText:@"取消" FontSize:AUTO(16) Weight:1 BackGroundColor:JCWhiteColor TextColors:JCBaseColor];
        _cancelBtn.layer.borderColor = JCBaseColor.CGColor;
        _cancelBtn.layer.borderWidth = 1;
        _cancelBtn.layer.cornerRadius = AUTO(22);
        _cancelBtn.layer.masksToBounds = YES;
        [_cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

- (UIButton *)surelBtn {
    if (!_surelBtn) {
        _surelBtn = [UIButton initWithText:@"确认提现" FontSize:AUTO(16) Weight:1 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_surelBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_surelBtn addTarget:self action:@selector(withdrawalAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _surelBtn;
}

@end
