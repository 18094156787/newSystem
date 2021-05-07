//
//  JCHistorySeachTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistorySeachTitleView.h"

@implementation JCHistorySeachTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

@end
