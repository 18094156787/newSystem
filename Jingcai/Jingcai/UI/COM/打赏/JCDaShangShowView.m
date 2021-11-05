//
//  JCDaShangShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDaShangShowView.h"

@implementation JCDaShangShowView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
        
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(AUTO(0));
        make.height.mas_equalTo(AUTO(450)+kBottomTabSafeAreaHeight);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"用户打赏" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(20));
        make.centerX.equalTo(self);
    }];
    
    [self.bgView addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(titleLab);
        make.width.height.mas_equalTo(AUTO(50));
    }];
    
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"ic_column_close") forState:0];
        [_closeBtn setImage:JCIMAGE(@"ic_column_close") forState:UIControlStateHighlighted];
    }
    return _closeBtn;
}

-  (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setCornerOnTopWithRadius:20];
    }
    return _bgView;
}

@end
