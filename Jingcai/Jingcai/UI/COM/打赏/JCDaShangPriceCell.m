//
//  JCDaShangPriceCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDaShangPriceCell.h"

@implementation JCDaShangPriceCell

- (void)initViews {
    [self.contentView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
//    [self data];
}

- (void)setModel:(JCCaiyunBall *)model {
    _model = model;
    self.priceLab.text = [NSString stringWithFormat:@"%ld红币",model.prize];
    if (model.state_issel) {
        self.priceLab.backgroundColor = COLOR_EF2F2F;
        self.priceLab.textColor = JCWhiteColor;
    }else{
        self.priceLab.backgroundColor = JCWhiteColor;
        self.priceLab.textColor = COLOR_EF2F2F;
    }
}



- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _priceLab.layer.cornerRadius = 4;
        _priceLab.layer.masksToBounds = YES;
        _priceLab.layer.borderColor = COLOR_EF2F2F.CGColor;
        _priceLab.layer.borderWidth = 1;
    }
    return _priceLab;
}

@end
