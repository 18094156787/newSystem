//
//  JCTopRankList_LianHongCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTopRankList_LianHongCell.h"

@implementation JCTopRankList_LianHongCell

- (void)initViews {
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(24)));
    }];
    

    
    [self.contentView addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(20)));
    }];
    
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(36), AUTO(36)));
    }];
    
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(-3);
        make.left.equalTo(self.headImgView.mas_right).offset(-12);
        make.width.height.mas_equalTo(18);
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
        make.top.equalTo(self.headImgView).offset(AUTO(3));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.top.equalTo(self.nameLab.mas_bottom).offset(2);
    }];
    
    
    
    
    [self.contentView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_right).offset(2);
        make.centerY.equalTo(self.nameLab);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.concernBtn];
    [self.concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(24)));
    }];
    
    WeakSelf;
    [self.concernBtn bk_whenTapped:^{
        if (weakSelf.JCConcernBlock) {
            weakSelf.JCConcernBlock(weakSelf.model);
        }
    }];
 
    
}



- (void)setModel:(JCCommunityRankModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"ic_hb_default")];
    self.countLab.text = model.on_sale_count;
    self.countLab.hidden = [model.on_sale_count integerValue]==0?YES:NO;
    self.nameLab.text = model.user_name;
    self.tagLab.text = [NSString stringWithFormat:@"  %@连红  ",model.hong];
    
    if ([model.is_subscribe isEqualToString:@"关注"]) {
        [self.concernBtn setTitle:@"+关注" forState:0];
        self.concernBtn.backgroundColor = JCBaseColor;
    }else{
        [self.concernBtn setTitle:@"已关注" forState:0];
        self.concernBtn.backgroundColor = COLOR_9F9F9F;
    }

    self.infoLab.text = [NSString stringWithFormat:@"历史:%@连红",model.history_hong];
}




- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(18)];
    }
    return _headImgView;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6]
                         andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _numberLab;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_333333
                         andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor
                      andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _tagLab.layer.borderColor = JCBaseColor.CGColor;
        _tagLab.layer.borderWidth = 0.5;
    }
    return _tagLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F
                         andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIButton *)concernBtn {
    if (!_concernBtn) {
        _concernBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_concernBtn hg_setAllCornerWithCornerRadius:AUTO(12)];
//        [_concernBtn addTarget:self action:@selector(concernBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _concernBtn;
}
- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:12 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor
                          andTextAlignment:NSTextAlignmentCenter];
        [_countLab hg_setAllCornerWithCornerRadius:9];
    }
    return _countLab;
}
@end
