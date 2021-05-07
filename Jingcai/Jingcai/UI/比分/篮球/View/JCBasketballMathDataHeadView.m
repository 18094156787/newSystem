//
//  JCBasketballMathDataHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketballMathDataHeadView.h"

@implementation JCBasketballMathDataHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
        make.centerY.centerX.equalTo(self);
    }];
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
