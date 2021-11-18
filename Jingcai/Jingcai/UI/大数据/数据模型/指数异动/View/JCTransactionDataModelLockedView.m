//
//  JCTransactionDataModelLockedView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelLockedView.h"

@implementation JCTransactionDataModelLockedView

- (void)initViews {
    self.backgroundColor = JCClearColor;
    self.backgroundColor = JCClearColor;
    [self addSubview:self.lockBtn];
    [self.lockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(40));
        make.bottom.offset(0);
    }];
}

- (UIButton *)lockBtn {
    if (!_lockBtn) {
        _lockBtn = [UIButton initWithText:@"开通后查看指数异动赛事" FontSize:AUTO(14) Weight:1 BackGroundColor:[JCBaseColor colorWithAlphaComponent:0.1] TextColors:JCBaseColor];
        [_lockBtn setImage:JCIMAGE(@"ic_dataModel_lock") forState:0];
        [_lockBtn setImage:JCIMAGE(@"ic_dataModel_lock") forState:UIControlStateHighlighted];
        [_lockBtn hg_setAllCornerWithCornerRadius:AUTO(24)];
        [_lockBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, AUTO(10))];
    }
    return _lockBtn;
}

@end
