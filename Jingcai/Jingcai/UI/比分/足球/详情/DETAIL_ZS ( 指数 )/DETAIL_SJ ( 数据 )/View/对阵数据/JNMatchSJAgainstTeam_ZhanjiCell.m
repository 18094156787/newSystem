//
//  JNMatchSJAgainstTeam_ZhanjiCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstTeam_ZhanjiCell.h"

@implementation JNMatchSJAgainstTeam_ZhanjiCell

- (void)initViews {
    //负 -胜 -平
    NSArray *items = @[[SCPieChartDataItem dataItemWithValue:0 color:COLOR_002868 description:@""],[SCPieChartDataItem dataItemWithValue:0 color:JCBaseColor description:@""],
                       [SCPieChartDataItem dataItemWithValue:0 color:COLOR_30B27A description:@""]
                       ];

    self.chartView = [[SCPieChart alloc] initWithFrame:CGRectMake(AUTO(20), 0, AUTO(80), AUTO(80)) items:items];
    self.chartView.descriptionTextColor = [UIColor whiteColor];
    self.chartView.hideDescription = YES;
    //    chartView.outerCircleRadius = 100;
    self.chartView.innerCircleRadius = 30;
    self.chartView.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:12.0];

    [self.chartView strokeChartWithAnimation:NO];
    [self addSubview:self.chartView];

    
    
    UIView *equlIconView = [UIView new];
    equlIconView.backgroundColor = COLOR_30B27A;
    [equlIconView hg_setAllCornerWithCornerRadius:4];;
    [self addSubview:equlIconView];
    [equlIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.chartView);
        make.left.equalTo(self.chartView.mas_right).offset(10);
        make.width.height.mas_equalTo(8);
    }];
    

    [self addSubview:self.eqalLab];
    [self.eqalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.chartView);
        make.left.equalTo(equlIconView.mas_right).offset(5);
        make.height.mas_equalTo(AUTO(17));
    }];
    
    UIView *winIconView = [UIView new];
    winIconView.backgroundColor = JCBaseColor;
    [winIconView hg_setAllCornerWithCornerRadius:4];;
    [self addSubview:winIconView];
    [winIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(equlIconView);
        make.bottom.equalTo(self.eqalLab.mas_top).offset(-15);
        make.width.height.mas_equalTo(8);
    }];
    
    [self addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(winIconView);
        make.left.equalTo(winIconView.mas_right).offset(5);
        make.height.mas_equalTo(AUTO(17));
    }];
    
    
    UIView *loseIconView = [UIView new];
    loseIconView.backgroundColor = COLOR_002868;
    [loseIconView hg_setAllCornerWithCornerRadius:4];;
    [self addSubview:loseIconView];
    [loseIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(equlIconView);
        make.top.equalTo(self.eqalLab.mas_bottom).offset(15);
        make.width.height.mas_equalTo(8);
    }];



    [self addSubview:self.loseLab];
     [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(loseIconView);
         make.left.equalTo(loseIconView.mas_right).offset(5);
         make.height.mas_equalTo(AUTO(17));
     }];
    
    self.circleBgView = [UIView new];
    self.circleBgView.backgroundColor = JCClearColor;
    [self addSubview:self.circleBgView];
    [self.circleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.equalTo(self.chartView.mas_right).offset(AUTO(25));
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-15));
    }];
    
    UILabel *teamNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    self.teamNameLab = teamNameLab;
    [self addSubview:teamNameLab];
    [teamNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chartView.mas_bottom).offset(10);
        make.centerX.equalTo(self.chartView);
        make.width.mas_lessThanOrEqualTo(AUTO(100));
    }];
    
    UILabel *hongInfoLab = [UILabel initWithTitle:@"胜" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.circleBgView addSubview:hongInfoLab];
    [hongInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chartView.mas_right).offset(AUTO(69));
        make.top.offset(AUTO(3));
        make.width.height.mas_equalTo(AUTO(20));
    }];
    
    UIView *hongLine = [UIView new];
    hongLine.backgroundColor =  COLOR_DBDBDB;
    [self.circleBgView addSubview:hongLine];
    [hongLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chartView.mas_right).offset(AUTO(95));
        make.centerY.equalTo(hongInfoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(170), 1));
    }];

    UILabel *zouInfoLab = [UILabel initWithTitle:@"平" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_30B27A andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.circleBgView addSubview:zouInfoLab];
    [zouInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(hongInfoLab);
        make.top.offset(AUTO(30));
        make.width.height.mas_equalTo(AUTO(20));
    }];

    UIView *zouLine = [UIView new];
    zouLine.backgroundColor =  COLOR_DBDBDB;
    [self.circleBgView addSubview:zouLine];
    [zouLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chartView.mas_right).offset(AUTO(95));
        make.centerY.equalTo(zouInfoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(170), 1));
    }];

    UILabel *heiInfoLab = [UILabel initWithTitle:@"负" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.circleBgView addSubview:heiInfoLab];
    [heiInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(hongInfoLab);
        make.top.offset(AUTO(57));
        make.width.height.mas_equalTo(AUTO(20));
    }];
    
    UIView *heiLine = [UIView new];
    heiLine.backgroundColor =  COLOR_DBDBDB;
    [self.circleBgView addSubview:heiLine];
    [heiLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chartView.mas_right).offset(AUTO(95));
        make.centerY.equalTo(heiInfoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(170), 1));
    }];

    UILabel *zsLab = [UILabel initWithTitle:@"近0场走势" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    self.zsCountLab = zsLab;
    [self.circleBgView addSubview:zsLab];
    [zsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(teamNameLab);
        make.left.equalTo(hongInfoLab.mas_right);
    }];

    [self.circleBgView addSubview:self.zs_infoLab];
    [self.zs_infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(teamNameLab);
        make.left.equalTo(zsLab.mas_right).offset(10);
    }];

}


- (void)setModel:(JCBigDataAnalysisModel *)model {
    _model= model;


    NSInteger hong = 0;
    NSInteger hei = 0;
    NSInteger zou = 0;


    NSArray *rateArray = [model.trend componentsSeparatedByString:@","];


    if (rateArray.count>0) {
    self.zsCountLab.text = [NSString stringWithFormat:@"近%ld场走势",rateArray.count];
    }
    for (int i=0; i<rateArray.count; i++) {
    NSString *value = rateArray[i];
    if ([value integerValue]==1) {
    hong++;
    }
    if ([value integerValue]==2) {
    hei++;
    }
    if ([value integerValue]==3) {
    zou++;
    }
    }
    
    
    [self.chartView updateChartByNumbers:@[@(hei),@(hong),@(zou)] animation:NO];
    self.windLab.text = [NSString stringWithFormat:@"%.0f%%",100*(float)hong/rateArray.count];
    self.eqalLab.text = [NSString stringWithFormat:@"%.0f%%",100*(float)hei/rateArray.count];
    self.loseLab.text = [NSString stringWithFormat:@"%.0f%%",100*(float)zou/rateArray.count];
    
    
    NSString *hongString = [NSString stringWithFormat:@"%ld胜",hong];
    NSString *heiString = [NSString stringWithFormat:@"%ld平",hei];
    NSString *zouString = [NSString stringWithFormat:@"%ld负",zou];
    NSString *zsString = [NSString stringWithFormat:@"%@   %@   %@",hongString,heiString,zouString];



    NSMutableAttributedString *zsAttr = [[NSMutableAttributedString alloc] initWithString:zsString];
    NSRange hong_range = [zsString rangeOfString:hongString];
    if (hong_range.location!=NSNotFound) {
    [zsAttr addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:hong_range];
    }
    NSRange zou_range = [zsString rangeOfString:zouString];
    if (zou_range.location!=NSNotFound) {
    [zsAttr addAttribute:NSForegroundColorAttributeName value:COLOR_002868 range:zou_range];//
    }
    NSRange hei_range = [zsString rangeOfString:heiString];
    if (hei_range.location!=NSNotFound) {
    [zsAttr addAttribute:NSForegroundColorAttributeName value:COLOR_30B27A range:hei_range];
    }
    self.zs_infoLab.attributedText = zsAttr;

    NSMutableArray *pointArray = [NSMutableArray array];
    NSInteger startX = AUTO(60);
    NSInteger startY = 27;

    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 1;

    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    for (int i=0; i<rateArray.count; i++) {
    NSString *value = rateArray[i];
    startX = startX+AUTO(17);
    if ([value integerValue]==1) {
    startY = AUTO(14);
    }
    if ([value integerValue]==2) {
    startY = AUTO(41);
    }
    if ([value integerValue]==3) {
    startY = AUTO(68);
    }

    CGPoint point = CGPointMake(startX, startY);
    if (i==0) {
    [path moveToPoint:point];
    }else{
    [path addLineToPoint:point];//终点
    }



    UIView *ponitView = [UIView new];

    ponitView.frame = CGRectMake(0, 0, 7, 7);
    [ponitView hg_setAllCornerWithCornerRadius:3.5];
    ponitView.center = point;
    if ([value intValue]==1) {
    ponitView.backgroundColor = JCBaseColor;
    }
    if ([value intValue]==2) {
        ponitView.backgroundColor = COLOR_30B27A;
    }
    if ([value intValue]==3) {
    ponitView.backgroundColor = COLOR_002868;
    }

    [self.circleBgView addSubview:ponitView];

    [pointArray addObject:ponitView];
    }

    [path stroke];
    //        [path closePath];//第五条线通过调用closePath方法得到的
    //    [path stroke];//Draws line 根据坐标点连线
    [path fill];//颜色填充

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    //    shapeLayer.lineDashPattern = @[@(distance),@(distance1),@0,@0,@0];
    shapeLayer.path = path.CGPath;
    shapeLayer.lineWidth = 1;
    shapeLayer.strokeColor = COLOR_DDDDDD.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    [self.circleBgView.layer addSublayer:shapeLayer];

    [pointArray enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [self.circleBgView bringSubviewToFront:obj];
    }];
}

- (UILabel *)windLab {
    if (!_windLab) {
        _windLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _windLab;
}

- (UILabel *)eqalLab {
    if (!_eqalLab) {
        _eqalLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_30B27A andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _eqalLab;
}

- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _loseLab;
}
- (UILabel *)zs_infoLab {
    if (!_zs_infoLab) {
        _zs_infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _zs_infoLab;
}

@end
