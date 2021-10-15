//
//  JCDakaHistoryTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDakaHistoryTitleView.h"

@implementation JCDakaHistoryTitleView

- (void)initViews {
    
    self.titleLab.text = @"- 以下是历史方案 -";
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(AUTO(-5));
        make.centerX.equalTo(self);
        make.left.right.offset(0);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
