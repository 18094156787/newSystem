//
//  JCRechargeBannerTextCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCRechargeBannerTextCell.h"

@implementation JCRechargeBannerTextCell

- (void)initViews {
    self.contentView.backgroundColor = JCClearColor;
    self.backgroundColor = JCClearColor;
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.right.offset(-15);
    }];
}
- (void)setContent:(NSString *)content {
    _content = content;
    self.titleLab.text = content;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0xEF802F) andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

@end
