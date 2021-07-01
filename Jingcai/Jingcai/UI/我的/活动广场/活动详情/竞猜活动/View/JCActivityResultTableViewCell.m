//
//  JCActivityResultTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityResultTableViewCell.h"

@implementation JCActivityResultTableViewCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(56));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(24));
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-100));
    }];
    

}


- (void)setModel:(JCActivityOptionModel *)model {
    _model = model;
    self.titleLab.text = model.name;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
//        _headImgView.layer.borderColor = COLOR_DBDBDB.CGColor;
//        _headImgView.layer.borderWidth = 1;
        _headImgView.layer.cornerRadius = AUTO(28);
        _headImgView.layer.masksToBounds = YES;
    }
    return _headImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

@end
