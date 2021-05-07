//
//  JCYCHongbaoInfoView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCHongbaoInfoView.h"

@implementation JCYCHongbaoInfoView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    UIImageView *bgView = [UIImageView new];
    bgView.image = JCIMAGE(@"jc_yc_new");
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(kNavigationBarHeight+40);
        make.size.mas_equalTo(CGSizeMake(315, 487));
    }];

    
    //免单券和优惠券
    [bgView addSubview:self.contentBgView];
    [self.contentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(210);
        make.left.offset(12);
        make.right.offset(-12);
        make.height.mas_equalTo(85);
    }];
    
    
    [self.contentBgView addSubview:self.content_titleLab];
    [self.content_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.right.offset(-12);
        make.top.offset(10);
        make.height.mas_equalTo(20);
    }];
    
    [self.contentBgView addSubview:self.content_timeLab];
    [self.content_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(12);
        make.right.offset(-12);
        make.top.equalTo(self.content_titleLab.mas_bottom).offset(7);
        make.height.mas_equalTo(15);
    }];
    
    [self.contentBgView addSubview:self.content_contentLab];
    [self.content_contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.right.offset(-12);
        make.top.equalTo(self.content_timeLab.mas_bottom).offset(3);
        make.height.mas_equalTo(15);
    }];
    
    //现金红包
    
    [bgView addSubview:self.priceBgView];
    [self.priceBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(210);
        make.left.offset(12);
        make.right.offset(-12);
        make.height.mas_equalTo(85);
    }];
    
    [self.priceBgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.left.offset(12);
        make.right.offset(-12);
        make.height.mas_equalTo(30);
    }];
    
    UILabel *hbLabel = [UILabel initWithTitle:@"现金红包" andFont:14 andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.priceBgView addSubview:hbLabel];
    [hbLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLab.mas_bottom).offset(5);
        make.left.offset(12);
        make.right.offset(-12);
        make.height.mas_equalTo(20);
    }];
    
    
    [bgView addSubview:self.infoLab1];
    [self.infoLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.right.offset(-12);
        make.top.equalTo(self.contentBgView.mas_bottom).offset(20);
        make.height.mas_equalTo(20);
    }];
    
    [bgView addSubview:self.infoLab2];
    [self.infoLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.right.offset(-12);
        make.top.equalTo(self.infoLab1.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
    }];

    [bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.right.offset(-30);
        make.top.equalTo(self.infoLab2.mas_bottom).offset(20);
        make.height.mas_equalTo(46);
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"yc_tip_close") forState:0];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(50)));
    }];


    
    UILabel *goLab = [UILabel initWithTitle:@"" andFont:16 andWeight:2 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    goLab.userInteractionEnabled = YES;
    [bgView addSubview:goLab];
    [goLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sureBtn.mas_bottom).offset(20);
        make.left.offset(30);
        make.right.offset(-30);
    }];
    
    NSString *string = @"前往 我的红包卡券 查看";
    NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:string];
    [atext addAttributes:@{NSForegroundColorAttributeName:[JCWhiteColor colorWithAlphaComponent:0.8],NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle), NSUnderlineColorAttributeName : [JCWhiteColor colorWithAlphaComponent:0.8]} range:string.rangeOfAll];
    goLab.attributedText = atext;
   
    
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [self.sureBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [goLab bk_whenTapped:^{
        if (weakSelf.JCGoHongbaoBlock) {
            weakSelf.JCGoHongbaoBlock();
        }
    }];
    

}


- (void)setModel:(JCJingCaiHongbaoModel *)model {
    _model = model;
    self.content_titleLab.text = model.get_content.name;
    if (model.type==1||model.type==2) {
        //现金红包
        self.priceBgView.hidden = NO;
        self.contentBgView.hidden = YES;
        self.priceLab.text = [NSString stringWithFormat:@"¥ %@",model.get_content.total];
        self.infoLab1.text = @"已放入 我的红包卡券";
        self.infoLab2.text = @"可提现到支付宝账号";
    }else{
        //优惠券或者面单券
        self.priceBgView.hidden = YES;
        self.contentBgView.hidden = NO;
        self.infoLab1.text = @"已放入 我的红包卡券";
        self.infoLab2.text = @"可在购买方案时进行使用";
        self.content_timeLab.text = model.get_content.time;
        self.content_contentLab.text = model.get_content.scope;
        if (model.type==4) {
            self.content_titleLab.text = [NSString stringWithFormat:@"%@元%@",model.get_content.total,model.get_content.name];
        }
    }
}

- (UIView *)contentBgView {
    if (!_contentBgView) {
        _contentBgView = [UIView new];
        _contentBgView.backgroundColor = JCWhiteColor;
        [_contentBgView hg_setAllCornerWithCornerRadius:12];
    }
    return _contentBgView;
}

- (UILabel *)content_titleLab {
    if (!_content_titleLab) {
        _content_titleLab = [UILabel initWithTitle:@"" andFont:16 andWeight:2 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _content_titleLab;
}

- (UILabel *)content_timeLab {
    if (!_content_timeLab) {
        _content_timeLab = [UILabel initWithTitle:@"" andFont:11 andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _content_timeLab;
}

- (UILabel *)content_contentLab {
    if (!_content_contentLab) {
        _content_contentLab = [UILabel initWithTitle:@"" andFont:11 andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _content_contentLab;
}


- (UIView *)priceBgView {
    if (!_priceBgView) {
        _priceBgView = [UIView new];
        _priceBgView.backgroundColor = JCWhiteColor;
        [_priceBgView hg_setAllCornerWithCornerRadius:12];
    }
    return _priceBgView;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:26 andWeight:3 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _priceLab;
}


- (UILabel *)infoLab1 {
    if (!_infoLab1) {
        _infoLab1 = [UILabel initWithTitle:@"" andFont:14 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab1;
}
- (UILabel *)infoLab2 {
    if (!_infoLab2) {
        _infoLab2 = [UILabel initWithTitle:@"" andFont:14 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab2;
}



- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"邀请好友，再拆一次" FontSize:16 Weight:2 BackGroundColor:JCWhiteColor TextColors:COLOR_EF2F2F];
        [_sureBtn hg_setAllCornerWithCornerRadius:26];
    }
    return _sureBtn;;
}

@end
