//
//  JCDatabaseAllMatchCollectionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDatabaseAllMatchCollectionCell.h"

@implementation JCDatabaseAllMatchCollectionCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    self.contentView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.width.height.mas_equalTo(AUTO(48));
        make.centerX.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.iconImgView.mas_bottom);
    }];
}

- (void)setModel:(JCDataBaseAreaModel *)model {
    _model = model;
//    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.area_logo]];
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.category_img]];
    
    self.titleLab.text= model.name_zh;
}


- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_030303 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}


@end
