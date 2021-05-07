//
//  JCYCRankTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCRankTableViewCell.h"

@implementation JCYCRankTableViewCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
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
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.width.mas_lessThanOrEqualTo(AUTO(120));
    }];
    
    [self.contentView addSubview:self.rankImgView];
    [self.rankImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_right).offset(AUTO(10));
        make.bottom.equalTo(self.nameLab).offset(AUTO(-2));
        make.size.mas_equalTo(CGSizeMake(AUTO(18), AUTO(27)));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.qianyueImgView);
         make.right.offset(AUTO(-15));
         make.height.mas_equalTo(AUTO(18));
    }];
    
    [self.contentView addSubview:self.rankLab];
    [self.rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self.infoLab.mas_top).offset(0);
    }];
    
    WeakSelf;
    [self.infoLab bk_whenTapped:^{
        if (weakSelf.JCJumpBlock) {
            weakSelf.JCJumpBlock(weakSelf.model);
        }
    }];
    
    [self.rankLab bk_whenTapped:^{
        if (weakSelf.JCJumpBlock) {
            weakSelf.JCJumpBlock(weakSelf.model);
        }
    }];

}

- (void)setModel:(JCYCRankModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = model.user_name;
    
    self.rankImgView.hidden = [model.history_hong integerValue]>=10?NO:YES;
    self.qianyueImgView.hidden =  [model.guess_user_infor_top integerValue]==1?NO:YES;
    if ([model.lianhong integerValue]>0) {
        self.infoLab.text = @"连红";
        self.rankLab.text = model.lianhong;
    }else{
        if ([model.mingzhong integerValue]>0) {
            self.rankLab.text = model.mingzhong;
            self.infoLab.text = @"命中";
        }
    }

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

- (UIImageView *)rankImgView {
    if (!_rankImgView) {
        _rankImgView = [UIImageView new];
        _rankImgView.image = JCIMAGE(@"jc_lianhong_tag");
    }
    return _rankImgView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"连红" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.userInteractionEnabled = YES;
    }
    return _infoLab;;
}

- (UILabel *)rankLab {
    if (!_rankLab) {
        _rankLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _rankLab.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:AUTO(22)];
        _rankLab.userInteractionEnabled = YES;
    }
    return _rankLab;;
}

@end
