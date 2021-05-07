//
//  JCMatchNoDataFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchNoDataFootView.h"

@implementation JCMatchNoDataFootView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.right.offset(0);
//        make.centerY.equalTo(self)
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"- 暂无更多比赛 -" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
