//
//  JCPayShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPayShowView.h"

@implementation JCPayShowView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(AUTO(0));
        make.height.mas_equalTo(AUTO(330)+kBottomTabSafeAreaHeight);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"请选择支付方式" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(20));
        make.centerX.equalTo(self);
    }];
    
    [self.bgView addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(titleLab);
        make.width.height.mas_equalTo(AUTO(50));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(17));
        make.height.mas_equalTo(0.5);
    }];
    
    [self.bgView addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(17));
        make.left.right.equalTo(self.bgView);
        make.height.mas_equalTo(AUTO(150));
    }];
    
    [self.bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.tableView.mas_bottom).offset(AUTO(26));
        make.right.offset(AUTO(-150));
    }];
    
    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.priceLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(128), AUTO(40)));
    }];
    
    NSString *price = @"168";
//    NSNumber *priceStr = [[NSNumber alloc] initWithFloat:price];
    NSString *total = [NSString stringWithFormat:@"需支付 %@ 红币",price];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:total];
    NSRange range = [total rangeOfString:price];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(28)]} range:range];
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
    }
    self.priceLab.attributedText = attr;
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.payWayArray.count;
    }

    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        JCBuyPlanPayWayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCBuyPlanPayWayCell"];
        JCPayWayBall *payWayball = self.payWayArray[indexPath.row];
        cell.payWayball = payWayball;
        if (indexPath.row==0) {
            if (self.hongbaoArray.count<2) {
                cell.infoLab.text = @"暂无优惠券";
                cell.selHongbaoLab.textColor = COLOR_9F9F9F;
                cell.selHongbaoLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
            }

            if (self.payInfoModel.is_use==0) {
                cell.infoLab.text = @"暂无优惠券";
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

    JCDakaBuyPlanProtocolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDakaBuyPlanProtocolCell"];
    self.sureProtocolBtn = cell.sureProtocolBtn;
    WeakSelf;
    cell.JCProtocolBlock = ^{
        if (weakSelf.JCProtocolBlock) {
            weakSelf.JCProtocolBlock();
        }
    };
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return AUTO(50);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)rechargeBtnClick {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"JCFanganAgree"]) {
        [JCWToastTool showHint:@"请阅读《鲸猜足球用户购买协议》并点击同意"];
        return ;
    }
    
    if (self.JCSureBlock) {
        self.JCSureBlock(@"");
        [self hide];
    }
}


- (void)show {
    

    
    self.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
        WeakSelf;
        [UIView animateWithDuration:0.3f animations:^{
            weakSelf.bgView.transform = CGAffineTransformIdentity;
        }];
    
}

- (void)hide {
    WeakSelf;
    [UIView animateWithDuration:0.3f animations:^{
        weakSelf.bgView.transform = CGAffineTransformMakeTranslation(0, SCREEN_HEIGHT);
         
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf removeFromSuperview];;
    });
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

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:1];
        view.dataSource = self;
        view.delegate = self;
        //        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        //view.separatorColor = COLOR_SEPRATE;
        view.separatorInset = UIEdgeInsetsMake(0.0f, 15, 0.0f, 0.0f);
        view.separatorColor = COLOR_999999;
        view.showsVerticalScrollIndicator = NO;
        view.separatorStyle = 0;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.tableFooterView = [UIView new];
        //注册cell
        [view registerClass:[JCBuyPlanPayWayCell class] forCellReuseIdentifier:@"JCBuyPlanPayWayCell"];
        [view registerClass:[JCDakaBuyPlanProtocolCell class] forCellReuseIdentifier:@"JCDakaBuyPlanProtocolCell"];
        _tableView = view;
    }
    
    return _tableView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"ic_column_close") forState:0];
        [_closeBtn setImage:JCIMAGE(@"ic_column_close") forState:UIControlStateHighlighted];
        [_closeBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

-  (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setCornerOnTopWithRadius:20];
    }
    return _bgView;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:3 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确认支付" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new") forState:0];
        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new") forState:UIControlStateHighlighted];
        [_sureBtn addTarget:self action:@selector(rechargeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(40)];
    }
    return _sureBtn;
}

@end
