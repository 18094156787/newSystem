//
//  JCPostPlanCommonCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPostPlanCommonCell.h"

@implementation JCPostPlanCommonCell


- (void)initViews {
    self.contentView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-25));
        make.centerY.equalTo(self.contentView);
    }];
    
//    [self.contentView addSubview:self.chooseBtn];
//    [self.chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(0);
//        make.centerY.equalTo(self.contentView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(35)));
//    }];
    
    [self.contentView addSubview:self.switchBtn];
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(35)));
    }];
    
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(7), AUTO(14)));
    }];
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self);
        make.left.offset(AUTO(15));
        make.height.mas_equalTo(1);
    }];
}

- (void)setModel:(JCPostPlanItemModel *)model {
    _model = model;
    if (model.is_sf||model.is_push) {
        self.imgView.hidden = NO;
        self.switchBtn.hidden = YES;
    }else{
        self.imgView.hidden = YES;
        self.switchBtn.hidden = NO;

    }
    if (model.is_sf) {
        self.titleLab.text = @"收费方式";
         self.priceLab.text = model.price;
    }
    if (model.is_bztk) {
        self.titleLab.text = model.bztk_string;
        [self.switchBtn setOn:model.bztk animated:YES];

        self.priceLab.text = @"";
        self.switchBtn.hidden = model.bztk_string.length>0?NO:YES;
    }
    if (model.is_hongbao) {
        self.titleLab.text = @"红包抵扣";
//        self.chooseBtn.selected = model.hongbao;
        [self.switchBtn setOn:model.hongbao animated:YES];
        self.priceLab.text = @"";
    }
    if (model.is_push) {
        self.titleLab.text = @"是否推送";
        self.priceLab.text = model.time;
    }
}

- (void)switchBtnClick:(UISwitch *)sender {
    if (self.model.is_bztk) {
        
        self.model.bztk = sender.isOn;
    }
    if (self.model.is_hongbao) {
        self.model.hongbao = sender.isOn;
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];

    }
    return _titleLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];

    }
    return _priceLab;
}



- (UIButton *)chooseBtn {
    if (!_chooseBtn) {
        _chooseBtn = [UIButton new];
        [_chooseBtn setImage:JCIMAGE(@"icon-UNchosen") forState:0];
        [_chooseBtn setImage:JCIMAGE(@"icon-choose") forState:UIControlStateSelected];
        _chooseBtn.userInteractionEnabled = NO;
    }
    return _chooseBtn;
}

- (UISwitch *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [UISwitch new];
        [_switchBtn addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventValueChanged];
        _switchBtn.onTintColor = JCBaseColor;
    }
    return _switchBtn;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.image = JCIMAGE(@"icon_right");
    }
    return _imgView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor  = COLOR_F0F0F0;
    }
    return _lineView;
}

@end
