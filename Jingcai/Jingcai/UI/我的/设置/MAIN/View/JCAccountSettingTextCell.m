//
//  JCAccountSettingTextCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAccountSettingTextCell.h"

@implementation JCAccountSettingTextCell

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
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.rightLabel];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftLabel.mas_right).offset(10);
        make.right.equalTo(self.indicateImgView.mas_left).offset(-8);
        make.centerY.equalTo(self.contentView);
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

- (void)setRightTitle:(NSString *)rightTitle {
    _rightTitle = rightTitle;
    _rightLabel.text = rightTitle;
}

- (void)setIsCheck:(BOOL)isCheck {
    _isCheck = isCheck;
    self.checkLabel.hidden = isCheck?NO:YES;
    
    [self.leftLabel mas_remakeConstraints
    :^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.centerY.equalTo(self.contentView);
    }];
    if (isCheck) {

        [self.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftLabel.mas_right).offset(10);
            make.right.equalTo(self.checkLabel.mas_left).offset(-8);
            make.centerY.equalTo(self.contentView);
        }];
    }else{

        [self.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftLabel.mas_right).offset(10);
            make.right.equalTo(self.indicateImgView.mas_left).offset(-8);
            make.centerY.equalTo(self.contentView);
        }];
    }
}

- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _leftLabel;
}

- (UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _rightLabel;
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
