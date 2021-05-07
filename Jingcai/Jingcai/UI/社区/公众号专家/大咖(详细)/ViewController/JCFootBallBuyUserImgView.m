//
//  JCFootBallBuyUserImgView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFootBallBuyUserImgView.h"
#import "UIImageView+CornerRadius.h"
@implementation JCFootBallBuyUserImgView

- (void)initViews {
//    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.imgView];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.width.height.mas_equalTo(AUTO(30));
    }];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithCornerRadiusAdvance:AUTO(15) rectCornerType:UIRectCornerAllCorners];
    }
    return _imgView;
}


@end
