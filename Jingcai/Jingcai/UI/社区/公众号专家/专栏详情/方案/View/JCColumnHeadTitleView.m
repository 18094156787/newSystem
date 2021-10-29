//
//  JCColumnHeadTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnHeadTitleView.h"

@implementation JCColumnHeadTitleView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.bottom.offset(AUTO(-12));
        make.height.mas_equalTo(AUTO(28));
    }];
    
    [self addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.titleLab);
    }];
}

- (void)setModel:(JCColumnListPlanModel *)model {
    _model = model;
    //状态,0未购买,1预售即将开始,2预售中(已购买),3更新中,4周期结束，5预售中未购买
    self.titleLab.text = [NSString stringWithFormat:@"第%@期",model.period];
    if ([model.status integerValue]==0) {
        self.titleLab.textColor = COLOR_2F2F2F;
        self.statusLab.textColor = COLOR_2F2F2F;
        self.statusLab.text = @"未购买";
    }
    if ([model.status integerValue]==1) {
        self.titleLab.textColor = COLOR_002868;
        self.statusLab.textColor = COLOR_002868;
        self.statusLab.text = @"即将开始";
    }
    if ([model.status integerValue]==2||[model.status integerValue]==5) {
        self.titleLab.textColor = UIColorFromRGB(0xEF8720);
        self.statusLab.textColor = UIColorFromRGB(0xEF8720);
        self.statusLab.text = @"预售中···";
    }
    if ([model.status integerValue]==3) {
        self.titleLab.textColor = JCBaseColor;
        self.statusLab.textColor = JCBaseColor;
        self.statusLab.text = @"更新中···";
    }
    if ([model.status integerValue]==4) {
        self.titleLab.textColor = UIColorFromRGB(0x596280);
        self.statusLab.textColor = UIColorFromRGB(0x596280);
        self.statusLab.text = @"已结束";
    }

}

- (void)setIsbottom:(BOOL)isbottom {
    _isbottom = isbottom;
    if (self.isbottom) {
        [self.titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
        }];
    }else{
        [self.titleLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(AUTO(-12));
        }];
    }

}

- (void)data {
    self.titleLab.text = @"第5期";
    self.statusLab.text = @"更新中···";
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLab;
}

@end
