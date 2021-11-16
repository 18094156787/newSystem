//
//  JCHistoryPayHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayHeadView.h"

@implementation JCHistoryPayHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    
    self.bgView = [[UIImageView alloc] init];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.image = JCIMAGE(@"bg_img_history");
//    self.bgView.backgroundColor = JCWhiteColor;
//    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    self.bgView.frame = CGRectMake(0,0,SCREEN_WIDTH,AUTO(208)+kNavigationBarHeight);
    [self addSubview:self.bgView];
    
    UIView *cornerView = [UIView new];
    cornerView.backgroundColor = COLOR_F4F6F9;
    [cornerView hg_setCornerOnTopWithRadius:12];
    [self.bgView addSubview:cornerView];
    [cornerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.bgView);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    UIButton *backBtn = [UIButton new];
    [self.bgView addSubview:backBtn];
    [backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:0];
    [backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:UIControlStateHighlighted];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(StatusBar_HEIGHT);
        make.width.height.mas_equalTo(44);
    }];
    self.backBtn = backBtn;
    
    
    UILabel *titleLab = [UILabel initWithTitle:@"历史同赔" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backBtn.mas_right).offset(0);
        make.centerY.equalTo(backBtn);
    }];
    self.backTitleLab = titleLab;


    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(kNavigationBarHeight+AUTO(12));
        make.right.offset(AUTO(-115));
    }];
    

    [self.bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
    }];

    [self.bgView addSubview:self.buyBgView];
    [self.buyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.countLab.mas_left).offset(0);
        make.width.mas_equalTo(120);
        make.centerY.equalTo(self.countLab);
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.bgView addSubview:self.buyInfoView];
    [self.buyInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.buyBgView).offset(-5);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.bgView addSubview:self.sureBgView];
    [self.sureBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buyInfoView.mas_bottom).offset(AUTO(30));
        make.left.offset(15);
        make.right.offset(-15);
        make.height.mas_equalTo(AUTO(40));
    }];

    
    [self.sureBgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    [self.sureBgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.bottom.offset(0);
        make.right.mas_equalTo(self.sureBgView.mas_centerX);
    }];
    
    [self.sureBgView addSubview:self.statusBtn];
    [self.statusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.bottom.offset(0);
        make.left.mas_equalTo(self.sureBgView.mas_centerX);
    }];
    
    [self addSubview:self.dateHeadView];
    [self.dateHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(72));
        make.bottom.offset(0);
    }];
    
    

    


    
    WeakSelf;

    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCBuyClickBlock) {
            weakSelf.JCBuyClickBlock();
        }
    }];

    [backBtn bk_whenTapped:^{
        [[weakSelf getViewController].navigationController popViewControllerAnimated:YES];
    }];
    
    self.dateHeadView.JCTimeBlock = ^(NSString * _Nonnull time) {
        if (weakSelf.JCTimeBlock) {
            weakSelf.JCTimeBlock(time);
        }
        
    };

}

- (void)setModel:(JCKellyDataModelPayInfoModel *)model {
    _model = model;
    self.buyInfoView.dataModel = model;
    if (model.show_status==1||model.show_status==3) {
        //免费体验,立即续费
        self.statusBtn.hidden = YES;
        self.timeLab.hidden = YES;
        [self.sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new_cor") forState:0];
        [self.sureBtn setTitle:[NSString stringWithFormat:@"免费体验%@天，点击开通",NonNil(model.free_day)] forState:0];
        if (model.show_status==3) {
            [self.sureBtn setTitle:@"立即开通" forState:0];
        }
        
    }
    if (model.show_status==2) {
        self.statusBtn.hidden = NO;
        self.timeLab.hidden = NO;
        NSString *time = [NSString stringWithFormat:@"当前到期时间 %ld 天",model.distance_day];
        NSRange range = [time rangeOfString:[NSString stringWithFormat:@"%ld",model.distance_day]];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:time];

        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)]} range:range];
        }
        self.timeLab.attributedText = attr;
        [self.sureBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button") forState:0];
        if (model.model_status==1) {
            //免费体验
            [self.sureBtn setTitle:@"" forState:0];
            [self.statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_red") forState:0];
            [self.statusBtn setTitle:@"免费体验中" forState:0];
        }
        if (model.model_status==2) {
            //体验中续费

            [self.sureBtn setTitle:@"" forState:0];
            [self.statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_red") forState:0];
            [self.statusBtn setTitle:@"立即续费" forState:0];
        }
        if (model.model_status==3) {
            //体验中下架

            [self.sureBtn setTitle:@"" forState:0];
            [self.statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_gray") forState:0];
            [self.statusBtn setTitle:@"已下架" forState:0];
        }
        if (model.model_status==4) {
            //免费
            self.statusBtn.hidden = YES;
            self.timeLab.hidden = YES;
//            [self.sureBtn setTitle:@"" forState:0];
 
            [self.sureBtn setBackgroundImage:JCIMAGE(@"blank") forState:0];
            [self.sureBtn setTitle:@"免费查看「鲸猜大数据」" forState:0];
        }


        
    }
    //未订阅下架
    if (model.show_status==4) {
        self.statusBtn.hidden = NO;
        self.timeLab.hidden = NO;
        NSString *time = [NSString stringWithFormat:@"当前到期时间 %ld 天",model.distance_day];
        NSRange range = [time rangeOfString:[NSString stringWithFormat:@"%ld",model.distance_day]];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:time];

        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)]} range:range];
        }
        self.timeLab.attributedText = attr;
        
        [self.sureBtn setTitle:@"" forState:0];
        [self.statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_gray") forState:0];
        [self.statusBtn setTitle:@"已下架" forState:0];
        
    }
    
    if (model.show_status==2&&model.model_status==4) {
        self.sureBtn.layer.borderColor = JCWhiteColor.CGColor;
    }else{
        self.sureBtn.layer.borderColor = JCClearColor.CGColor;
    }
    
    if (model.current_count>0) {
        NSString *buyCount = [NSString stringWithFormat:@"%ld人购买",model.current_count];
        self.countLab.text = buyCount;

    }else{
        self.countLab.text = @"";
    }

    [self layoutIfNeeded];
    NSArray *userArray = model.user_img;
    userArray = [[userArray reverseObjectEnumerator] allObjects];
        for (int i=0; i<userArray.count; i++) {
             NSString *user_img = userArray[i];
              UIImageView *imgView = [UIImageView new];
              [imgView hg_setAllCornerWithCornerRadius:AUTO(11)];
            imgView.frame = CGRectMake(90-AUTO(15)*i, AUTO(4), AUTO(22), AUTO(22));
            imgView.image = JCIMAGE(@"userImg_default");
             [imgView sd_setImageWithURL:[NSURL URLWithString:user_img] placeholderImage:JCIMAGE(@"userImg_default")];
//              [self.buyBgView addSubview:imgView];
            [self.buyBgView insertSubview:imgView atIndex:0];
            [imgView bringSubviewToFront:self.buyBgView];
      }
}

- (void)setType:(NSInteger)type {
    _type = type;
    if (self.type==0) {
        self.titleLab.text = @"基于鲸猜足球数十万场足球赛事、几亿赔率数据库积累，分析同赔率历史比赛赛果分布，进而预测未来比赛的赛果。";
        self.backTitleLab.text = @"历史同赔";
    }
    if (self.type==1) {
        self.bgView.image = JCIMAGE(@"bg_img_poisson");
        self.titleLab.text = @"基于比赛中双方球队进球数的概率符合泊松分布的原理，借助泊松分布数学模型，进行推算比赛赛果。";
        self.backTitleLab.text = @"泊松分布";
        
    }
    if (self.type==2) {
        self.bgView.image = JCIMAGE(@"bg_img_dispersed");
        self.bgView.frame = CGRectMake(0,0,SCREEN_WIDTH,AUTO(228)+kNavigationBarHeight);
        self.titleLab.text = @"根据百家机构欧赔平均值与每家赔率差值的绝对值求和，再计算得出绝对值平均值作为离散指数。离散值越小，各公司机构观点接近，越容易打出；离散度大则意见分歧大，结果不易打出。";
        self.backTitleLab.text = @"离散指数";
    }
    if (self.type==3) {
        self.bgView.image = JCIMAGE(@"bg_img_kelly");
        self.titleLab.text = @"凯利指数是利用所有机构开出的赔率和胜平负概率，通过凯利公式计算出来的。通过赔率与赔付率的对比，反应各项赔率存在的风险。";
        self.backTitleLab.text = @"凯利指数";
    }
    if (self.type==4) {
        self.bgView.image = JCIMAGE(@"bg_img_ transaction");
        self.titleLab.text = @"实时监控指数数据，获取有大幅变动的赛事，帮助用户发现值得深挖分析的赛事。实时监控指数数据，获取有大幅变动的赛事，帮助用户发现值得深挖分析的赛事。";
        self.backTitleLab.text = @"指数异动";
        self.dateHeadView.hidden = YES;
        
    }


}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UIView *)buyBgView {
    if (!_buyBgView) {
        _buyBgView = [UIView new];
    }
    return _buyBgView;
}

- (JCJingCaiAIBigDataBuyInfoView *)buyInfoView {
    if (!_buyInfoView) {
        _buyInfoView = [JCJingCaiAIBigDataBuyInfoView new];
//        _buyInfoView.hidden = YES;
    }
    return _buyInfoView;
}



- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"立即开通" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new_cor") forState:0];
        _sureBtn.layer.borderWidth = 1;
        _sureBtn.layer.cornerRadius = AUTO(22);
        _sureBtn.layer.masksToBounds = YES;
//        _sureBtn.backgroundColor = JCBaseColor;
//        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _sureBtn;
}

- (JCDataModelDateView *)dateHeadView {
    if (!_dateHeadView) {
        _dateHeadView = [JCDataModelDateView new];
        _dateHeadView.clearBg = YES;
//        _dateHeadView.backgroundColor = JCClearColor;
//        _dateHeadView.collectionView.backgroundColor = JCClearColor;
//        _dateHeadView.hidden = YES;
 
    }
    return _dateHeadView;
}
- (UIView *)sureBgView {
    if (!_sureBgView) {
        _sureBgView = [UIView new];
//        _sureBgView.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
//        [_sureBgView hg_setAllCornerWithCornerRadius:16];
    }
    return _sureBgView;
}
- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _timeLab.hidden = YES;
        
    }
    return _timeLab;
}

- (UIButton *)statusBtn {
    if (!_statusBtn) {
        _statusBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_red") forState:0];
        _statusBtn.hidden = YES;
        _statusBtn.userInteractionEnabled = NO;
//        [_statusBtn hg_setAllCornerWithCornerRadius:16];
    }
    return _statusBtn;
}
@end
