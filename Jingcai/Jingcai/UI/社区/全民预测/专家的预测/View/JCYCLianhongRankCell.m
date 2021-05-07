//
//  JCYCLianhongRankCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCLianhongRankCell.h"

@implementation JCYCLianhongRankCell

- (void)initViews {
    
    [self.contentView addSubview:self.rankImgView];
    [self.rankImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(28), AUTO(28)));
    }];
    
    [self.contentView addSubview:self.rankLab];
    [self.rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(50)));
    }];
    
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rankLab.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(44));
    }];
    
    [self.contentView addSubview:self.qianyueImgView];
    [self.qianyueImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headImgView.mas_centerX);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(15)));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(AUTO(3));
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.width.mas_lessThanOrEqualTo(AUTO(120));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.lianHongImgView];
    [self.lianHongImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_right).offset(AUTO(10));
        make.bottom.equalTo(self.nameLab).offset(AUTO(-2));
        make.size.mas_equalTo(CGSizeMake(AUTO(18), AUTO(27)));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(5));
    }];
    
    
    
    [self.contentView addSubview:self.lianhongLabel];
    [self.lianhongLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.qianyueImgView);
         make.right.offset(AUTO(-15));
         make.height.mas_equalTo(AUTO(18));
    }];
    
    [self.contentView addSubview:self.lianhongLab];
    [self.lianhongLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self.lianhongLabel.mas_top).offset(0);
    }];
    
    WeakSelf;
    [self.lianhongLab bk_whenTapped:^{
        if (weakSelf.JCJumpBlock) {
            weakSelf.JCJumpBlock(weakSelf.model);
        }
    }];
    
    [self.lianhongLabel bk_whenTapped:^{
        if (weakSelf.JCJumpBlock) {
            weakSelf.JCJumpBlock(weakSelf.model);
        }
    }];
    
    
//    [self data];
}


- (void)setModel:(JCYCRankModel *)model {
    _model = model;
    
    self.nameLab.text = model.user_name;;
    self.qianyueImgView.hidden = [model.top integerValue]==1?NO:YES;
    self.lianHongImgView.hidden = [model.histroy_hong integerValue]>=10?NO:YES;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = model.user_name;
    self.lianhongLab.text = model.histroy_hong;
    if ([model.tuijian_count integerValue]>0) {
        if ([model.top integerValue]==1) {
             self.infoLab.text = [NSString stringWithFormat:@"共 %@ 场预测方案",model.tuijian_count];
            [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.headImgView).offset(AUTO(3));
                make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
                make.width.mas_lessThanOrEqualTo(AUTO(120));
                make.height.mas_equalTo(AUTO(20));
            }];
        }
    }else{
        self.infoLab.text = @"";
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headImgView);
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
            make.width.mas_lessThanOrEqualTo(AUTO(120));
            make.height.mas_equalTo(AUTO(20));
        }];
    }
   
}

- (UIImageView *)rankImgView {
    if (!_rankImgView) {
        _rankImgView = [UIImageView new];
    }
    return _rankImgView;
}

- (UILabel *)rankLab {
    if (!_rankLab) {
        _rankLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _rankLab;;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _headImgView;
}

- (UIImageView *)qianyueImgView {
    if (!_qianyueImgView) {
        _qianyueImgView = [UIImageView new];
        _qianyueImgView.image = JCIMAGE(@"jc_qianyue_tag");
    }
    return _qianyueImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;;
}

- (UIImageView *)lianHongImgView {
    if (!_lianHongImgView) {
        _lianHongImgView = [UIImageView new];
        _lianHongImgView.image = JCIMAGE(@"jc_lianhong_tag");
    }
    return _lianHongImgView;
}

- (UILabel *)lianhongLabel {
    if (!_lianhongLabel) {
        _lianhongLabel = [UILabel initWithTitle:@"连红" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
        _lianhongLabel.userInteractionEnabled = YES;
    }
    return _lianhongLabel;;
}

- (UILabel *)lianhongLab {
    if (!_lianhongLab) {
        _lianhongLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _lianhongLab.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:AUTO(22)];
        _lianhongLab.userInteractionEnabled = YES;
    }
    return _lianhongLab;;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;;
}

@end
