//
//  JCMatchGoalDistributionTrendHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMatchGoalDistributionTrendHeadView.h"
#define totalWidth SCREEN_WIDTH-40
#define singleWidth (SCREEN_WIDTH-70)/90.0f
@interface JCMatchGoalDistributionTrendHeadView()

@property (nonatomic,strong) UILabel *label0;

@property (nonatomic,strong) UILabel *label15;

@property (nonatomic,strong) UILabel *label30;

@property (nonatomic,strong) UILabel *label45;

@property (nonatomic,strong) UILabel *label60;

@property (nonatomic,strong) UILabel *label75;

@property (nonatomic,strong) UILabel *label90;

@end

@implementation JCMatchGoalDistributionTrendHeadView

- (void)initViews {

    self.backgroundColor= JCWhiteColor;
    [self addSubview:self.bgScrollow];
    
    self.bgScrollow.frame= CGRectMake(40, 60, 0, 40);

    
    [self addSubview:self.homeActionView];
    self.homeActionView.frame = CGRectMake(40, 50, 0, 10);
    [self addSubview:self.homeActionColorView];
    self.homeActionColorView.frame = CGRectMake(40, 50, 0, 10);
    
    [self.bgScrollow addSubview:self.homeView];
    self.homeView.frame = CGRectMake(0, 0, 0, 20);
    
    [self addSubview:self.awayActionView];
    self.awayActionView.frame = CGRectMake(0, 100, 0, 10);
    
    [self addSubview:self.awayActionColorView];
    self.awayActionColorView.frame = CGRectMake(40, 50, 0, 10);
    
    [self.bgScrollow addSubview:self.awayView];
    self.awayView.frame = CGRectMake(0, 20, 0, 20);

}

- (void)drawGoalViewWithDataArray:(NSArray *)rateArray view:(UIView *)trendView{
        NSMutableArray *pointArray = [NSMutableArray array];
//        NSArray *rateArray = @[@"1",@"2",@"2",@"1",@"5",@"5",@"1"];
    NSLog(@"每个宽度=%.0f",singleWidth);
    float xLength = singleWidth;//每一格x的宽度
//    float xLength = 10;//每一格x的宽度
    float yLength = 20/100.0f;
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
                [self.homeActionView removeAllSubviews];
                [self.awayActionView removeAllSubviews];


        for (JCZBIncidentModel *model in self.incidentArray) {
//                        if ([model.time intValue]==1) {
            if (model==self.incidentArray.lastObject) {
                //
            }
            
            action_startX = xLength*[model.time intValue];
                if ([model.type intValue]!=0&&[model.type intValue]!=10&&[model.type intValue]!=11&&[model.type intValue]!=12&&[model.type intValue]!=27) {
                    
                    if ([model.type intValue]>0) {
                         
//                        if ([model.time intValue]==i) {
                            UIImageView *actionImgView = [UIImageView new];
                            if ([model.position intValue]==1) {
                               
                                actionImgView.frame = CGRectMake(0, 0, AUTO(8), AUTO(8));
                                actionImgView.centerX = action_startX;
                                [self.homeActionView addSubview:actionImgView];
//                                break;
                            }  else if ([model.position intValue]==2) {
                                actionImgView.frame = CGRectMake(0, 0, AUTO(8), AUTO(8));
                                actionImgView.centerX = action_startX;
                                [self.awayActionView addSubview:actionImgView];
//                                break;
                            }
                            if ([model.type intValue]==1) {
                                actionImgView.image = JCIMAGE(@"ic_action_jinqiu");
                            }
                            if ([model.type intValue]==2) {
                                actionImgView.image = JCIMAGE(@"ic_action_jiaoqiu");
                            }
                            if ([model.type intValue]==3) {
                                actionImgView.image = JCIMAGE(@"ic_action_yp");
                            }
                            if ([model.type intValue]==4) {
                                actionImgView.image = JCIMAGE(@"ic_action_rp");
                            }
                            if ([model.type intValue]==8) {
                                actionImgView.image = JCIMAGE(@"ic_action_yp");
                            }
                            if ([model.type intValue]==9) {
                                actionImgView.image = JCIMAGE(@"ic_action_hr");
                            }
//                            if ([model.type intValue]==11) {
//                                actionImgView.image = JCIMAGE(@"ic_action_dq");
//                            }
//                            if ([model.type intValue]==12) {
//                                actionImgView.image = JCIMAGE(@"ic_action_dq");
//                            }
                            if ([model.type intValue]==15) {
                                actionImgView.image = JCIMAGE(@"ic_action_hyp");
                            }
                            if ([model.type intValue]==16) {
                                actionImgView.image = JCIMAGE(@"ic_action_dqwj");
                            }
                            if ([model.type intValue]==17) {
                                actionImgView.image = JCIMAGE(@"ic_action_wlq");
                            }
                            
//                        }

                        

                    }
                    
                    
                }

        }
                
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



//        [pointArray enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [trendView bringSubviewToFront:obj];
//        }];
    
     
    [self bringSubviewToFront:self.homeActionView];
    [self bringSubviewToFront:self.awayActionView];




}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (!dataArray) {
        return;
    }
    self.goalArray = [NSMutableArray array];
    self.halfGoalArray = [NSMutableArray array];
    [dataArray enumerateObjectsUsingBlock:^(NSArray  * obj, NSUInteger idx, BOOL * _Nonnull stop) {

        [obj enumerateObjectsUsingBlock:^(NSString *goal, NSUInteger idxx, BOOL * _Nonnull stop) {
            [self.goalArray addObject:goal];
            if (idx==0) {
                [self.halfGoalArray addObject:goal];
            }
        }];
        
    }];



    self.firstValue = self.goalArray.firstObject;
    self.lastValue = self.goalArray.lastObject;
    [self.goalArray insertObject:@"0" atIndex:0];
    [self.goalArray addObject:@"0"];

    [self drawGoalViewWithDataArray:self.goalArray view:self.homeView];
    [self drawGoalViewWithDataArray:self.goalArray view:self.awayView];
//    return;
    self.homeActionView.frame = CGRectMake(40, 50, singleWidth*95, 10);
    self.awayActionView.frame = CGRectMake(40, 100, singleWidth*95, 10);
    
    self.homeView.frame = CGRectMake(0, 0, singleWidth*92, 20);
    self.awayView.frame = CGRectMake(0, 20, singleWidth*92, 20);
    UIView *lineView = [UIView new];
     lineView.backgroundColor = COLOR_DDDDDD;
    lineView.frame = CGRectMake(40, 80, singleWidth*95, 0.5);
    [self addSubview:lineView];

    if (self.goalArray.count>92) {
        self.bgScrollow.frame = CGRectMake(40, 60, singleWidth*(self.goalArray.count-2), 40);
        self.bgScrollow.frame = CGRectMake(40, 60, singleWidth*self.goalArray.count-2, 40);
        self.homeView.frame = CGRectMake(0, 0, singleWidth*(self.goalArray.count-2), 20);
        self.awayView.frame = CGRectMake(0, 20, singleWidth*(self.goalArray.count-2), 20);
        self.homeActionColorView.frame = CGRectMake(40, 50, singleWidth*(self.goalArray.count-2), 10);
        self.awayActionColorView.frame = CGRectMake(40, 100, singleWidth*(self.goalArray.count-2), 10);


        if (singleWidth*(self.goalArray.count-2)>totalWidth) {
            self.bgScrollow.frame = CGRectMake(40, 60, totalWidth, 40);
            self.bgScrollow.contentSize = CGSizeMake(singleWidth*(self.goalArray.count-2), 40);
        }

    }else{
        self.bgScrollow.frame = CGRectMake(40, 60, singleWidth*self.goalArray.count-2, 40);
//        self.bgScrollow.frame = CGRectMake(40, 60, singleWidth*95, 40);
        self.homeView.frame = CGRectMake(0, 0, singleWidth*(self.goalArray.count-2), 20);
        self.awayView.frame = CGRectMake(0, 20, singleWidth*(self.goalArray.count-2), 20);
        self.homeActionColorView.frame = CGRectMake(40, 50, singleWidth*(self.goalArray.count-2), 10);
        self.awayActionColorView.frame = CGRectMake(40, 100, singleWidth*(self.goalArray.count-2), 10);
    }
    
//     self.bgScrollow.frame = CGRectMake(40, 60, singleWidth*95, 40);
    


     [self addSubview:self.endLineView];
    self.endLineView.frame = CGRectMake(40+singleWidth*(self.goalArray.count-2), 60, 1, 40);

    
    self.homeImgView.frame = CGRectMake(12, 50, 24, 24);
    [self addSubview:self.homeImgView];
    self.awayImgView.frame = CGRectMake(12, 85, 24, 24);
    [self addSubview:self.awayImgView];
    
//    [self.timeViewArray enumerateObjectsUsingBlock:^(UIView  *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [obj removeFromSuperview];
//    }];
//    if (self.isLoadTime) {
//        return;
//    }
        for (int i=0; i<self.timeArray.count; i++) {
            NSString *value = self.timeArray[i];
            int valueInt = [value intValue];
                NSString *title = [NSString stringWithFormat:@"%@′",value];
            int half = 45;

            if (i==3&&self.halfGoalArray.count>=45) {
                half = (int)self.halfGoalArray.count;
                valueInt = half;
            }
            float startX = 0;
            
            if (valueInt==0||valueInt==15||valueInt==30||valueInt==half||valueInt==60||valueInt==75||valueInt==90) {

                
                UILabel *timeLab;
                if (valueInt==0) {
                    timeLab = self.label0;
                }
                if (valueInt==15) {
                    timeLab = self.label15;
                }
                if (valueInt==30) {
                    timeLab = self.label30;
                }
                if (valueInt==half) {
                    timeLab = self.label45;
                }
                if (valueInt==60) {
                    timeLab = self.label60;
                }
                if (valueInt==75) {
                    timeLab = self.label75;
                }
                if (valueInt==90) {
                    timeLab = self.label90;
                }


                if (i==3&&self.halfGoalArray.count>=45) {
                     title = @"HT";
                     timeLab.textColor = COLOR_FFC7B0;
                }

                timeLab.text = title;
                
                
                startX = startX +singleWidth*valueInt;
                 timeLab.frame = CGRectMake(30+startX, 20, 20, 20);

                 [self addSubview:timeLab];

                UIView *lineLab = [UIView new];
                 lineLab.backgroundColor = COLOR_DDDDDD;
                 lineLab.frame = CGRectMake(0, 40, 0.5, 80);
                 lineLab.centerX= timeLab.centerX;

                 [self addSubview:lineLab];
                
                [self.timeViewArray addObject:timeLab];
                [self.timeViewArray addObject:lineLab];

            }
//            self.isLoadTime = YES;
        }

}

- (void)setMatchBall:(JCMatchBall *)matchBall {
    if (!matchBall) {
        return;
    }
    _matchBall = matchBall;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.home_team.logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.away_team.logo] placeholderImage:JCIMAGE(@"away_placeholder")];
}


- (UIScrollView *)bgScrollow {
    if (!_bgScrollow) {
        _bgScrollow = [UIScrollView new];
        _bgScrollow.backgroundColor = COLOR_F4F6F9;
        _bgScrollow.scrollEnabled = NO;
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
- (NSArray *)timeArray {
    if (!_timeArray) {
        _timeArray = @[@"0",@"15",@"30",@"45",@"60",@"75",@"90"];
    }
    return _timeArray;
}

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

@end
