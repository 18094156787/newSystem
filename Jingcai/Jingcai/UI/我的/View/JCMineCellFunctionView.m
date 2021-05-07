//
//  JCMineCellFunctionView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMineCellFunctionView.h"

@implementation JCMineCellFunctionView

- (void)initViews {
    [self addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(AUTO(15));
        make.width.height.mas_equalTo(AUTO(32));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.iconImgView.mas_bottom).offset(AUTO(10));
    }];

}

- (void)setIconImg:(UIImage *)iconImg {
    _iconImg = iconImg;
    self.iconImgView.image = iconImg;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}



- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = JCIMAGE(@"");
//        _iconImgView.userInteractionEnabled = YES;
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
    
}

@end
