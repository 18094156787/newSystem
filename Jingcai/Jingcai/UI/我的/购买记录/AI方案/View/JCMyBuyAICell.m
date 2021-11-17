//
//  JCMyBuyAICell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMyBuyAICell.h"
#import "JCAIPlanMatchTableCell.h"
@implementation JCMyBuyAICell

- (void)initViews{
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
//        make.height.mas_equalTo(AUTO(22));
    }];
    
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(32));
    }];
    
    [self.contentView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView).offset(AUTO(10));
        make.right.equalTo(self.tableView);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
    }];
    
    [self.contentView addSubview:self.refundImgView];
    [self.refundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView);
        make.right.equalTo(self.tableView).offset(AUTO(-5));
        make.size.mas_equalTo(CGSizeMake(AUTO(52), AUTO(18)));
    }];
    
    [self.contentView addSubview:self.timeView];
    [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.offset(0);
       make.right.offset(0);
        make.top.equalTo(self.tableView.mas_bottom);
       make.height.mas_equalTo(AUTO(40));
    }];
    
    [self.timeView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.timeView);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.timeView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLab.mas_right).offset(5);
        make.centerY.equalTo(self.timeView);
    }];
    

    
    [self.timeView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.timeView);
    }];
    
    
    
    UIView *lineView1= [UIView new];
    lineView1.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.06];
    [self.contentView addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.timeView.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.priceView];
    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(AUTO(8));
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(30));
        make.bottom.offset(AUTO(0));
    }];
    
    [self.priceView addSubview:self.payPriceLab];
    [self.payPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
    }];
    
    [self.priceView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.payPriceLab.mas_right).offset(AUTO(40));
        make.top.offset(0);
    }];
    
    [self.priceView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.payPriceLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(5), AUTO(10)));
    }];

    [self.priceView addSubview:self.orderDetailLab];
    [self.orderDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicateImgView.mas_left).offset(-3);
        make.centerY.equalTo(self.indicateImgView);
    }];
    
    WeakSelf;
    [self.orderDetailLab bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];

}

#pragma mark <UITableViewDelegate>


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dianPingBall.zucai_tuijian_match.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(32);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCAIPlanMatchTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCAIPlanMatchTableCell"];
    cell.dianPingBall = self.dianPingBall;
    cell.refundImgView.hidden = YES;
    cell.statusImgView.hidden = YES;
    cell.is_zh = self.is_zh;
    cell.is_round_num = self.is_round_num;
    cell.model = self.dianPingBall.zucai_tuijian_match[indexPath.row];


    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary * matchDic = self.dianPingBall.match_data[indexPath.row];
//    if (self.matchClickBlock) {
//        self.matchClickBlock(matchDic[@"match_num"]);
//    }
}


- (void)setDianPingBall:(JCHongBangBall *)dianPingBall {
    _dianPingBall = dianPingBall;
    self.tableView.userInteractionEnabled = NO;
    
    self.resultImgView.hidden = dianPingBall.base_info.wl==0?YES:NO;
    NSString *title = dianPingBall.base_info.title;
    if (dianPingBall.base_info.refund.length>0) {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",title]];
                NSTextAttachment *attch = [[NSTextAttachment alloc] init];
                   // 表情图片
                   attch.image = JCIMAGE(@"icon_bzfh");
                   // 设置图片大小
                   attch.bounds = CGRectMake(0, -4, 52, 18);
                   // 创建带有图片的富文本
                   NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];

           //    [attr appendAttributedString:string]; //在文字后面添加图片
                [attr insertAttributedString:string atIndex:0];
               self.titleLab.attributedText = attr;

        }else{
            self.titleLab.text = title;
        }
    
    
    
    if (dianPingBall.base_info.wl==1||dianPingBall.base_info.wl==3) {
        self.resultImgView.image = JCIMAGE(@"hb_list_hong");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
//        }];
    }
    if (dianPingBall.base_info.wl==2||dianPingBall.base_info.wl==4) {
        self.resultImgView.image = JCIMAGE(@"hb_list_hei");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
//        }];
    }
    if (dianPingBall.base_info.wl==5) {
        self.resultImgView.image = JCIMAGE(@"hb_list_zou");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
//        }];
    }
    if (dianPingBall.base_info.wl==6) {
        self.resultImgView.image = JCIMAGE(@"hb_list_yq");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(58)));
//        }];
    }
    if (dianPingBall.base_info.wl==7) {
        self.resultImgView.image = JCIMAGE(@"hb_list_qx");
//        [self.resultImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.tableView).offset(AUTO(10));
//            make.right.equalTo(self.tableView);
//            make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(58)));
//        }];
    }
    
    
    
//    self.titleLab.text = dianPingBall.title;
    
    
    
//    if (self.showPriceView) {
//        self.priceView.hidden = NO;
//        self.buyInfoView.hidden = YES;
//    }else{
//        self.priceView.hidden = YES;
//        self.buyInfoView.hidden = NO;
//    }
//    self.buyInfoView.isMine = self.isMine;
//    self.priceView.dianPingBall = dianPingBall;
//    self.buyInfoView.dianPingBall = dianPingBall;
    
    self.timeLab.text = [NSString stringWithFormat:@"%@ 发布 ",dianPingBall.base_info.created_at];
    
    self.typeLab.text = [NSString stringWithFormat:@"  %@  ",dianPingBall.base_info.classfly_desc];
    self.typeLab.hidden = dianPingBall.base_info.classfly_desc.length>0?NO:YES;
    if ([dianPingBall.base_info.classfly integerValue]==2) {
        self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_002868.CGColor;
        self.typeLab.textColor = COLOR_002868;
    }else if([dianPingBall.base_info.classfly integerValue]==3){
        self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.typeLab.textColor = COLOR_30B27A;
    }else{
        self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = JCBaseColor.CGColor;
        self.typeLab.textColor = JCBaseColor;
    }
    
    //原价
    NSString *ori_price = [NSString stringWithFormat:@"原价 %@",dianPingBall.base_info.total_price];
    NSMutableAttributedString *ori_attr = [[NSMutableAttributedString alloc] initWithString:ori_price];
    NSRange ori_range = [ori_price rangeOfString:@"原价"];
    [ori_attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)],NSForegroundColorAttributeName:COLOR_9F9F9F} range:ori_range];
    self.priceLab.attributedText = ori_attr;

//    if (dianPingBall.base_info.is_pay==1) {
//        self.priceLab.text = @"已购买";
//        self.priceLab.textColor = COLOR_2F2F2F;
//    }else{
//        self.priceLab.textColor = JCBaseColor;
//        if ([dianPingBall.base_info.sf intValue]==0) {
//            self.priceLab.text = @"免费";
//        }else{
//            NSString *price = [NSString stringWithFormat:@"%@红币",@([dianPingBall.base_info.sf floatValue]/100.0f)];
//            self.priceLab.text = price;
//        }
//    }
    NSString *price = [NSString stringWithFormat:@"实付金额：%@",dianPingBall.base_info.zucai_order_pay_price];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange pay_range = [price rangeOfString:@"实付金额："];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]} range:pay_range];
    self.payPriceLab.attributedText = attr;
    
    if (dianPingBall.base_info.zucai_order_refund_status==4) {

        self.statusLab.text = @"已退款";
        self.statusLab.textColor  =COLOR_30B27A;
    }else {
        self.statusLab.text = @"正常";
        self.statusLab.textColor  =COLOR_999999;
    }

    
    
    [self.tableView reloadData];
      
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0.0f, 5, 0.0f, AUTO(10));
        _tableView.separatorColor = COLOR_DDDDDD;
        _tableView.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.backgroundColor = JCClearColor;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 50;
        _tableView.separatorStyle = 0;
        _tableView.scrollEnabled = NO;
        [_tableView registerClass:[JCAIPlanMatchTableCell class] forCellReuseIdentifier:@"JCAIPlanMatchTableCell"];
        
    }
    
    return _tableView;
}


- (JCAIPlanBuyInfoView *)buyInfoView {
    if (!_buyInfoView) {
        _buyInfoView = [JCAIPlanBuyInfoView new];
    }
    return _buyInfoView;
}


- (UIImageView *)refundImgView {
    if (!_refundImgView) {
        _refundImgView = [UIImageView new];
        _refundImgView.image = JCIMAGE(@"hb_bzfh");
        _refundImgView.hidden = YES;
    }
    return _refundImgView;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
    }
    return _resultImgView;
}
- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _typeLab.layer.borderWidth = 0.5;
        _typeLab.layer.borderColor = JCBaseColor.CGColor;
        _typeLab.layer.masksToBounds = YES;
        _typeLab.layer.cornerRadius = AUTO(8);
    }
    return _typeLab;
}


- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}


- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIView *)timeView {
    if (!_timeView) {
        _timeView = [UIView new];
    }
    return _timeView;
}

- (UIView *)priceView {
    if (!_priceView) {
        _priceView = [UIView new];
    }
    return _priceView;
}

- (UILabel *)payPriceLab {
    if (!_payPriceLab) {
        _payPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _payPriceLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_30B27A andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLab;
}

- (UILabel *)orderDetailLab {
    if (!_orderDetailLab) {
        _orderDetailLab = [UILabel initWithTitle:@"订单详情" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _orderDetailLab.userInteractionEnabled = YES;
    }
    return _orderDetailLab;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"common_arrow_right");
    }
    return _indicateImgView;
}
@end
