//
//  JCJingCaiAIHomeZhiShuTypeView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIHomeZhiShuTypeView.h"

@implementation JCJingCaiAIHomeZhiShuTypeView

- (void)initViews {
    [self addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(AUTO(72));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCClearColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(15));
        make.top.bottom.equalTo(self.iconImgView);
        make.width.mas_equalTo(0.5);
    }];
    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(0);
        make.centerY.equalTo(self.iconImgView);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(85));
    }];
    
    [self.bgView addSubview:self.weekLab];
    [self.weekLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(2));
        make.left.right.offset(0);
        make.height.mas_equalTo(0);
    }];
    
    [self.bgView addSubview:self.monthLab];
    [self.monthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.weekLab.mas_bottom);
        make.left.right.equalTo(self.weekLab);
        make.height.mas_equalTo(0);
    }];
    
    [self.bgView addSubview:self.threeMonthLab];
    [self.threeMonthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.monthLab.mas_bottom);
        make.left.right.equalTo(self.weekLab);
        make.height.mas_equalTo(0);
    }];
    
    [self.bgView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeMonthLab.mas_bottom);
        make.left.right.equalTo(self.weekLab);
        make.height.mas_equalTo(0);
    }];

    
    [self.viewArray addObject:self.weekLab];
    [self.viewArray addObject:self.monthLab];
    [self.viewArray addObject:self.threeMonthLab];
    [self.viewArray addObject:self.historyLab];
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    NSInteger count = dataArray.count;
    for (int i=0; i<dataArray.count; i++) {
        JCJingCaiAIYLModel *model = dataArray[i];
        NSString *title = [NSString stringWithFormat:@"%@预测%@场, %@",model.title,model.count,model.yl_desc];
        if ([model.yl floatValue]>0) {
            title = [NSString stringWithFormat:@"%@预测%@场,盈利 %@",model.title,model.count,model.yl_desc];
        }
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:model.yl_desc];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:model.yl_desc_color]} range:range];
        }
        if (i==0) {
            self.weekLab.attributedText = attr;
            [self.weekLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(AUTO(18));
            }];
        }
        if (i==1) {
            self.monthLab.attributedText = attr;
            [self.monthLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(AUTO(18));
            }];
        }
        if (i==2) {
            self.threeMonthLab.attributedText = attr;
            self.threeMonthLab.hidden = [model.yl_desc floatValue]<=0?YES:NO;
            [self.threeMonthLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(AUTO(18));
            }];
            if ([model.yl_desc floatValue]<=0) {
                count--;
                [self.threeMonthLab mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(0);
                }];
            }

        }
        if (i==3) {
            self.historyLab.attributedText = attr;
            self.historyLab.hidden = [model.yl_desc floatValue]<=0?YES:NO;
            [self.historyLab mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(AUTO(18));
            }];
            if ([model.yl_desc floatValue]<=0) {
                count--;
                self.historyLab.hidden = [model.yl_desc floatValue]<=0?YES:NO;
                [self.historyLab mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(0);
                }];
            }
        }

    }
    [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(30));
        make.centerY.equalTo(self.iconImgView);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(18)*count+AUTO(5));
    }];
    
    
    
}



- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}


- (NSMutableArray *)viewArray {
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}

- (UILabel *)weekLab {
    if (!_weekLab) {
        _weekLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _weekLab;
}

- (UILabel *)monthLab {
    if (!_monthLab) {
        _monthLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _monthLab;
}

- (UILabel *)threeMonthLab {
    if (!_threeMonthLab) {
        _threeMonthLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _threeMonthLab;
}
- (UILabel *)historyLab {
    if (!_historyLab) {
        _historyLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _historyLab;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

@end
