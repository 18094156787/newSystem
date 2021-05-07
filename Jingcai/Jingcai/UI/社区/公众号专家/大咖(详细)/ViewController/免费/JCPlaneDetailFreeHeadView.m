//
//  JCPlaneDetailFreeHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPlaneDetailFreeHeadView.h"

@implementation JCPlaneDetailFreeHeadView

- (void)initViews {
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(16);
        make.right.offset(AUTO(-15));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCBaseColor;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    

    
    UILabel *label = [UILabel initWithTitle:@"方案详情" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(lineView);
    }];
    self.infoLab = label;
    

}


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}
@end
