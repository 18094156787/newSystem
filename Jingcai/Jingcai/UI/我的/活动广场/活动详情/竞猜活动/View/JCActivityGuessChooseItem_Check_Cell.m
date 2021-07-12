//
//  JCActivityGuessChooseItem_Check_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessChooseItem_Check_Cell.h"

@implementation JCActivityGuessChooseItem_Check_Cell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F0F0F0;
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = JCClearColor.CGColor;
    bgView.layer.cornerRadius = 4;
    bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.bgView = bgView;
    
    
    [bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.centerY.equalTo(bgView);
        make.width.height.mas_equalTo(40);
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(8);
        make.centerY.equalTo(bgView);
        make.right.offset(0);
    }];
    
//    [bgView addSubview:self.infoLab];
//    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.headImgView.mas_right).offset(8);
//        make.top.equalTo(self.titleLab.mas_bottom);
//        make.height.mas_equalTo(20);
//        make.right.offset(0);
//    }];
//
//    [bgView addSubview:self.selImgView];
//    [self.selImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.offset(0);
//        make.width.height.mas_equalTo(AUTO(32));
//    }];
//
//    [bgView addSubview:self.chooseImgView];
//    [self.chooseImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.bottom.equalTo(bgView);
//        make.width.height.mas_equalTo(16);
//    }];

}


- (void)setModel:(JCActivityOptionModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
    self.titleLab.text = model.name;

    
//    self.bgView.layer.borderColor = [model.local_choice integerValue]==1?JCBaseColor.CGColor:JCClearColor.CGColor;
    
//    self.selImgView.hidden = [model.user_choice integerValue]==1?NO:YES;
//    self.chooseImgView.hidden = [model.correct integerValue]==1?NO:YES;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
//        _headImgView.backgroundColor = UIColorFromRGB(0xD8D8D8);
        [_headImgView hg_setAllCornerWithCornerRadius:20];
    }
    return _headImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIImageView *)chooseImgView {
    if (!_chooseImgView) {
        _chooseImgView = [UIImageView new];
        _chooseImgView.image = JCIMAGE(@"active_ic_choice");
        _chooseImgView.hidden = YES;
    }
    return _chooseImgView;
}

- (UIImageView *)selImgView {
    if (!_selImgView) {
        _selImgView = [UIImageView new];
        _selImgView.image = JCIMAGE(@"ic_active_tj");
        _selImgView.hidden = YES;
    }
    return _selImgView;
}

@end
