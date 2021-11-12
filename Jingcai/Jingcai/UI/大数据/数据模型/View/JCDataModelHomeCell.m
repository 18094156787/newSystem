//
//  JCDataModelHomeCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDataModelHomeCell.h"

@implementation JCDataModelHomeCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(8)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(bgView);
        make.width.height.mas_equalTo(AUTO(128));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView);
        make.left.equalTo(self.imgView.mas_right).offset(AUTO(8));
        make.right.offset(AUTO(-8));
    }];
    
    [bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(4));
        make.left.equalTo(self.titleLab);
        make.right.offset(AUTO(-8));
    }];
    
    [bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(8));
        make.left.equalTo(self.titleLab);
        make.right.offset(AUTO(-8));
    }];
    
    [bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imgView);
        make.left.equalTo(self.titleLab);
        make.right.offset(AUTO(-100));
    }];
    
    [bgView addSubview:self.buyBtn];
    [self.buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imgView);
        make.right.offset(AUTO(-8));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(28)));
    }];
}

- (void)data {
    self.imgView.image = JCIMAGE(@"ic_dataModel_history");
    self.titleLab.text = @"鲸猜大数据报告";
    self.contentLab.text = @"据对阵双方的实力、状态、交战、战役、指数等数据进行分析，给...";
    self.countLab.text = @"210人已购买";
//    self.priceLab.text = @"188";
    [self.buyBtn setTitle:@"立即查看" forState:0];
    NSString *price = [NSString stringWithFormat:@"%@元/月",@"188"];
    NSRange range = [price rangeOfString:@"元/月"];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(11)]} range:range];
    self.priceLab.attributedText = attr;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
    }
    return _imgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.88] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.64] andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 2;
    }
    return _contentLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.64] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:3 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIButton *)buyBtn {
    if (!_buyBtn) {
        _buyBtn = [UIButton initWithText:@"立即购买" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_buyBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_buyBtn setBackgroundImage:JCIMAGE(@"button_bg_new") forState:0];
        [_buyBtn setBackgroundImage:JCIMAGE(@"button_bg_new") forState:UIControlStateHighlighted];
    }
    return _buyBtn;
}


@end
