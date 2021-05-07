//
//  JCDakaTopExpertCollectionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/5.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaTopExpertCollectionCell.h"

@implementation JCDakaTopExpertCollectionCell

- (void)initViews {

    
//    self.backgroundColor = JCBaseColor;
    [self.contentView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(44));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headView).offset(AUTO(7.5));
        make.centerX.equalTo(self.contentView);
//        make.left.right.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(60));
        make.height.mas_equalTo(AUTO(15));
    }];
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom);
      make.centerX.equalTo(self.contentView);
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
//        self.headView.image = nil;
//        self.headView.image = ;
        [self.headView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:model.localImage];
        
    }else{
        [self.headView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    }
    self.nameLab.text = NonNil(model.user_name);
    
    if (self.isHongbang) {
        self.infoLab.backgroundColor = model.zhong.length>0?JCBaseColor:JCClearColor;
        self.infoLab.text = NonNil(model.zhong);
    }else{
        self.infoLab.backgroundColor = model.zhong.length>0?JCBaseColor:JCClearColor;
        self.infoLab.text = NonNil(model.zhong);
    }
    
    
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
