//
//  JCHongbangOrderInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangOrderInfoCell.h"

@implementation JCHongbangOrderInfoCell

- (void)initViews {
    self.backgroundColor= JCWhiteColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
//
//    [bgView addSubview:self.titleLab];
//    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.top.offset(0);
//    }];
//
//    [bgView addSubview:self.tagLab];
//    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(AUTO(-15));
//        make.top.offset(0);
//        make.height.mas_equalTo(AUTO(16));
//    }];
    
    
    [bgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    [bgView addSubview:self.priceBgView];
    [self.priceBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.left.right.equalTo(bgView);
        make.height.mas_equalTo(AUTO(40));
        make.bottom.offset(0);
    }];
    
    [self.priceBgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.priceBgView);
    }];


    
    
}


- (void)setInfoModel:(JCWTjInfoDetailBall *)infoModel {
    _infoModel = infoModel;
    if (!infoModel) {
        return;
    }


    
    self.tagLab.text = [NSString stringWithFormat:@"  %@  ",infoModel.classfly_desc];
  
     NSString *price = [NSString stringWithFormat:@"订单金额 %@  红币",@([infoModel.sf floatValue]/100.0f)];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange priceRange = [price rangeOfString:@"订单金额"];
    NSRange hbRange = [price rangeOfString:@"红币"];
    [attri setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:priceRange];
    [attri setAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:hbRange];
    self.priceLab.attributedText = attri;
    
}

- (void)setMatchDataArray:(NSArray *)matchDataArray {
    _matchDataArray = matchDataArray;
    if (matchDataArray.count>0) {
        JCWVerTjInfoMatchBall *model = matchDataArray.firstObject;
        NSString *title = [NSString stringWithFormat:@"%@ VS %@",model.homeName,model.awayName];
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:@"VS"];
        [attributedStr setAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
        self.titleLab.attributedText = attributedStr;
    }
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;
}

- (UIView *)priceBgView {
    if (!_priceBgView) {
        _priceBgView = [UIView new];
    }
    return _priceBgView;
}


- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}
- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _tagLab.layer.borderWidth = 0.5;
        _tagLab.layer.borderColor = JCBaseColor.CGColor;
        _tagLab.layer.cornerRadius = AUTO(8);
        _tagLab.layer.masksToBounds = YES;
    }
    return _tagLab;
}

-(UIImageView *)bzfhImgView {
    if (!_bzfhImgView) {
        _bzfhImgView = [UIImageView new];
        _bzfhImgView.image = JCIMAGE(@"icon_bzfh");
        _bzfhImgView.hidden = YES;
    }
    return _bzfhImgView;
}
@end
