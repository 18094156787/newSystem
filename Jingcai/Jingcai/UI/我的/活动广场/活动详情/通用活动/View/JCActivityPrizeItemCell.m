//
//  JCActivityPrizeItemCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityPrizeItemCell.h"

@implementation JCActivityPrizeItemCell

- (void)initViews {
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.bgView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.centerX.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(37, 37));
    }];
    
    [self.imgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-3);
        make.right.offset(0);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(20);
    }];
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).offset(0);
        make.centerX.equalTo(self.bgView);
        make.left.right.offset(0);
    }];
    


}

- (void)setModel:(JCActivityGoodsModel *)model {
    _model = model;
//    type 物品类型 1红币 2积分 3免单券 4优惠券 5固定红包 6随机红包
    
    self.titleLab.text = [NSString stringWithFormat:@"x%@",model.count];
    self.bgView.backgroundColor = UIColorFromRGB(0xF5FAFF);
    self.priceLab.text = @"";
    if ([model.type integerValue]==1) {
        self.imgView.image = JCIMAGE(@"ic_acitivty_redmony");
        self.bgView.backgroundColor = UIColorFromRGB(0xFFF3F3);
        self.priceLab.text = model.total_max;
    }else if ([model.type integerValue]==2) {
        self.imgView.image = JCIMAGE(@"ic_acitivty_integral");
        self.bgView.backgroundColor = UIColorFromRGB(0xFFF7E9);
        self.priceLab.text = model.total_max;
    }else if ([model.type integerValue]==3) {
        self.imgView.image = JCIMAGE(@"ic_acitivty_free");
        self.bgView.backgroundColor = UIColorFromRGB(0xF5FAFF);
    }else if ([model.type integerValue]==4) {
        self.imgView.image = JCIMAGE(@"ic_acitivty_coupon");
        self.bgView.backgroundColor = UIColorFromRGB(0xFEF3FF);
        self.priceLab.text = model.total_max;
    }else if ([model.type integerValue]==5) {
        self.imgView.image = JCIMAGE(@"ic_acitivty_regular");
        self.bgView.backgroundColor = UIColorFromRGB(0xFFF3F3);
        self.priceLab.text = [NSString stringWithFormat:@"%@",model.total_max];
    }else if ([model.type integerValue]==6) {
        self.imgView.image = JCIMAGE(@"ic_acitivty_random");
        self.bgView.backgroundColor = UIColorFromRGB(0xFFF3F3);
    }
    if ([model.type integerValue]==5) {
        [self.priceLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-3);
            make.left.right.offset(0);
            make.height.mas_equalTo(20);
        }];
    }else {
        [self.priceLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-3);
            make.right.offset(0);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(20);
        }];
    }
//    self.priceLab.text = @"99";
}


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        [_bgView hg_setAllCornerWithCornerRadius:5];
    }
    return _bgView;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
    }
    return _imgView;
}
- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:12 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _priceLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
