//
//  JCJingCaiAIBigDataXufeiInfoView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataXufeiInfoView.h"

@implementation JCJingCaiAIBigDataXufeiInfoView

- (void)initViews {
    [self addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
        make.height.mas_equalTo(AUTO(20));
    }];

    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.infoLab);
        make.top.equalTo(self.infoLab.mas_bottom);
    }];


    [self.sureBtn hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(75), AUTO(32)));
    }];
    WeakSelf;
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBtnClickBlock) {
            weakSelf.JCSureBtnClickBlock();
        }
    }];
}

- (void)data {
//    self.infoLab.text = ;
//    self.timeLab.text = @"2020-10-15 ";
}

- (void)setProductModel:(JCBigDataMonthProduceModel *)productModel {
    _productModel = productModel;
    if (productModel.distance_day.length>0) {
        NSString *endDay = [NSString stringWithFormat:@"距离服务结束还有 %@ 天",productModel.distance_day];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:endDay];
        NSRange range = [endDay rangeOfString:productModel.distance_day];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
        }
        self.infoLab.attributedText = attr;
    }
    self.timeLab.text = [NSString stringWithFormat:@"%@ 到期",productModel.end_date];

}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"立即续费" FontSize:AUTO(14) Weight:1 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg") forState:0];
    }
    return _sureBtn;
}

@end
