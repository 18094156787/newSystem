//
//  JCSearchExpertCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCSearchExpertCell.h"

@implementation JCSearchExpertCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.countLab];
        [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImgView).offset(-3);
            make.left.equalTo(self.headImgView.mas_right).offset(-12);
            make.width.height.mas_equalTo(18);
        }];
    
    [self.contentView addSubview:self.qyImgView];
    [self.qyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headImgView);
        make.bottom.equalTo(self.headImgView).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(14)));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self.contentView addSubview:self.fansLab];
    [self.fansLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLab.mas_bottom);
        make.left.equalTo(self.nameLab);
//        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self.contentView addSubview:self.concernBtn];
    [self.concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(0.5);
    }];
    
    WeakSelf;
    [self.concernBtn bk_whenTapped:^{
        if (weakSelf.JCConcernBlock) {
            weakSelf.JCConcernBlock();
        }
    }];
}

- (void)setModel:(JCWExpertBall *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    
    self.countLab.text = model.on_sale_count;
        self.countLab.hidden = [model.on_sale_count integerValue]==0?YES:NO;
    self.nameLab.text = model.user_name;
    self.fansLab.text = [NSString stringWithFormat:@"粉丝数 %@人",model.fensi];
    self.qyImgView.hidden = [model.type integerValue]==1?NO:YES;
    if ([model.is_subscribe isEqualToString:@"关注"]||[model.is_subscribe isEqualToString:@"0"]||model.is_subscribe.length==0) {
        [self.concernBtn setTitle:@"+关注" forState:0];
        self.concernBtn.backgroundColor = JCBaseColor;

        [self.concernBtn setTitleColor:JCWhiteColor forState:0];
    }else{
        self.concernBtn.backgroundColor = COLOR_9F9F9F;
        [self.concernBtn setTitle:model.is_subscribe forState:0];
        if ([model.is_subscribe isEqualToString:@"1"]) {
            [self.concernBtn setTitle:@"已关注" forState:0];
        }
//        [self.concernBtn setTitleColor:COLOR_999999 forState:0];
    }
    
    
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(18)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)fansLab {
    if (!_fansLab) {
        _fansLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _fansLab;
}

- (UIButton *)concernBtn {
    if (!_concernBtn) {
        _concernBtn = [UIButton initWithText:@"" FontSize:AUTO(13) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _concernBtn.layer.cornerRadius = AUTO(15);
        _concernBtn.layer.masksToBounds = YES;
    }
    return _concernBtn;
}

-(UIImageView *)qyImgView {
    if (!_qyImgView) {
        _qyImgView = [UIImageView new];
        _qyImgView.image = JCIMAGE(@"ic_qy");
        _qyImgView.hidden  = YES;
    }
    return _qyImgView;
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
