//
//  JCKindCompleteUserHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindCompleteUserHeadView.h"

@implementation JCKindCompleteUserHeadView

- (void)initViews {
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.offset(0);
        make.height.mas_equalTo(32);
    }];
}

- (void)setContent:(NSString *)content {
    _content = content;
    self.contentLab.text = [NSString stringWithFormat:@"达成人数：%@人",content];
}

- (void)setScore:(NSString *)score {
    _score = score;
    self.contentLab.text = [NSString stringWithFormat:@"我的积分：%@",score];
}

- (KKPaddingLabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [KKPaddingLabel initWithTitle:@"" andFont:14 andWeight:1 andTextColor:COLOR_FB5835 andBackgroundColor:UIColorFromRGB(0xFFE6DE) andTextAlignment:NSTextAlignmentCenter];
        _contentLab.padding = UIEdgeInsetsMake(0, 12, 0, 12);
        [_contentLab hg_setAllCornerWithCornerRadius:16];
    }
    return _contentLab;
}


@end
