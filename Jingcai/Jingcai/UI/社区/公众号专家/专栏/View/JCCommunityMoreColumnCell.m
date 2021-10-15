//
//  JCCommunityMoreColumnCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCCommunityMoreColumnCell.h"

@implementation JCCommunityMoreColumnCell

- (void)initViews {
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(110), AUTO(94)));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView);
        make.left.equalTo(self.imgView.mas_right).offset(AUTO(8));
        make.right.offset(AUTO(-10));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(4));
        make.left.equalTo(self.titleLab);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(4));
        make.right.offset(AUTO(-10));
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(12));
        make.right.offset(AUTO(-10));
        make.bottom.equalTo(self.imgView);
    }];

}

- (void)data {
    self.imgView.backgroundColor = JCBaseColor;
    self.titleLab.text = @"英超精选方案推荐英超精选方案推荐";
    self.headImgView.backgroundColor = JCBaseColor;
    self.nameLab.text = @"老詹带你飞";
    self.contentLab.text = @"擅长足球解盘，让足彩更简单明了；分享解读比赛的思路，在鲸猜带你一起红！";
    
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
        _contentLab.numberOfLines = 2;
    }
    return _contentLab;
}
@end
