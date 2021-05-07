//
//  JCYCFriendUserTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCFriendUserTopView.h"

@implementation JCYCFriendUserTopView

- (void)initViews {
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(98), AUTO(16)));
    }];
    
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.imgView);
//        make.left.equalTo(self.imgView.mas_right).offset(AUTO(8));
    }];
//
//    UIView *lineView = [UIView new];
//    [self addSubview:lineView];
//    lineView.backgroundColor = COLOR_F2F2F2;
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(0);
//        make.right.offset(0);
//        make.bottom.offset(0);
//        make.height.mas_equalTo(1);
//    }];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
//        _imgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgView;;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_713A08 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    }
    return _titleLab;
}

@end
