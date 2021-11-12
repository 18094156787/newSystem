//
//  JCHistoryPayDataModelDetailTitleHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelDetailTitleHeadView.h"

@implementation JCHistoryPayDataModelDetailTitleHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.centerY.equalTo(self);
        make.width.mas_equalTo(AUTO(80));
    }];
    
    [self addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-16));
        make.centerY.equalTo(self);
        make.width.mas_equalTo(AUTO(40));
    }];
    
    [self addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLab.mas_right);
        make.centerY.equalTo(self);
        make.right.equalTo(self.resultLab.mas_left);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorFromRGB(0xE8E8E8);
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.left.offset(AUTO(16));
        make.right.offset(AUTO(-16));
        make.height.mas_equalTo(1);
    }];
    
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =[UILabel initWithTitle:@"日期" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab =[UILabel initWithTitle:@"对阵球队" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _teamLab;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab =[UILabel initWithTitle:@"赛果" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resultLab;
}
@end
