//
//  JCActivityPrizeCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityPrizeTableViewCell.h"

@implementation JCActivityPrizeTableViewCell

- (void)initViews {
    self.backgroundColor = JCClearColor;

    self.bgView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.bgView];
    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    self.bgView.image = JCIMAGE(@"hb_ticket_nor");
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(8), AUTO(15), 0, AUTO(15)));
    }];
    
    [self.bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.height.mas_equalTo(AUTO(20));
        make.width.mas_greaterThanOrEqualTo(AUTO(88));
    }];
    
    [self.bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.infoLab);
        make.width.mas_equalTo(AUTO(30));
    }];

    [self.bgView addSubview:self.contentLab1];
    [self.contentLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(100));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(25));
        make.height.mas_greaterThanOrEqualTo(AUTO(40));
        make.bottom.offset(AUTO(-15));
        
//        make.height.mas_equalTo(AUTO(17));
       
    }];
    
    [self.bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(15));
        make.width.mas_equalTo(AUTO(90));
    }];

    
//    [self.bgView addSubview:self.contentLab2];
//    [self.contentLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentLab1);
//        make.top.equalTo(self.contentLab1.mas_bottom);
////        make.height.mas_greaterThanOrEqualTo(AUTO(20));
//        make.right.offset(AUTO(-15));
//    }];
//
//
//
//    [self.bgView addSubview:self.contentLab3];
//    [self.contentLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentLab1);
//        make.top.equalTo(self.contentLab2.mas_bottom);
////        make.height.mas_greaterThanOrEqualTo(AUTO(20));
//        make.right.offset(AUTO(-15));
//        make.bottom.offset(AUTO(-15));
//    }];
//

}

- (void)setModel:(JCActivityGoodsModel *)model {
    _model = model;
    //    type 物品类型 1红币 2积分 3免单券 4优惠券 5固定红包 6随机红包
    self.infoLab.text = [NSString stringWithFormat:@"  %@  ",model.goods_name];
    self.countLab.text = [NSString stringWithFormat:@"x%@",model.count];
    
  
    NSString *content = @"";
    if ([model.use_conditions integerValue]>0) {
        content = [NSString stringWithFormat:@"限%@元以上使用",model.use_conditions];
    }
    if (model.use_range.length>0) {
        content = [content stringByAppendingString:[NSString stringWithFormat:@"\n仅用于%@方案",model.use_range]];
    }
    if (model.introduce.length>0) {
        content = [content stringByAppendingString:[NSString stringWithFormat:@"\n%@",model.introduce]];
    }
    
    self.contentLab1.text = content;
    
//    self.contentLab2.text = model.use_range.length>0?[NSString stringWithFormat:@"仅用于%@方案",model.use_range]:@"";
//    self.contentLab3.text = model.introduce;

    
    NSString *title = [NSString stringWithFormat:@"¥%@",model.total_max];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:@"¥"];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:range];
    self.priceLab.attributedText = attr;
    
    if ([model.type integerValue]==1) {
        
        self.priceLab.text = model.total_max;
        
    }else if ([model.type integerValue]==2) {
        

    }else if ([model.type integerValue]==3) {
        self.priceLab.text = @"免单券";

    }else if ([model.type integerValue]==4) {
   

    }else if ([model.type integerValue]==5) {
        

    }else if ([model.type integerValue]==6) {

        self.priceLab.text = @"?";
    }
}

- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [UIImageView new];
    }
    return _bgView;
}


- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _priceLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(24)];
    }
    return _priceLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:COLOR_FFC6C6 andTextAlignment:NSTextAlignmentCenter];
        [_infoLab hg_setCornerOnLeftTopAndBottomRightWithRadius:5];
    }
    return _infoLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _countLab;
}



- (UILabel *)contentLab1 {
    if (!_contentLab1) {
        _contentLab1 = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab1.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)];
        _contentLab1.numberOfLines = 0;
    }
    return _contentLab1;
}

- (UILabel *)contentLab2 {
    if (!_contentLab2) {
        _contentLab2 = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab2.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)];
        _contentLab2.numberOfLines = 0;
    }
    return _contentLab2;
}



- (UILabel *)contentLab3 {
    if (!_contentLab3) {
        _contentLab3 = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab3.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)];
        _contentLab3.numberOfLines = 0;
    }
    return _contentLab3;
}

@end
