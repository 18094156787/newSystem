//
//  JCHongbangTopRankItemCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangTopRankItemCell.h"

@implementation JCHongbangTopRankItemCell

- (void)initViews {

    
//    self.backgroundColor = JCBaseColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.centerX.equalTo(bgView);
        make.width.height.mas_equalTo(AUTO(44));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headView).offset(AUTO(7.5));
        make.centerX.equalTo(bgView);
//        make.left.right.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(60));
        make.height.mas_equalTo(AUTO(15));
    }];
    [bgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom);
      make.centerX.equalTo(bgView);
        make.width.mas_equalTo(AUTO(66));
      make.height.mas_equalTo(AUTO(18));
    }];
    
}

//- (void)data {
//    self.headView.backgroundColor = [UIColor blackColor];
//    self.infoLab.text = @"爆红 7串1";
//    self.nameLab.text = @"足球前瞻";
//}

- (void)setModel:(JCWExpertBall *)model {
    _model= model;
    if (model.localImage) {
        [self.headView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:model.localImage];
    }else{
        [self.headView sd_setImageWithURL:[NSURL URLWithString:model.user_img]];
    }
    self.nameLab.text = NonNil(model.user_name);

    self.infoLab.backgroundColor = model.rank_info.length>0?JCBaseColor:JCClearColor;
    self.infoLab.text = NonNil(model.rank_info);
    
    
}

- (UIImageView *)headView {
    if (!_headView) {
        _headView = [UIImageView new];
        [_headView hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _headView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(9) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
        [_infoLab hg_setAllCornerWithCornerRadius:AUTO(2)];
    }
    return _infoLab;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _nameLab;
}

@end
