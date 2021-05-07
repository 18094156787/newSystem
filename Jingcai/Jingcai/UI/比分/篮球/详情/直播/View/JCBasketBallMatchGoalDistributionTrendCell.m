//
//  JCBasketBallMatchGoalDistributionTrendCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchGoalDistributionTrendCell.h"
//#define totalWidth SCREEN_WIDTH-40

@interface JCBasketBallMatchGoalDistributionTrendCell()

@property (nonatomic,strong) UILabel *label0;

@property (nonatomic,strong) UILabel *label15;

@property (nonatomic,strong) UILabel *label30;

@property (nonatomic,strong) UILabel *label45;

@property (nonatomic,strong) UILabel *label60;

@property (nonatomic,strong) UILabel *label75;

@property (nonatomic,strong) UILabel *label90;

@end

@implementation JCBasketBallMatchGoalDistributionTrendCell

- (void)initViews {

    
    [self addSubview:self.bgScrollow];
    
    self.bgScrollow.frame= CGRectMake(40, 60, 0, 40);

    
//    [self addSubview:self.homeActionView];
//    self.homeActionView.frame = CGRectMake(40, 50, 0, 10);
//    [self addSubview:self.homeActionColorView];
//    self.homeActionColorView.frame = CGRectMake(40, 50, 0, 10);
    
    [self.bgScrollow addSubview:self.homeView];
    self.homeView.frame = CGRectMake(0, 0, 0, 20);
    
//    [self addSubview:self.awayActionView];
//    self.awayActionView.frame = CGRectMake(0, 100, 0, 10);
    
//    [self addSubview:self.awayActionColorView];
//    self.awayActionColorView.frame = CGRectMake(40, 50, 0, 10);
    
    [self.bgScrollow addSubview:self.awayView];
    self.awayView.frame = CGRectMake(0, 20, 0, 20);

}

- (void)drawGoalViewWithDataArray:(NSArray *)rateArray view:(UIView *)trendView{
        NSMutableArray *pointArray = [NSMutableArray array];
//        NSArray *rateArray = @[@"1",@"2",@"2",@"1",@"5",@"5",@"1"];
    NSLog(@"每个宽度=%.0f",self.singleWidth);
    float xLength = self.singleWidth;//每一格x的宽度
//    float xLength = 10;//每一格x的宽度
//    float yLength = 20/100.0f;
    float yLength = 20/self.maxValue;
        float startX = 0;
        float action_startX = 0;
        float startY = 0;
    if (trendView==self.homeView) {
        startY = 20;
    }
                
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 0.001f;
        
        path.lineCapStyle = kCGLineCapButt; //线条拐角
        path.lineJoinStyle = kCGLineCapButt; //终点处理
        for (int i=0; i<rateArray.count; i++) {
            NSString *value = rateArray[i];

            if (i>0) {
                startX = startX+xLength;
//                startY = -[value floatValue]*yLength+30;
                if (trendView==self.homeView) {
                    startY = -[value floatValue]*yLength+20;
                }else{
                    startY = -[value floatValue]*yLength;
                }
            }
            if (i==rateArray.count-1) {
                startX = startX-xLength;
//                startY = 0;
            }
            
            CGPoint point = CGPointMake(startX, startY);
            if (i==0) {
                [path moveToPoint:point];
            }else{
                [path addLineToPoint:point];//终点
            }
            
            if (trendView==self.awayView) {

                
//        for (JCZBIncidentModel *model in self.incidentArray) {
////                        if ([model.time intValue]==1) {
//            if (model==self.incidentArray.lastObject) {
//                //
//            }
//
//            action_startX = xLength*[model.time intValue];
//                if ([model.type intValue]!=0&&[model.type intValue]!=10&&[model.type intValue]!=11&&[model.type intValue]!=12&&[model.type intValue]!=27) {
//
//                    if ([model.type intValue]>0) {
//
////                        if ([model.time intValue]==i) {
//                            UIImageView *actionImgView = [UIImageView new];
//                            if ([model.position intValue]==1) {
//
//                                actionImgView.frame = CGRectMake(0, 0, AUTO(8), AUTO(8));
//                                actionImgView.centerX = action_startX;
//                                [self.homeActionView addSubview:actionImgView];
////                                break;
//                            }  else if ([model.position intValue]==2) {
//                                actionImgView.frame = CGRectMake(0, 0, AUTO(8), AUTO(8));
//                                actionImgView.centerX = action_startX;
//                                [self.awayActionView addSubview:actionImgView];
////                                break;
//                            }
//                            if ([model.type intValue]==1) {
//                                actionImgView.image = JCIMAGE(@"ic_action_jinqiu");
//                            }
//                            if ([model.type intValue]==2) {
//                                actionImgView.image = JCIMAGE(@"ic_action_jiaoqiu");
//                            }
//                            if ([model.type intValue]==3) {
//                                actionImgView.image = JCIMAGE(@"ic_action_yp");
//                            }
//                            if ([model.type intValue]==4) {
//                                actionImgView.image = JCIMAGE(@"ic_action_rp");
//                            }
//                            if ([model.type intValue]==8) {
//                                actionImgView.image = JCIMAGE(@"ic_action_yp");
//                            }
//                            if ([model.type intValue]==9) {
//                                actionImgView.image = JCIMAGE(@"ic_action_hr");
//                            }
////                            if ([model.type intValue]==11) {
////                                actionImgView.image = JCIMAGE(@"ic_action_dq");
////                            }
////                            if ([model.type intValue]==12) {
////                                actionImgView.image = JCIMAGE(@"ic_action_dq");
////                            }
//                            if ([model.type intValue]==15) {
//                                actionImgView.image = JCIMAGE(@"ic_action_hyp");
//                            }
//                            if ([model.type intValue]==16) {
//                                actionImgView.image = JCIMAGE(@"ic_action_dqwj");
//                            }
//                            if ([model.type intValue]==17) {
//                                actionImgView.image = JCIMAGE(@"ic_action_wlq");
//                            }
//
////                        }
//
//
//
//                    }
//
//
//                }
//
//        }
                
            }

        }


            [path stroke];
    //        [path closePath];//第五条线通过调用closePath方法得到的
            //    [path stroke];//Draws line 根据坐标点连线
            [path fill];//颜色填充

            CAShapeLayer *shapeLayer = [CAShapeLayer layer];
            //    shapeLayer.lineDashPattern = @[@(distance),@(distance1),@0,@0,@0];
            shapeLayer.path = path.CGPath;
            shapeLayer.lineWidth = 0.0001f;
            shapeLayer.strokeColor = JCClearColor.CGColor;
            if (trendView==self.awayView) {
                shapeLayer.fillColor = [COLOR_DBDEE6 colorWithAlphaComponent:0.8].CGColor;
            }else {
                shapeLayer.fillColor = [COLOR_FFC7B0 colorWithAlphaComponent:0.8].CGColor;
            }
            
            trendView.layer.masksToBounds = YES;
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
    
     
    [self bringSubviewToFront:self.homeActionView];
    [self bringSubviewToFront:self.awayActionView];




}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (!dataArray) {
        return;
    }
//    self.timeArray = @[@"0",@"10",@"20",@"30",@""];
    if (self.trend_per==0) {
        self.trend_per = 10;
    }
    NSMutableArray *timeArray = [NSMutableArray array];
    for (int i=0; i<self.trend_count+1; i++) {
        NSString *str = @"";
        if (i==0) {
            str = @"0";
        }else if(i==self.trend_count){
            str = @"";
        }else{
            str = [NSString stringWithFormat:@"%ld",self.trend_per*i];
        }
        [timeArray addObject:str];
    }
    self.timeArray = [NSArray arrayWithArray:timeArray];
//    if (self.trend_per==12) {
//        self.timeArray = @[@"0",@"12",@"24",@"36",@""];
//    }
//
    
    self.singleWidth = (SCREEN_WIDTH-60)/(self.trend_per*self.trend_count+2);
    
    self.goalArray = [NSMutableArray array];
    self.halfGoalArray = [NSMutableArray array];
    [dataArray enumerateObjectsUsingBlock:^(NSArray  * obj, NSUInteger idx, BOOL * _Nonnull stop) {

        [obj enumerateObjectsUsingBlock:^(NSString *goal, NSUInteger idxx, BOOL * _Nonnull stop) {
            [self.goalArray addObject:[NSString stringWithFormat:@"%ld",-[goal integerValue]]];
            if (idx==0) {
                [self.halfGoalArray addObject:goal];
            }
        }];
        
    }];

    float  max = [[self.goalArray valueForKeyPath:@"@max.floatValue"] floatValue];
    float min = [[self.goalArray valueForKeyPath:@"@min.floatValue"] floatValue];
     float max_m =  fabsf(max);
    float min_n =  fabsf(min);
    if (max_m>=min_n) {
        self.maxValue =max_m;
    }else{
        self.maxValue =min_n;
    }

    self.firstValue = self.goalArray.firstObject;
    self.lastValue = self.goalArray.lastObject;
    [self.goalArray insertObject:@"0" atIndex:0];
    [self.goalArray addObject:@"0"];

    [self drawGoalViewWithDataArray:self.goalArray view:self.homeView];
    [self drawGoalViewWithDataArray:self.goalArray view:self.awayView];
//    return;
//    self.homeActionView.frame = CGRectMake(40, 50, self.singleWidth*95, 10);
//    self.awayActionView.frame = CGRectMake(40, 100, self.singleWidth*95, 10);
    
    self.homeView.frame = CGRectMake(0, 0, self.singleWidth*92, 20);
    self.awayView.frame = CGRectMake(0, 20, self.singleWidth*92, 20);
    UIView *lineView = [UIView new];
     lineView.backgroundColor = COLOR_DDDDDD;
    lineView.frame = CGRectMake(40, 60, self.singleWidth*(self.trend_per*self.trend_count), 0.5);
    
    [self addSubview:lineView];
    
    self.homeScoreLab.text = [NSString stringWithFormat:@"%.0f",self.maxValue];
    self.homeScoreLab.frame = CGRectMake(40+self.singleWidth*(self.trend_per*self.trend_count), 30, 30, 20);
    [self addSubview:self.homeScoreLab];
    
    self.middleScoreLab.text = @"0";
    self.middleScoreLab.frame = CGRectMake(40+self.singleWidth*(self.trend_per*self.trend_count), 50, 30, 20);
    [self addSubview:self.middleScoreLab];
    
    self.awayScoreLab.text = [NSString stringWithFormat:@"%.0f",self.maxValue]; 
    self.awayScoreLab.frame = CGRectMake(40+self.singleWidth*(self.trend_per*self.trend_count), 70, 30, 20);
    [self addSubview:self.awayScoreLab];
    
    self.bgScrollow.frame = CGRectMake(40, 40, self.singleWidth*(self.goalArray.count-2), 40);
//        self.bgScrollow.frame = CGRectMake(40, 60, self.singleWidth*95, 40);
    self.homeView.frame = CGRectMake(0, 0, self.singleWidth*(self.goalArray.count-2), 20);
    self.awayView.frame = CGRectMake(0, 20, self.singleWidth*(self.goalArray.count-2), 20);


    
//     self.bgScrollow.frame = CGRectMake(40, 60, self.singleWidth*95, 40);
    


     [self addSubview:self.endLineView];
    self.endLineView.frame = CGRectMake(40+self.singleWidth*(self.goalArray.count-2), 40, 1, 40);
    [self addSubview:self.endTimeLab];
   self.endTimeLab.frame = CGRectMake(40+self.singleWidth*(self.goalArray.count-2), 20, 20, 20);
    self.endTimeLab.text = [NSString stringWithFormat:@"%ld′",self.goalArray.count-2];
    self.endTimeLab.centerX = self.endLineView.centerX;
    
    self.homeImgView.frame = CGRectMake(12, 30, 24, 24);
    [self addSubview:self.homeImgView];
    self.awayImgView.frame = CGRectMake(12, 65, 24, 24);
    [self addSubview:self.awayImgView];
    

        for (int i=0; i<self.timeArray.count; i++) {
            NSString *value = self.timeArray[i];
            int valueInt = [value intValue];
                NSString *title = [NSString stringWithFormat:@"%@′",value];
            if(i==4){
                title = @"";
            }
//            int half = 45;
//
//            if (i==3&&self.halfGoalArray.count>=45) {
//                half = (int)self.halfGoalArray.count;
//                valueInt = half;
//            }
            float startX = 0;
            
            if (i==0||i==1||i==2||i==3||i==4) {

                
                UILabel *timeLab;
                if (i==0) {
                    timeLab = self.label0;
                }
                if (i==1) {
                    timeLab = self.label15;
                }
                if (i==2) {
                    timeLab = self.label30;
                }
 
                if (i==3) {
                    timeLab = self.label45;
                }
                if (i==4) {
                    timeLab = self.label60;
                }
 


                timeLab.text = title;
                
                
               
                if (i==4) {
                    startX = startX +self.singleWidth*(self.trend_per*self.trend_count);
                }else{
                    startX = startX +self.singleWidth*valueInt;
                }
                 timeLab.frame = CGRectMake(30+startX, 100, 20, 20);

                 [self addSubview:timeLab];

                UIView *lineLab = [UIView new];
                 lineLab.backgroundColor = COLOR_DDDDDD;
                 lineLab.frame = CGRectMake(0, 20, 0.5, 80);
                 lineLab.centerX= timeLab.centerX;

                 [self addSubview:lineLab];
                
                [self.timeViewArray addObject:timeLab];
                [self.timeViewArray addObject:lineLab];

            }
//            self.isLoadTime = YES;
        }

}

- (void)setMatchBall:(JCBasketBallMatchBall *)matchBall {
    if (!matchBall) {
        return;
    }
    _matchBall = matchBall;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.away_team_logo] placeholderImage:JCIMAGE(@"ic_match_basketball")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.home_team_logo] placeholderImage:JCIMAGE(@"ic_match_basketball")];
}


- (UIScrollView *)bgScrollow {
    if (!_bgScrollow) {
        _bgScrollow = [UIScrollView new];
        _bgScrollow.backgroundColor = COLOR_F4F6F9;

    }
    return _bgScrollow;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
    }
    return _awayImgView;
}

- (UIView *)homeView {
    if (!_homeView) {
        _homeView = [UIView new];
        _homeView.backgroundColor = [COLOR_FFC7B0 colorWithAlphaComponent:0.5];
    }
    return _homeView;
}

- (UIView *)awayView {
    if (!_awayView) {
        _awayView = [UIView new];
//        _awayView.backgroundColor = [COLOR_B2BACD colorWithAlphaComponent:0.1];
    }
    return _awayView;
}

- (UIView *)homeActionView {
    if (!_homeActionView) {
        _homeActionView = [UIView new];
//        _homeActionView.backgroundColor = [COLOR_FFC7B0 colorWithAlphaComponent:0.8];

    }
    return _homeActionView;
}

- (UIView *)awayActionView {
    if (!_awayActionView) {
        _awayActionView = [UIView new];
//        _awayActionView.backgroundColor = [COLOR_B2BACD colorWithAlphaComponent:0.1];
    }
    return _awayActionView;
}

- (UIView *)homeActionColorView {
    if (!_homeActionColorView) {
        _homeActionColorView = [UIView new];
//        _homeActionColorView.backgroundColor = [COLOR_FFC7B0 colorWithAlphaComponent:0.8];
    }
    return _homeActionColorView;
}

- (UIView *)awayActionColorView {
    if (!_awayActionColorView) {
        _awayActionColorView = [UIView new];
//        _awayActionColorView.backgroundColor = [COLOR_B2BACD colorWithAlphaComponent:0.1];
    }
    return _awayActionColorView;
}

- (UIView *)endLineView {
    if (!_endLineView) {
        _endLineView = [UIView new];
        _endLineView.backgroundColor = COLOR_FFC7B0;
    }
    return _endLineView;
}
//- (NSArray *)timeArray {
//    if (!_timeArray) {
//        _timeArray = @[@"0",@"15",@"30",@"45",@"60",@"75",@"90"];
//    }
//    return _timeArray;
//}

- (NSMutableArray *)timeViewArray {
    if (!_timeViewArray) {
        _timeViewArray  = [NSMutableArray array];
    }
    return _timeViewArray;
}

- (UILabel *)label0 {
    if (!_label0) {
        _label0 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label0;
}

- (UILabel *)label15 {
    if (!_label15) {
        _label15 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label15;
}

- (UILabel *)label30 {
    if (!_label30) {
        _label30 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label30;
}

- (UILabel *)label45 {
    if (!_label45) {
        _label45 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label45;
}

- (UILabel *)label60 {
    if (!_label60) {
        _label60 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label60;
}


- (UILabel *)label75 {
    if (!_label75) {
        _label75 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label75;
}

- (UILabel *)label90 {
    if (!_label90) {
        _label90 = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _label90;
}

- (UILabel *)homeScoreLab {
    if (!_homeScoreLab) {
        _homeScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeScoreLab;
}

- (UILabel *)awayScoreLab {
    if (!_awayScoreLab) {
        _awayScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayScoreLab;
}

- (UILabel *)middleScoreLab {
    if (!_middleScoreLab) {
        _middleScoreLab = [UILabel initWithTitle:@"0" andFont:AUTO(10) andWeight:1 andTextColor:[COLOR_999999 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _middleScoreLab;
}

- (UILabel *)endTimeLab {
    if (!_endTimeLab) {
        _endTimeLab = [UILabel initWithTitle:@"0" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_FFC7B0 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _endTimeLab;
}

@end
