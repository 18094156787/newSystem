//
//  JCMyBuyOrderDataHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderDataHeadView.h"

@implementation JCMyBuyOrderDataHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.titleInfoLab];
    [self.titleInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [self addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.titleInfoLab);
    }];

    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleInfoLab.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
    }];
    
    [self.bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(100)));
    }];

    [self.bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.right.offset(AUTO(-10));
    }];

//    [self.bgView addSubview:self.infoLab];
//    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentLab);
//        make.bottom.equalTo(self.headImgView);
//    }];
    
    [self.bgView addSubview:self.buyBtn];
    [self.buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.bottom.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(88), AUTO(30)));
    }];
    WeakSelf;
    [self.buyBtn bk_whenTapped:^{
        if (weakSelf.JCBuyBlock) {
            weakSelf.JCBuyBlock();
        }
    }];

}

- (void)setDetailModel:(JCBigDataOrderDetailModel *)detailModel {
    _detailModel = detailModel;
    self.titleInfoLab.text = detailModel.title;
    self.bgView.hidden = NO;
    self.priceLab.text = [NSString stringWithFormat:@"%@红币/月",@([detailModel.pay_price floatValue])];
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:detailModel.logo] placeholderImage:JCIMAGE(@"ic_data_robot")];
    self.contentLab.text = detailModel.desc;
//    if ([detailModel.style integerValue]==1) {
//        self.priceLab.text = [NSString stringWithFormat:@"%ld红币/场",[detailModel.old_total integerValue]/100];
//        self.bgView.hidden = YES;
//    }else{
//        self.bgView.hidden = NO;
//        self.priceLab.text = [NSString stringWithFormat:@"%@红币/月",@([detailModel.total_price floatValue])];
//        [self.headImgView sd_setImageWithURL:[NSURL URLWithString:detailModel.logo] placeholderImage:JCIMAGE(@"ic_data_robot")];
//        self.contentLab.text = detailModel.desc;
//    }
    

    
}


- (UILabel *)titleInfoLab {
    if (!_titleInfoLab) {
        _titleInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(17) andWeight:3 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleInfoLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:4];
    }
    return _headImgView;
}


- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines= 4;
    }
    return _contentLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"开通包月，每日为您奉上专业精准的数据" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A3A3A3 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIButton *)buyBtn {
    if (!_buyBtn) {
        _buyBtn = [UIButton initWithText:@"再次购买" FontSize:AUTO(14) Weight:1 BackGroundColor:JCClearColor TextColors:JCBaseColor];
        _buyBtn.layer.borderColor = JCBaseColor.CGColor;
        _buyBtn.layer.borderWidth = 1;
        _buyBtn.layer.cornerRadius = AUTO(15);
        _buyBtn.layer.masksToBounds = YES;
    }
    return _buyBtn;
}

@end
