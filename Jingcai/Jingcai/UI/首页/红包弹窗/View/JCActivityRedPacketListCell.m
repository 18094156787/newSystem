//
//  JCActivityRedPacketListCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCActivityRedPacketListCell.h"

@implementation JCActivityRedPacketListCell
- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
    
    [bgView addSubview:self.countImgView];
    [self.countImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.width.height.mas_equalTo(AUTO(30));
    }];
    
    [bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.left.offset(3);
        make.width.mas_equalTo(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.priceLab];
     [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.countLab.mas_right);
         make.centerY.equalTo(bgView);
         make.width.height.mas_equalTo(AUTO(70));
     }];
    
    [bgView addSubview:self.titleLab];
     [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.offset(AUTO(10));
         make.left.equalTo(self.priceLab.mas_right).offset(AUTO(10));
     }];
    
    [bgView addSubview:self.limitLab];
     [self.limitLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(2));
         make.left.equalTo(self.priceLab.mas_right).offset(AUTO(10));
     }];
    
    [bgView addSubview:self.infoLab];
     [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.limitLab.mas_bottom).offset(AUTO(2));
         make.left.equalTo(self.priceLab.mas_right).offset(AUTO(10));
     }];
    
    [bgView addSubview:self.dateLab];
     [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(2));
         make.left.equalTo(self.priceLab.mas_right).offset(AUTO(10));
     }];
    
//    [self data];
}


- (void)setModel:(JCActivityRedPacketModel *)model {
    _model = model;
    
    self.countLab.text = [NSString stringWithFormat:@"x%@",model.count];

    NSString *price = [NSString stringWithFormat:@"¥%@",model.total];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange range = [price rangeOfString:model.total];
    [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:AUTO(24)] range:range];
//    [attrString addAttribute:NSForegroundColorAttributeName value:COLOR_EF5C52 range:range];
    self.priceLab.attributedText = attrString;
    
    self.titleLab.text = model.name;
    self.limitLab.text = model.scope;
    self.infoLab.text = @"不可提现或转赠，到期作废";
    self.dateLab.text = [NSString stringWithFormat:@"%@-%@",model.start_time,model.end_time];
}

- (UIImageView *)countImgView {
    if (!_countImgView) {
        _countImgView = [UIImageView new];
        _countImgView.image = JCIMAGE(@"bg_number");
    }
    return _countImgView;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_D16406   andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _countLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_E02020   andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont boldSystemFontOfSize:AUTO(10)];
    }
    return _priceLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:COLOR_333333   andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont boldSystemFontOfSize:AUTO(14)];
    }
    return _titleLab;
}

- (UILabel *)limitLab {
    if (!_limitLab) {
        _limitLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_999999  andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _limitLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_999999  andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_999999  andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _dateLab;
}


@end
