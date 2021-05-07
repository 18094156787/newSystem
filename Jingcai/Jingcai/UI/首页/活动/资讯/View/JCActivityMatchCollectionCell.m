//
//  JCActivityMatchCollectionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityMatchCollectionCell.h"

@implementation JCActivityMatchCollectionCell

- (void)initViews {
//    self.backgroundColor = JCBaseColor;
    
    
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:4];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(8, 8, 28, 8));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.offset(AUTO(18));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.timeLab);
        make.height.mas_equalTo(AUTO(16));
//        make.width.mas_equalTo(AUTO(38));
    }];
    
    [self addSubview:self.goingLab];
    [self.goingLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(16));
//        make.width.mas_equalTo(AUTO(45));
//        make.size.mas_equalTo(CGSizeMake(AUTO(31), AUTO(16)));
    }];
    
    [self addSubview:self.backImgView];
    [self.backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.goingLab.mas_bottom).offset(AUTO(0));
        make.height.mas_equalTo(AUTO(52));
    }];
    

    [self.backImgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self.backImgView);
        make.width.mas_equalTo(AUTO(50));
    }];
    
    [self.backImgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.homeLab.mas_left).offset(AUTO(-5));
//        make.centerY.equalTo(self.infoLab);
//        make.width.height.mas_equalTo(AUTO(28));
        make.right.equalTo(self.infoLab.mas_left);
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    
    
    [self.backImgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.infoLab.mas_right);
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.backImgView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeImgView.mas_left).offset(AUTO(-5));
        make.centerY.equalTo(self.infoLab);
        make.height.mas_equalTo(AUTO(18));
        make.left.offset(AUTO(15));
    }];
    [self.backImgView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awayImgView.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.infoLab);
        make.height.mas_equalTo(AUTO(18));
        make.right.offset(AUTO(-15));
    }];
    
}

- (void)setModel:(JCWMatchBall *)model {
    _model = model;
    NSString *matchTime = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[model.first_half_time doubleValue]];
    NSString *title = [NSString stringWithFormat:@"%@ %@",model.competition_name,matchTime];
    if (model.round_num.length>0) {
        title = [NSString stringWithFormat:@"%@ %@ %@",model.competition_name,model.round_num,matchTime];
    }
    if (model.competition_name.length>0) {
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:model.competition_name];
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
        self.timeLab.attributedText = attr;
    }else {
        self.timeLab.text = title;
    }
    
    
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.homeLab.text = model.home_team_name;
    self.awayLab.text = model.away_team_name;
//    model.matchCount = 5;
    if (model.plan_num>0) {
        self.countLab.text = [NSString stringWithFormat:@"%@个方案",model.plan_num];
    }else {
        self.countLab.text = @"";
    }
    self.countLab.hidden = [model.plan_num integerValue]==0?YES:NO;
    
    if ([model.status_id intValue]==2||[model.status_id intValue]==4) {
        self.goingLab.backgroundColor = JCBaseColor;
        self.goingLab.textColor = JCWhiteColor;
//            self.ongoingTimeLab.text = model.status_cn;
        if ([model.second_half_time floatValue]>0) {
            //计算时间差
            double currentTime = [[NSDate date] timeIntervalSince1970];
            double distance = currentTime-[model.second_half_time floatValue];

            self.goingLab.text = [NSString stringWithFormat:@"  %.0f'  ",distance/60+45];
//            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
        }else{
            //计算时间差
            double currentTime = [[NSDate date] timeIntervalSince1970];
            double distance = currentTime-[model.first_half_time floatValue];
            if (distance<0) {
                distance = 0;
            }
            self.goingLab.text = [NSString stringWithFormat:@"  %.0f'  ",distance/60];
            
        }
    }else{
        self.goingLab.textColor = COLOR_666666;
        self.goingLab.backgroundColor = JCClearColor;
        self.goingLab.text = [NSString stringWithFormat:@"  %@  ",model.status_cn];
    }
//    self.goingLab.text = [NSString stringWithFormat:@"%.0f'",1000.0/60];
//    self.goingLab.backgroundColor = JCBaseColor;
//    self.goingLab.textColor = JCWhiteColor;
    
//    self.goingLab.backgroundColor = JCBaseColor;
//    self.goingLab.text = @"5'";

}

- (UIView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIView new];
//        _backImgView.backgroundColor = COLOR_002868;
//        [_backImgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    }
    return _backImgView;
}

- (UILabel *)timeInfoLab {
    if (!_timeInfoLab) {
        _timeInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeInfoLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (KKPaddingLabel *)goingLab {
    if (!_goingLab) {
        _goingLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _goingLab.layer.borderColor = JCBaseColor.CGColor;
//        _goingLab.layer.borderWidth = 1;
        _goingLab.layer.cornerRadius = AUTO(2);
        _goingLab.layer.masksToBounds = YES;
        _goingLab.padding = UIEdgeInsetsMake(0, 8, 0, 8);
    }
    return _goingLab;
}

//- (UILabel *)goingLab {
//    if (!_goingLab) {
//        _goingLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
//        [_goingLab hg_setAllCornerWithCornerRadius:3];
//    }
//    return _goingLab;
//}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"VS" andFont:18 andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;
        _homeImgView.backgroundColor = JCWhiteColor;
        [_homeImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.backgroundColor = JCWhiteColor;
        _awayImgView.contentMode = UIViewContentModeScaleAspectFit;
        [_awayImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _awayImgView;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeLab;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayLab;
}

- (KKPaddingLabel *)countLab {
    if (!_countLab) {
        _countLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _countLab.layer.borderColor = JCBaseColor.CGColor;
        _countLab.layer.borderWidth = 1;
        _countLab.layer.cornerRadius = AUTO(8);
        _countLab.layer.masksToBounds = YES;
        _countLab.padding = UIEdgeInsetsMake(0, 5, 0, 5);
    }
    return _countLab;
}

@end
