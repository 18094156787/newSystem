//
//  JCGaoChouRuleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCGaoChouRuleCell.h"

@implementation JCGaoChouRuleCell

- (void)initViews {

    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.right.offset(AUTO(-15));
        make.bottom.offset(-5);
    }];
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}
@end
