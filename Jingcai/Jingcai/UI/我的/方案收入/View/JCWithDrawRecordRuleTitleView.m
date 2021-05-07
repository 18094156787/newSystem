//
//  JCWithDrawRecordRuleTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWithDrawRecordRuleTitleView.h"

@implementation JCWithDrawRecordRuleTitleView


- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(30));
        make.centerX.equalTo(self);
    }];
    
    [self addSubview:self.leftLineImgView];
    [self.leftLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.equalTo(self.titleLab.mas_left).offset(-8);
        make.size.mas_equalTo(CGSizeMake(45, 1));
    }];
    
    [self addSubview:self.rightLineImgView];
    [self.rightLineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.left.equalTo(self.titleLab.mas_right).offset(8);
        make.size.mas_equalTo(CGSizeMake(45, 1));
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"专家号收入计算方式" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}
- (UIImageView *)leftLineImgView {
    if (!_leftLineImgView) {
        _leftLineImgView = [UIImageView new];
        _leftLineImgView.image = JCIMAGE(@"match_dec_left");
    }
    return _leftLineImgView;
}
- (UIImageView *)rightLineImgView {
    if (!_rightLineImgView) {
        _rightLineImgView = [UIImageView new];
        _rightLineImgView.image = JCIMAGE(@"match_dec_right");
    }
    return _rightLineImgView;
}
@end
