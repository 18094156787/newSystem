//
//  JNMatchDetailZRPlayerItemView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchDetailZRPlayerItemView.h"

@implementation JNMatchDetailZRPlayerItemView

- (void)initViews {
    [self addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self);
        make.width.height.mas_equalTo(36);
    }];
    
    [self addSubview:self.numberImageView];
    [self.numberImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headImgView.mas_left).offset(AUTO(10));
        make.centerY.equalTo(self.headImgView);
        make.width.height.mas_equalTo(20);
    }];
    
    [self.numberImageView addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.centerX.equalTo(self.numberImageView);
//        make.width.height.mas_equalTo(20);
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
//    [self addSubview:self.numberBgView];
//    [self.numberBgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.top.equalTo(self.headImgView.mas_bottom).offset(-10);
//        make.size.mas_equalTo(CGSizeMake(28, 12));
//    }];
//
    [self addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headImgView);
        make.bottom.equalTo(self.headImgView).offset(-2);
        make.width.height.mas_equalTo(16);
    }];
//
//    [self.numberBgView addSubview:self.numberLab];
//    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(4);
//        make.centerY.equalTo(self.numberBgView);
//    }];
    
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.headImgView.mas_bottom).offset(2);
        make.width.mas_equalTo(AUTO(60));
    }];
    
}



- (void)setLineupBall:(JNMatchLineupBall *)lineupBall {
    _lineupBall = lineupBall;
//    if ([lineupBall.name containsString:@"·"]) {
//        NSArray *array = [lineupBall.name componentsSeparatedByString:@"·"];
//        self.nameLab.text = array.lastObject;
//
//    }else {
//        self.nameLab.text = NonNil(lineupBall.name);
//    }
    self.nameLab.text = NonNil(lineupBall.name);
    
    self.numberLab.text = [NSString stringWithFormat:@"%ld",[lineupBall.shirt_number integerValue]];
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:lineupBall.logo] placeholderImage:JCIMAGE(@"userImg_default")];

    if (lineupBall.type==1||lineupBall.type==3||lineupBall.type==4||lineupBall.type==9) {
        self.iconImgView.hidden = NO;
        if (lineupBall.type==1) {
            self.iconImgView.image = JCIMAGE(@"MatchZR_tl_icon_jq");
        }

        if (lineupBall.type==3) {
            self.iconImgView.image = JCIMAGE(@"MatchZR_tl_icon_yp");
        }
        if (lineupBall.type==4) {
            self.iconImgView.image = JCIMAGE(@"MatchZR_tl_icon_rc_s");
        }
        if (lineupBall.type==9) {
            self.iconImgView.image = JCIMAGE(@"MatchZR_tl_icon_hr");
        }

    }else{
        self.iconImgView.hidden = YES;


    }
    
    
}
- (void)setIsHomeTeam:(BOOL)isHomeTeam {
    _isHomeTeam = isHomeTeam;
    self.numberLab.textColor = isHomeTeam ? COLOR_2F2F2F : JCWhiteColor;
//    self.headImgView.layer.borderColor = isHomeTeam ?JCBaseColor.CGColor:COLOR_0091FF.CGColor;
//    self.numberBgView.backgroundColor = isHomeTeam ?JCBaseColor:COLOR_0091FF;
    self.numberImageView.image = isHomeTeam?JCIMAGE(@"icon_match_dbx_home"):JCIMAGE(@"icon_match_dbx_away");
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.layer.borderWidth= 0.5;
        _headImgView.layer.cornerRadius = AUTO(18);
        _headImgView.layer.masksToBounds = YES;
//        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(18)];
    }
    return _headImgView;
}

- (UIView *)numberBgView {
    if (!_numberBgView) {
        _numberBgView = [UIView new];
        [_numberBgView hg_setAllCornerWithCornerRadius:AUTO(6)];
    }
    return _numberBgView;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:10 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _numberLab.textAlignment = NSTextAlignmentCenter;
    }
    return _numberLab;
}


- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        [_iconImgView hg_setAllCornerWithCornerRadius:4];
    }
    return _iconImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:10 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _nameLab;
}

- (UIImageView *)numberImageView {
    if (!_numberImageView) {
        _numberImageView = [UIImageView new];
        _numberImageView.image = JCIMAGE(@"icon_match_dbx_home");
    }
    return _numberImageView;
}

@end
