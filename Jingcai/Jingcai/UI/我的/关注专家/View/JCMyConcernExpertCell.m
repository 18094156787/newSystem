//
//  JCMyConcernExpertCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyConcernExpertCell.h"

@implementation JCMyConcernExpertCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.countLab];
        [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImgView).offset(-3);
            make.left.equalTo(self.headImgView.mas_right).offset(-12);
            make.width.height.mas_equalTo(18);
        }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(AUTO(2));
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
    if ([model.fensi integerValue]>0) {
        self.fansLab.text = [NSString stringWithFormat:@"粉丝数 %@人",model.fensi];
    }else{
        self.fansLab.text = @"";
    }
    
    
    if ([model.is_subscribe isEqualToString:@"0"]||[model.is_subscribe isEqualToString:@"关注"]) {
        [self.concernBtn setTitle:@"+关注" forState:0];
        self.concernBtn.backgroundColor = JCBaseColor;
//        self.concernBtn.layer.borderColor = JCBaseColor.CGColor;
//        [self.concernBtn setTitleColor:JCWhiteColor forState:0];
    }else{
        self.concernBtn.backgroundColor = COLOR_9F9F9F;
        [self.concernBtn setTitle:@"已关注" forState:0];
//        self.concernBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
//        [self.concernBtn setTitleColor:COLOR_999999 forState:0];
    }
    
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)fansLab {
    if (!_fansLab) {
        _fansLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _fansLab;
}

- (UIButton *)concernBtn {
    if (!_concernBtn) {
        _concernBtn = [UIButton initWithText:@"" FontSize:AUTO(13) Weight:1 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
//        _concernBtn.layer.borderColor = JCBaseColor.CGColor;
//        _concernBtn.layer.borderWidth = 0.5;
        _concernBtn.layer.cornerRadius = AUTO(15);
        _concernBtn.layer.masksToBounds = YES;
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
