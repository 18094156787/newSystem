//
//  JCActivityGuess_SPF_CheckView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuess_SPF_CheckView.h"

@implementation JCActivityGuess_SPF_CheckView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(10)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(100)+kNavigationBarHeight);
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.height.mas_equalTo(AUTO(268));
    }];


    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(16));
        make.height.mas_equalTo(AUTO(22));
        make.centerX.equalTo(bgView);
    }];
    
    UIView *lineView = [UIView new];
    [bgView addSubview:lineView];
    lineView.backgroundColor = [COLOR_000000 colorWithAlphaComponent:0.06];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(16));
        make.left.right.offset(0);
        make.height.mas_equalTo(1);
    }];
    
    [bgView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teamLab.mas_bottom).offset(AUTO(4));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];

    [bgView addSubview:self.chooseLab];
    [self.chooseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(24));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];

    float width = (SCREEN_WIDTH-AUTO(100))/2.0f;
    
    [bgView addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).offset(-4);
        make.bottom.offset(-24);
        make.size.mas_equalTo(CGSizeMake(width, 44));
    }];
    
    [bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(4);
        make.bottom.offset(-24);
        make.size.mas_equalTo(CGSizeMake(width, 44));
    }];
    
    WeakSelf;
    [self.cancelBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBlock) {
            weakSelf.JCSureBlock();
        }
    }];
}
- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
    self.teamLab.text = [NSString stringWithFormat:@"%@ VS %@",detailModel.get_match_info.home_team.name_zh,detailModel.get_match_info.away_team.name_zh];

    NSString *title = [NSString stringWithFormat:@"%@",detailModel.get_match_info.competition.short_name_zh];
    if (detailModel.get_match_info.round_num_two.length>0) {
        title = [title stringByAppendingFormat:@" | %@",detailModel.get_match_info.round_num_two];
    }
    if (detailModel.get_match_info.group_num_new.length>0) {
        title = [title stringByAppendingFormat:@" | %@",detailModel.get_match_info.group_num_new];
    }
    if (detailModel.get_match_info.match_time.length>0) {
        title = [title stringByAppendingFormat:@" | %@",[NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[detailModel.get_match_info.match_time doubleValue]]];
    }
    self.infoLab.text = title;

    NSString *result = NonNil(self.selectOptionModel.name);
    NSString *choose = [NSString stringWithFormat:@"竞猜选项:%@",result];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:choose];
    NSRange range = [choose rangeOfString:result];
    if (range.location!=NSNotFound) {
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)],NSForegroundColorAttributeName:JCBaseColor} range:range];
    }
    self.chooseLab.attributedText = attr;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"竞猜选项确认" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _teamLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}


- (UILabel *)chooseLab {
    if (!_chooseLab) {
        _chooseLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _chooseLab;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton initWithText:@"我再想想" FontSize:16 BackGroundColor:JCClearColor TextColors:JCBaseColor];
        _cancelBtn.layer.borderColor = JCBaseColor.CGColor;
        _cancelBtn.layer.borderWidth = 1;
        _cancelBtn.layer.cornerRadius = 22;
        _cancelBtn.layer.masksToBounds = YES;
    }
    return _cancelBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确认提交" FontSize:16 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _sureBtn.layer.borderColor = JCBaseColor.CGColor;
        _sureBtn.layer.borderWidth = 1;
        _sureBtn.layer.cornerRadius = 22;
        _sureBtn.layer.masksToBounds = YES;
    }
    return _sureBtn;
}
@end
