//
//  JCSystemSettingCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/4.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCSystemSettingCell.h"

@implementation JCSystemSettingCell

- (void)initViews {
    
    self.backgroundColor = JCWhiteColor;
    self.contentView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(7), AUTO(12)));
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}


- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"mine_arrow_gray");
    }
    return _indicateImgView;
}

@end
