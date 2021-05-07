//
//  JCFootBallAuthorCodeNodataView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/2/11.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFootBallAuthorCodeNodataView.h"

@implementation JCFootBallAuthorCodeNodataView

- (void)initViews {
    
    UIImageView *imgView = [UIImageView new];
    [self addSubview:imgView];
    imgView.image = JCIMAGE(@"nodata_small");
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(5));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(155)));
    }];
    
    UILabel *infolab = [UILabel initWithTitle:@"暂无方案" andFont:AUTO(13) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
//    infolab.font = [UIFont boldSystemFontOfSize:AUTO(15)];
    [self addSubview:infolab];
    [infolab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(imgView.mas_bottom).offset(AUTO(-10));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.codeImgView];
    [self.codeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(infolab.mas_bottom).offset(AUTO(10));
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
        _codeImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _codeImgView;
}
@end
