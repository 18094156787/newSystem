//
//  JCActivityResultWinnerTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityResultWinnerTableViewCell.h"

@implementation JCActivityResultWinnerTableViewCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(40));
        make.centerX.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(64));
    }];
    
    UIImageView *iconImgView = [UIImageView new];
    iconImgView.image = JCIMAGE(@"active_ic_crown");
    [self.contentView addSubview:iconImgView];
    [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(AUTO(-13));
        make.right.equalTo(self.headImgView).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(26)));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView.mas_bottom).offset(5);
        make.centerX.equalTo(self.contentView);
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
        _headImgView.layer.borderColor = UIColorFromRGB(0xFFAE28).CGColor;
        _headImgView.layer.borderWidth = 1;
        _headImgView.layer.cornerRadius = AUTO(32);
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


@end
