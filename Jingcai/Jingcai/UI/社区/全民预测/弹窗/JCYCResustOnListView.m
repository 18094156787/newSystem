//
//  JCYCResustOnListView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCResustOnListView.h"

@implementation JCYCResustOnListView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIImageView *bgView = [UIImageView new];
    bgView.image = JCIMAGE(@"yc_tip_success");
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(0)+kNavigationBarHeight);
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.height.mas_equalTo(AUTO(480));
    }];


    [bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.offset(AUTO(113));
        make.size.mas_equalTo(CGSizeMake(AUTO(68), AUTO(68)));
    }];
    
    [bgView addSubview:self.qyImgView];
    [self.qyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(15)));
    }];
    
    [bgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"恭喜您，上周成功入榜" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(bgView);
    }];
    
    [bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(bgView);
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(80));
    }];
    
    UIButton *shareBtn = [UIButton initWithText:@"确定" FontSize:AUTO(16) BackGroundColor:COLOR_EF2F2F TextColors:JCWhiteColor];
    shareBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    [bgView addSubview:shareBtn];
    [shareBtn hg_setAllCornerWithCornerRadius:AUTO(26)];
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLab.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(250), AUTO(46)));
    }];
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"yc_tip_close") forState:0];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(50)));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];
    
    [shareBtn bk_whenTapped:^{
        if (weakSelf.JCCloseBlock) {
            weakSelf.JCCloseBlock();
        }
    }];
    
//    [self data];
}



- (void)setWeekResultModel:(JCYuCeWeekResultModel *)weekResultModel {
    _weekResultModel = weekResultModel;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:weekResultModel.user_info.user_img]];
    self.nameLab.text = weekResultModel.user_info.user_name;
    self.infoLab.text = [NSString stringWithFormat:@"上周 %@ 连红 | 中%@场",NonNil(weekResultModel.lianhong),NonNil(weekResultModel.mingzhong)];
     self.qyImgView.hidden = [weekResultModel.top integerValue]==1?NO:YES;
    float price = [weekResultModel.total floatValue]/100.0f;
    NSString *priceString = [NSString stringWithFormat:@"%.2f",price];
    if (weekResultModel.code.length==0) {
        weekResultModel.code = [JCConfigModel currentConfigModel].customer_award;
    }
    NSString *code = [NSString stringWithFormat:@"获奖验证码：%@",weekResultModel.code];
    
    NSString *string = [NSString stringWithFormat:@"获得 %@ 元红包\n添加客服微信：%@ 领奖\n%@",priceString,weekResultModel.wechat,code];
    NSRange range = [string rangeOfString:priceString];
    NSRange codeRange = [string rangeOfString:code];
    if (range.location != NSNotFound) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5; // 设置行间距
        NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:string];
        [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F,NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldItalicMT" size:AUTO(30)],NSParagraphStyleAttributeName: paragraphStyle} range:range];
        [atext addAttributes:@{NSForegroundColorAttributeName:[COLOR_2F2F2F colorWithAlphaComponent:0.6],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)]} range:codeRange];
        self.priceLab.attributedText = atext;
    }
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(34)];
    }
    return _headImgView;
}

- (UIImageView *)qyImgView {
    if (!_qyImgView) {
        _qyImgView = [UIImageView new];
        _qyImgView.image = JCIMAGE(@"jc_qianyue_tag");
        _qyImgView.hidden = YES;
    }
    return _qyImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _priceLab.numberOfLines = 0;
    }
    return _priceLab;
}

@end
