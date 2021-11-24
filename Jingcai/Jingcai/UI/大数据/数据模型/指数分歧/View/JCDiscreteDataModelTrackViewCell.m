//
//  JCDiscreteDataModelTrackViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDiscreteDataModelTrackViewCell.h"
#import "JCDiscreteTrackRateModel.h"
@implementation JCDiscreteDataModelTrackViewCell

- (void)initViews {
    
    [self.contentView addSubview:self.trackView];
    [self.trackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    UIView *awayWinView =[UIView new];
    awayWinView.backgroundColor = COLOR_002868;
//    [awayWinView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.trackView addSubview:awayWinView];
    [awayWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-15));
        make.width.height.mas_equalTo(AUTO(16));
    }];
    
    UILabel *awayWinLab = [UILabel initWithTitle:@"客胜" andFont:AUTO(11) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.trackView addSubview:awayWinLab];
    [awayWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(awayWinView);
        make.right.equalTo(awayWinView.mas_left).offset(AUTO(-4));
    }];
    

    UIView *eqalView =[UIView new];
    eqalView.backgroundColor = COLOR_30B27A;
//    [eqalView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.trackView addSubview:eqalView];
    [eqalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(awayWinView);
        make.right.equalTo(awayWinLab.mas_left).offset(-AUTO(15));
        make.width.height.mas_equalTo(AUTO(16));
    }];
    
    UILabel *eqalWinLab = [UILabel initWithTitle:@"平" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.trackView addSubview:eqalWinLab];
    [eqalWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(eqalView);
        make.height.mas_equalTo(AUTO(15));
        make.right.equalTo(eqalView.mas_left).offset(-4);
    }];
    
    UIView *homeWindView =[UIView new];
    homeWindView.backgroundColor = JCBaseColor;
//    [homeWindView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self.trackView addSubview:homeWindView];
    [homeWindView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(awayWinView);
        make.right.equalTo(eqalWinLab.mas_left).offset(AUTO(-15));
        make.width.height.mas_equalTo(AUTO(16));
    }];
    

    
    UILabel *homeWinLab = [UILabel initWithTitle:@"主胜" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.trackView addSubview:homeWinLab];
    [homeWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(eqalView);
        make.height.mas_equalTo(AUTO(15));
        make.right.equalTo(homeWindView.mas_left).offset(-4);
    }];
    

    [self.trackView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(100));
        make.top.equalTo(homeWinLab.mas_bottom).offset(AUTO(30));
    }];

    [self.trackView addSubview:self.lastTimeLab];
    [self.lastTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(70);
        make.bottom.offset(AUTO(-20));
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self.trackView addSubview:self.nowTimeLab];
    [self.nowTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lastTimeLab);
        make.centerX.equalTo(self.trackView.mas_centerX).offset(35);
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self.trackView addSubview:self.beginTimeLab];
    [self.beginTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lastTimeLab);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(17));
    }];
    
}

- (void)setTrendArray:(NSArray *)trendArray {
    if (trendArray.count==0) {
        return;
    }
    
    _trendArray = trendArray;
    [self.bottomView removeAllSubviews];
    [self.bottomView.layer removeAllSublayers];
    NSMutableArray *numberTitlteArray = [NSMutableArray array];
    
    for (int i=0; i<6; i++) {
        NSString *title = [NSString stringWithFormat:@"%d%%",20*i];
        [numberTitlteArray addObject:title];
    }
//    [numberTitlteArray insertObject:[NSString stringWithFormat:@"%.2f",[self.largeModel.small floatValue]] atIndex:0];
   NSArray * titleArray = [NSArray arrayWithArray:numberTitlteArray];
     titleArray = [[[titleArray copy] reverseObjectEnumerator] allObjects];
    for (int i=0; i<titleArray.count; i++) {
        UIImageView *lineView = [UIImageView new];
        lineView.image = JCIMAGE(@"jc_bigdata_divider");
        lineView.frame = CGRectMake(60, i*AUTO(25), SCREEN_WIDTH-80, 1);
        [self.bottomView addSubview:lineView];

        UILabel *numberLab = [UILabel initWithTitle:titleArray[i] andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
        numberLab.frame = CGRectMake(5, 0, 45, 25);
        numberLab.centerY = lineView.centerY;
        [self.bottomView addSubview:numberLab];
    }

    NSMutableArray *winArray = [NSMutableArray array];
    
    NSMutableArray *eqalArray = [NSMutableArray array];
    NSMutableArray *loseArray = [NSMutableArray array];
    NSMutableArray *timeArray = [NSMutableArray array];
    [trendArray enumerateObjectsUsingBlock:^(JCDiscreteTrackRateModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.odds_rate.count==3) {
            if ([obj.type integerValue]!=0) {
                [winArray addObject:obj.odds_rate[0]];
                [eqalArray addObject:obj.odds_rate[1]];
                [loseArray addObject:obj.odds_rate[2]];
                [timeArray addObject:[NSString stringWithFormat:@"%@",obj.time_item]];
            }

        }

    }];

    [self drawGoalViewWithDataArray:winArray  timeArray:timeArray view:self.bottomView lineColor:JCBaseColor];
    [self drawGoalViewWithDataArray:eqalArray timeArray:timeArray view:self.bottomView lineColor:COLOR_30B27A];
    [self drawGoalViewWithDataArray:loseArray timeArray:timeArray view:self.bottomView lineColor:COLOR_002868];
    
}
- (void)drawGoalViewWithDataArray:(NSArray *)rateArray timeArray:(NSArray *)timeArray view:(UIView *)trendView lineColor:(UIColor *)lineColor {
    NSMutableArray *pointArray = [NSMutableArray array];
    float startY = 0;
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 0.001f;

        path.lineCapStyle = kCGLineCapButt; //线条拐角
        path.lineJoinStyle = kCGLineJoinRound; //终点处理
        for (int i=0; i<rateArray.count; i++) {
            NSString *value = rateArray[i];
            NSString *time = timeArray[i];
//            NSLog(@"时间=%@",time);
            float startX = 60+(2880-[time floatValue])/2880.0f*(SCREEN_WIDTH-80);

            float value3 = AUTO(100)*[value floatValue]/100;
            startY = -value3+AUTO(115);
            CGPoint point = CGPointMake(startX, startY);
            NSLog(@"点数%@",NSStringFromCGPoint(point));
            if (i==0) {
                [path moveToPoint:point];
            }else{
                [path addLineToPoint:point];//终点
            }

        }


            [path stroke];
    //        [path closePath];//第五条线通过调用closePath方法得到的
            //    [path stroke];//Draws line 根据坐标点连线
            [path fill];//颜色填充

            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            //    shapeLayer.lineDashPattern = @[@(distance),@(distance1),@0,@0,@0];
            shapeLayer.path = path.CGPath;
            shapeLayer.lineWidth = 2;
            shapeLayer.strokeColor = lineColor.CGColor;
            shapeLayer.fillColor = nil;

//            trendView.layer.masksToBounds = YES;
            [trendView.layer addSublayer:shapeLayer];

            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnimation.duration = 1;
            pathAnimation.repeatCount = 1;
            pathAnimation.removedOnCompletion = YES;
            pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            pathAnimation.toValue = [NSNumber numberWithFloat:1];
            // 设置动画代理，动画结束时添加一个标签，显示折线终点的信息
    //            pathAnimation.delegate = self;
//            [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];



        [pointArray enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [trendView bringSubviewToFront:obj];
        }];
}


- (UIView *)trackView {
    if (!_trackView) {
        _trackView = [UIView new];
    }
    return _trackView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
    }
    return _bottomView;
}

- (UILabel *)lastTimeLab {
    if (!_lastTimeLab) {
        _lastTimeLab = [UILabel initWithTitle:@"赛前(48h)" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _lastTimeLab;
}

- (UILabel *)nowTimeLab {
    if (!_nowTimeLab) {
        _nowTimeLab = [UILabel initWithTitle:@"赛前(24h)" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nowTimeLab;
}

- (UILabel *)beginTimeLab {
    if (!_beginTimeLab) {
        _beginTimeLab = [UILabel initWithTitle:@"比赛开始" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _beginTimeLab;
}

@end
