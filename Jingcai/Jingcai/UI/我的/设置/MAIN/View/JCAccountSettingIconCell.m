//
//  JCAccountSettingIconCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAccountSettingIconCell.h"

@implementation JCAccountSettingIconCell

- (void)initViews {
    [self.contentView addSubview:self.leftLabel];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-16);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(8, 15));
    }];

    [self.contentView addSubview:self.checkLabel];
    [self.checkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicateImgView.mas_left).offset(-8);
        make.height.mas_equalTo(AUTO(24));
        make.width.mas_equalTo(AUTO(60));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicateImgView.mas_left).offset(-8);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(60);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.bottom.right.offset(0);
        make.height.mas_equalTo(1);
    }];
}


- (void)setLeftTitle:(NSString *)leftTitle {
    _leftTitle = leftTitle;
    _leftLabel.text = leftTitle;
}

- (void)setIconImageUrl:(NSString *)iconImageUrl {
    _iconImageUrl = iconImageUrl;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:iconImageUrl] placeholderImage:[UIImage imageNamed:@"userImg_default"]];
}

- (void)setIsCheck:(BOOL)isCheck {
    _isCheck = isCheck;
    self.checkLabel.hidden = isCheck?NO:YES;
    if (isCheck) {
        [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.checkLabel.mas_left).offset(-8);
            make.centerY.equalTo(self.contentView);
            make.width.height.mas_equalTo(60);
        }];

    }else{

        [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.indicateImgView.mas_left).offset(-8);
            make.centerY.equalTo(self.contentView);
            make.width.height.mas_equalTo(60);
        }];
    }
}

- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _leftLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        [_iconImageView hg_setAllCornerWithCornerRadius:30];
    }
    return _iconImageView;
}

- (KKPaddingLabel *)checkLabel {
    if (!_checkLabel) {
        _checkLabel = [KKPaddingLabel initWithTitle:@"审核中" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _checkLabel.layer.borderColor = JCBaseColor.CGColor;
        _checkLabel.layer.borderWidth = 1;
        _checkLabel.layer.cornerRadius = AUTO(12);
        _checkLabel.layer.masksToBounds = YES;
        _checkLabel.padding = UIEdgeInsetsMake(0, 12, 0, 12);
    }
    return _checkLabel;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"post_back");
        
    }
    return _indicateImgView;
}
@end
