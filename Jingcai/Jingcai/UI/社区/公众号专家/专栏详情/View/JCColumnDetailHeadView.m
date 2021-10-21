//
//  JCColumnDetailHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailHeadView.h"

@implementation JCColumnDetailHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, AUTO(8), 0));
    }];
    
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(110), AUTO(94)));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView);
        make.left.equalTo(self.imgView.mas_right).offset(AUTO(8));
        make.right.offset(AUTO(-10));
        make.height.mas_equalTo(AUTO(20));
    }];
    

    
    [self addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
        make.left.equalTo(self.titleLab);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(4));
        make.right.offset(AUTO(-15));
    }];
    
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView);
        make.top.equalTo(self.imgView.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-15));
    }];
    
    [self addSubview:self.concernBtn];
    [self.concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imgView);
        make.left.equalTo(self.titleLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(72), AUTO(24)));
    }];
    

    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.concernBtn);
        make.right.offset(AUTO(-15));
    }];
    
    WeakSelf;
    [self.concernBtn bk_whenTapped:^{
        if (weakSelf.JCConcernBlock) {
            weakSelf.JCConcernBlock();
        }
    }];

}

- (void)setDetailModel:(JCColumnDetailModel *)detailModel {
    _detailModel = detailModel;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:detailModel.image]];
    self.titleLab.text = detailModel.title;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:detailModel.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = detailModel.user_name;
    self.countLab.text = [NSString stringWithFormat:@"%@人已关注",NonNil(detailModel.subscribe)];
    self.contentLab.text = detailModel.synopsis;
    [self configConcernStatus];
}

- (void)configConcernStatus {
    if ([self.detailModel.is_subscribe integerValue]==1) {
        self.concernBtn.backgroundColor = COLOR_9F9F9F;
        [self.concernBtn setTitle:@"已关注" forState:0];
        [self.concernBtn setTitle:@"已关注" forState:UIControlStateHighlighted];
    }else{
        self.concernBtn.backgroundColor = JCBaseColor;
        [self.concernBtn setTitle:@"关注专栏" forState:0];
        [self.concernBtn setTitle:@"关注专栏" forState:UIControlStateHighlighted];
    }

}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        [_imgView hg_setAllCornerWithCornerRadius:2];
    }
    return _imgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIButton *)concernBtn {
    if (!_concernBtn) {
        _concernBtn = [UIButton initWithText:@"关注专栏" FontSize:AUTO(12) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_concernBtn setTitle:@"关注专栏" forState:UIControlStateHighlighted];
        [_concernBtn hg_setAllCornerWithCornerRadius:2];
    }
    return _concernBtn;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}


@end
