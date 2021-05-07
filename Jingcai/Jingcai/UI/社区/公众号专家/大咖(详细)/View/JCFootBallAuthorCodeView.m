//
//  JCFootBallAuthorCodeView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/2/11.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFootBallAuthorCodeView.h"

@implementation JCFootBallAuthorCodeView

- (void)initViews {
    [self addSubview:self.codeImgView];
    [self.codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(20));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(256)));
    }];
}

- (void)setUrl:(NSString *)url {
    _url = url;
    [self.codeImgView sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (UIImageView *)codeImgView {
    if (!_codeImgView) {
        _codeImgView = [UIImageView new];
    }
    return _codeImgView;
}
@end
