//
//  JCTeamMatchInfoMatchHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoMatchHeadView.h"

@implementation JCTeamMatchInfoMatchHeadView

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
        make.centerX.equalTo(bgView);
        make.centerY.equalTo(bgView);
    }];
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

@end
