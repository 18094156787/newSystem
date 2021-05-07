//
//  JCMatchGoalDistributionInfoCirCleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchGoalDistributionInfoCirCleView.h"

@implementation JCMatchGoalDistributionInfoCirCleView

- (void)initViews {
    NSArray *items = @[[SCPieChartDataItem dataItemWithValue:0 color:COLOR_002868 description:@""],
                       [SCPieChartDataItem dataItemWithValue:0 color:JCBaseColor description:@""],
                       ];

    self.chartView = [[SCPieChart alloc] initWithFrame:CGRectMake(0, 0, AUTO(50), AUTO(50)) items:items];
    self.chartView.descriptionTextColor = [UIColor whiteColor];
    self.chartView.center = self.center;
    self.chartView.hideDescription = YES;
    //    chartView.outerCircleRadius = 100;
    self.chartView.innerCircleRadius = AUTO(20);
    self.chartView.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:12.0];
    
    [self.chartView strokeChartWithAnimation:NO];
    [self addSubview:self.chartView];
    [self.chartView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(AUTO(50));
        make.centerY.centerX.equalTo(self);
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self.chartView);
    }];
    
    [self addSubview:self.leftLab];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.chartView);
        make.right.equalTo(self.chartView.mas_left).offset(AUTO(-5));
    }];
    
    [self addSubview:self.rightLab];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.chartView);
        make.left.equalTo(self.chartView.mas_right).offset(AUTO(5));
    }];
    
    [self addSubview:self.rightLine];
    [self.rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self);
        make.width.mas_equalTo(0.5);
    }];
    
    [self addSubview:self.bottomLine];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    
    
}

//- (void)data {
//    self.leftLab.text = @"5";
//    self.rightLab.text = @"5";
//}




- (void)setAttackModel:(JCLiveDistributionModel *)attackModel {
    _attackModel = attackModel;
    [self.chartView updateChartByNumbers:@[@([attackModel.away.attack integerValue]),@([attackModel.home.attack integerValue])] animation:NO];
    self.leftLab.text = attackModel.home.attack;
    self.rightLab.text = attackModel.away.attack;
}

- (void)setDangerModel:(JCLiveDistributionModel *)dangerModel {
    _dangerModel = dangerModel;
    [self.chartView updateChartByNumbers:@[@([dangerModel.away.danger_attack integerValue]),@([dangerModel.home.danger_attack integerValue])] animation:NO];
    self.leftLab.text = dangerModel.home.danger_attack;
    self.rightLab.text = dangerModel.away.danger_attack;
}

- (void)setPossessionModel:(JCLiveDistributionModel *)possessionModel {
    _possessionModel = possessionModel;
    [self.chartView updateChartByNumbers:@[@([possessionModel.away.possession integerValue]),@([possessionModel.home.possession integerValue])] animation:NO];
    self.leftLab.text = possessionModel.home.possession;
    self.rightLab.text = possessionModel.away.possession;
}




- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)leftLab {
    if (!_leftLab) {
        _leftLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _leftLab;
}

- (UILabel *)rightLab {
    if (!_rightLab) {
        _rightLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];

    }
    return _rightLab;
}

- (UIView *)rightLine {
    if (!_rightLine) {
        _rightLine = [UIView new];
        _rightLine.backgroundColor = COLOR_DDDDDD;
    }
    return _rightLine;
}
- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = COLOR_DDDDDD;
    }
    return _bottomLine;
}

@end
