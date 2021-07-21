//
//  JNMatchSJAgainstFootTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstFootTipView.h"

@implementation JNMatchSJAgainstFootTipView

- (void)initViews {
    [self addSubview:self.tipLab];
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
    }];
    
    [self addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tipLab.mas_right);
        make.top.offset(0);
    }];
    
    UIView *lineView = [UIView new];
    [self addSubview:lineView];
    lineView.backgroundColor = COLOR_F0F0F0;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(8);
    }];
    
//    [self addSubview:self.lineView];
//    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self);
//        make.height.mas_equalTo(0.5);
//    }];
}

- (UILabel *)tipLab {
    if (!_tipLab) {
        _tipLab = [UILabel initWithTitle:@"注：" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _tipLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"1.预测数据仅供参考！不做结果保证，请理性对待！\n2.数据提前12小时给出，每小时更新，请及时关注！" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;
}

@end
