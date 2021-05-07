//
//  JCHongbangDetailCitationCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangDetailCitationCell.h"

@implementation JCHongbangDetailCitationCell

- (void)initViews {
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-15));
    }];
}

- (void)setTjInfoDetailBall:(JCWTjInfoDetailBall *)tjInfoDetailBall {
    _tjInfoDetailBall = tjInfoDetailBall;
    self.contentLab.text = tjInfoDetailBall.citation;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;;
}
@end
