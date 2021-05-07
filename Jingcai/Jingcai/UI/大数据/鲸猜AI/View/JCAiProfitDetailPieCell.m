//
//  JCAiProfitDetailPieCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAiProfitDetailPieCell.h"

@interface JCAiProfitDetailPieCell()
//{
//    SCPieChart *chartView;
//}
@end

@implementation JCAiProfitDetailPieCell


- (void)initViews {
    [self addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];

    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.iconImgView);
    }];
    
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.iconImgView);
    }];
    
        NSArray *items = @[[SCPieChartDataItem dataItemWithValue:0 color:JCBaseColor description:@""],
                           [SCPieChartDataItem dataItemWithValue:0 color:COLOR_FE644D description:@""],
                           [SCPieChartDataItem dataItemWithValue:0 color:COLOR_2F2F2F description:@""],
                           [SCPieChartDataItem dataItemWithValue:0 color:COLOR_30B27A description:@""],
                           [SCPieChartDataItem dataItemWithValue:0 color:COLOR_002868 description:@""]
                           ];
        
        self.chartView = [[SCPieChart alloc] initWithFrame:CGRectMake(15, 50, AUTO(140), AUTO(140)) items:items];
        self.chartView.descriptionTextColor = [UIColor whiteColor];
        self.chartView.hideDescription = YES;
    //    chartView.outerCircleRadius = 100;
        self.chartView.innerCircleRadius = 50;
        self.chartView.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:12.0];
        [self.chartView strokeChartWithAnimation:YES];
        [self addSubview:self.chartView];
    
    [self.chartView addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.chartView.mas_centerY);
        make.centerX.equalTo(self.chartView);
    }];
    
    [self.chartView addSubview:self.rateInfoLab];
    [self.rateInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rateLab.mas_bottom);
        make.centerX.equalTo(self.chartView);
    }];
    
    [self addSubview:self.winRateLab];
    [self.winRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chartView).offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(20)));
    }];
    
    [self addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winRateLab);
        make.right.equalTo(self.winRateLab.mas_left);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(20)));
    }];
    
    [self addSubview:self.winView];
    [self.winView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winRateLab);
        make.right.equalTo(self.winLab.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self addSubview:self.winHalfRateLab];
    [self.winHalfRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winLab.mas_bottom).offset(AUTO(5));
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(20)));
    }];
    
    [self addSubview:self.winHalfLab];
    [self.winHalfLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winHalfRateLab);
        make.right.equalTo(self.winHalfRateLab.mas_left);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(20)));
    }];
    
    [self addSubview:self.winHalfView];
    [self.winHalfView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winHalfRateLab);
        make.right.equalTo(self.winHalfLab.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self addSubview:self.loseRateLab];
    [self.loseRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winHalfRateLab.mas_bottom).offset(AUTO(5));
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(20)));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loseRateLab);
        make.right.equalTo(self.loseRateLab.mas_left);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(20)));
    }];
    
    [self addSubview:self.loseView];
    [self.loseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loseRateLab);
        make.right.equalTo(self.loseLab.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    

    
    [self addSubview:self.loseHalfRateLab];
    [self.loseHalfRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loseRateLab.mas_bottom).offset(AUTO(5));
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(20)));
    }];
    
    [self addSubview:self.loseHalfLab];
    [self.loseHalfLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loseHalfRateLab);
        make.right.equalTo(self.loseHalfRateLab.mas_left);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(20)));
    }];
    
    [self addSubview:self.loseHalfView];
    [self.loseHalfView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loseHalfRateLab);
        make.right.equalTo(self.loseHalfLab.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self addSubview:self.zsRateLab];
    [self.zsRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loseHalfRateLab.mas_bottom).offset(AUTO(5));
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(20)));
    }];
    
    [self addSubview:self.zsLab];
    [self.zsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.zsRateLab);
        make.right.equalTo(self.zsRateLab.mas_left);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(20)));
    }];
    
    [self addSubview:self.zsView];
    [self.zsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.zsRateLab);
        make.right.equalTo(self.zsLab.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
}


- (void)setModel:(JCJingCaiAIYLModel *)model {
    _model = model;
    self.titleLab.text = [NSString stringWithFormat:@"%@,共%@场",model.title,model.count];
    [self.chartView updateChartByNumbers:@[@(model.qy),@(model.yb),@(model.qs),@(model.sb),@(model.zs)] animation:NO];
    if ([model.yl floatValue]<0) {
        self.rateLab.text = @"亏损中";
        self.rateLab.textColor = COLOR_13AE13;
    }else{
        
        self.rateLab.text = [NSString stringWithFormat:@"%.0f%%",[model.yl floatValue]*100];
        self.rateLab.textColor = JCBaseColor;
    }
    
    self.winRateLab.text= [NSString stringWithFormat:@"%@%%",model.qy_percent];
    self.loseRateLab.text= [NSString stringWithFormat:@"%@%%",model.qs_percent];
    self.winHalfRateLab.text= [NSString stringWithFormat:@"%@%%",model.yb_percent];
    self.loseHalfRateLab.text= [NSString stringWithFormat:@"%@%%",model.sb_percent];
    self.zsRateLab.text= [NSString stringWithFormat:@"%@%%",model.zs_percent];
    self.winLab.text= [NSString stringWithFormat:@"全赢场次 (%ld)",model.qy];
    self.loseLab.text= [NSString stringWithFormat:@"全输场次 (%ld)",model.qs];
    self.winHalfLab.text= [NSString stringWithFormat:@"半赢场次 (%ld)",model.yb];
    self.loseHalfLab.text= [NSString stringWithFormat:@"半输场次 (%ld)",model.sb];
    self.zsLab.text= [NSString stringWithFormat:@"走水场次 (%ld)",model.zs];
}
//
//- (void)data {
//    self.titleLab.text = @"近一周";
//    self.countLab.text = @"共246场";
//    [self.chartView updateChartByNumbers:@[@(10),@(20),@(30),@(40),@(50)] animation:NO];
//    self.rateLab.text = @"180.00%";
//    self.winRateLab.text= @"47.93%";
//    self.loseRateLab.text= @"47.93%";
//    self.winHalfRateLab.text= @"47.93%";
//    self.loseHalfRateLab.text= @"47.93%";
//    self.zsRateLab.text= @" 47.93%";
//    self.winLab.text= @"全赢场次(116)";
//    self.loseLab.text= @"全赢场次(116)";
//    self.winHalfLab.text= @"全赢场次(116)";
//    self.loseHalfLab.text= @"全赢场次(116)";
//    self.zsLab.text= @"全赢场次(116)";
//
//}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.backgroundColor = JCBaseColor;
    }
    return _iconImgView;
}

-(UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

-(UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

-(UILabel *)rateLab {
    if (!_rateLab) {
        _rateLab = [UILabel initWithTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _rateLab;
}

-(UILabel *)rateInfoLab {
    if (!_rateInfoLab) {
        _rateInfoLab = [UILabel initWithTitle:@"盈利率" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _rateInfoLab;
}

- (UIView *)winView {
    if (!_winView) {
        _winView = [UIView new];
        _winView.backgroundColor = JCBaseColor;
        [_winView hg_setAllCornerWithCornerRadius:2];
    }
    return _winView;
}

- (UIView *)winHalfView {
    if (!_winHalfView) {
        _winHalfView = [UIView new];
        _winHalfView.backgroundColor = COLOR_FE644D;
        [_winHalfView hg_setAllCornerWithCornerRadius:2];
    }
    return _winHalfView;
}

- (UIView *)loseView {
    if (!_loseView) {
        _loseView = [UIView new];
        _loseView.backgroundColor = COLOR_000000;
        [_loseView hg_setAllCornerWithCornerRadius:2];
    }
    return _loseView;
}

- (UIView *)loseHalfView {
    if (!_loseHalfView) {
        _loseHalfView = [UIView new];
        _loseHalfView.backgroundColor = COLOR_30B27A;
        [_loseHalfView hg_setAllCornerWithCornerRadius:2];
    }
    return _loseHalfView;
}

- (UIView *)zsView{
    if (!_zsView) {
        _zsView = [UIView new];
        _zsView.backgroundColor = COLOR_002868;
        [_zsView hg_setAllCornerWithCornerRadius:2];
    }
    return _zsView;
}

-(UILabel *)winLab {
    if (!_winLab) {
        _winLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _winLab;
}

-(UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _loseLab;
}

-(UILabel *)winHalfLab {
    if (!_winHalfLab) {
        _winHalfLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _winHalfLab;
}

-(UILabel *)loseHalfLab {
    if (!_loseHalfLab) {
        _loseHalfLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _loseHalfLab;
}
-(UILabel *)zsLab {
    if (!_zsLab) {
        _zsLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _zsLab;
}

-(UILabel *)winRateLab {
    if (!_winRateLab) {
        _winRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _winRateLab;
}

-(UILabel *)loseRateLab {
    if (!_loseRateLab) {
        _loseRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _loseRateLab;
}

-(UILabel *)winHalfRateLab {
    if (!_winHalfRateLab) {
        _winHalfRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _winHalfRateLab;
}

-(UILabel *)loseHalfRateLab {
    if (!_loseHalfRateLab) {
        _loseHalfRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _loseHalfRateLab;
}
-(UILabel *)zsRateLab {
    if (!_zsRateLab) {
        _zsRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _zsRateLab;
}
@end
