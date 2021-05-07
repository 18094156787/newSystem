//
//  JCMineTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMineTableViewCell.h"

@implementation JCMineTableViewCell

- (void)initViews {
    
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(20));
    }];
    
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-30);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(7), AUTO(12)));
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"mine_arrow_gray");
    }
    return _indicateImgView;
}

@end
