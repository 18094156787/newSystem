//
//  JCTeamDetailMatchTitleHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailMatchTitleHeadView.h"

@implementation JCTeamDetailMatchTitleHeadView

- (void)initViews {
    UIImageView *bgView = [UIImageView new];
//    bgView.image = JCIMAGE(@"teamMatch_iimg_tit_gr");
    bgView.backgroundColor = COLOR_002868;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.bottom.offset(0);
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView).offset(AUTO(20));
        make.centerY.equalTo(bgView);
    }];
    
    [bgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLab.mas_left).offset(AUTO(-5));
        make.centerY.equalTo(bgView);
        make.width.height.mas_equalTo(AUTO(24));
    }];
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}


- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.backgroundColor = JCWhiteColor;
        [_iconImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _iconImgView;
}

@end
