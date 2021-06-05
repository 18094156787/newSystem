//
//  JCKindMoreFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindMoreFootView.h"

@implementation JCKindMoreFootView

- (void)initViews {
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(5);
        make.height.mas_equalTo(40);
    }];
    
    WeakSelf;
    [self.contentLab bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];
}

- (void)showMore {
    self.contentLab.text = @"查看更多";
    self.contentLab.userInteractionEnabled = YES;
}

- (void)showNoMore {
    self.contentLab.text = @"";
    self.contentLab.userInteractionEnabled = NO;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"查看更多" andFont:14 andWeight:1 andTextColor:UIColorFromRGB(0xA49F9D) andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _contentLab.userInteractionEnabled = YES;
    }
    return _contentLab;
}

@end
