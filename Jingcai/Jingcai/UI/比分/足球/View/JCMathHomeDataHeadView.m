//
//  JCMathHomeDataHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMathHomeDataHeadView.h"

@implementation JCMathHomeDataHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.centerX.equalTo(self);
    }];
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)];
    }
    return _titleLab;
}

@end
