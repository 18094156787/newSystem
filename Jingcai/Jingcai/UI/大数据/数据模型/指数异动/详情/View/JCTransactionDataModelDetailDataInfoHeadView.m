//
//  JCTransactionDataModelDetailDataInfoHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailDataInfoHeadView.h"

@implementation JCTransactionDataModelDetailDataInfoHeadView

- (void)initViews {
    [self addSubview:self.chuLab];
    [self.chuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(15));
    }];
    
    [self addSubview:self.jiLab];
    [self.jiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(AUTO(-15));
    }];
}

- (void)data {
    self.chuLab.text = @"初赔 2.25 24 .245";
    self.jiLab.text = @"即赔 2.25 24 .245";
}

- (UILabel *)chuLab {
    if (!_chuLab) {
        _chuLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuLab;
}

- (UILabel *)jiLab {
    if (!_jiLab) {
        _jiLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _jiLab;
}
@end
