//
//  JCHongbangTopInfoView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangTopInfoView.h"

@interface JCHongbangTopInfoView()

@property (nonatomic,assign) CGPoint lastPoint;

@end

@implementation JCHongbangTopInfoView



- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;
    
    UIView *rateBgView = [UIView new];
    rateBgView.backgroundColor = JCWhiteColor;
    [self addSubview:rateBgView];
    [rateBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.offset(8);
        make.height.mas_equalTo(73);
    }];
    
    float width = (SCREEN_WIDTH-30)/4.0f;
    
    [rateBgView addSubview:self.huibaoLab];
    [self.huibaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(12);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(25);
    }];
    
    
    [rateBgView addSubview:self.huibaoInfoLab];
    [self.huibaoInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.huibaoLab);
        make.top.equalTo(self.huibaoLab.mas_bottom).offset(8);
    }];
    
    [rateBgView addSubview:self.recent_hongLab];
    [self.recent_hongLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.huibaoLab.mas_right);
        make.top.offset(12);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(25);
    }];
    
    [rateBgView addSubview:self.recent_hongInfoLab];
    [self.recent_hongInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.recent_hongLab);
        make.top.equalTo(self.recent_hongLab.mas_bottom).offset(8);
    }];
    
    [rateBgView addSubview:self.most_hongLab];
    [self.most_hongLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.recent_hongLab.mas_right);
        make.top.offset(12);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(25);
    }];
    
    [rateBgView addSubview:self.most_hongInfoLab];
    [self.most_hongInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.most_hongLab);
        make.top.equalTo(self.most_hongLab.mas_bottom).offset(8);
    }];
    
    [rateBgView addSubview:self.mizhongLab];
    [self.mizhongLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.most_hongLab.mas_right);
        make.top.offset(12);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(25);
    }];
    
    [rateBgView addSubview:self.mizhongInfoLab];
    [self.mizhongInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mizhongLab);
        make.top.equalTo(self.mizhongLab.mas_bottom).offset(8);
    }];

    
    UIView *circleBgView = [UIView new];
    circleBgView.backgroundColor = JCWhiteColor;
    self.circleBgView = circleBgView;
    [self addSubview:circleBgView];
    [circleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(90);
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(-8);
    }];
    
    [circleBgView addSubview:self.circleView];
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.top.offset(20);//30
        make.width.height.mas_equalTo(110);
    }];
    
    
    


    
    UILabel *zjLab = [UILabel initWithTitle:@"近0场战绩" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    self.zjCountLab = zjLab;
    [self addSubview:zjLab];
    [zjLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.circleView.mas_bottom).offset(-15);
        make.left.offset(35);
    }];
    
    UILabel *hongInfoLab = [UILabel initWithTitle:@"红" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [circleBgView addSubview:hongInfoLab];
    [hongInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.circleView.mas_right).offset(0);
        make.top.offset(20);
        make.width.height.mas_equalTo(20);
    }];
    
    UIView *hongLine = [UIView new];
    hongLine.backgroundColor =  COLOR_DBDBDB;
    [circleBgView addSubview:hongLine];
    [hongLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(170));
        make.centerY.equalTo(hongInfoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(180), 1));
    }];
    
    UILabel *zouInfoLab = [UILabel initWithTitle:@"走" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [circleBgView addSubview:zouInfoLab];
    [zouInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(hongInfoLab);
        make.top.offset(50);
        make.width.height.mas_equalTo(20);
    }];
    
    UIView *zouLine = [UIView new];
    zouLine.backgroundColor =  COLOR_DBDBDB;
    [circleBgView addSubview:zouLine];
    [zouLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(170));
        make.centerY.equalTo(zouInfoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(180), 1));
    }];
    
    
    UILabel *heiInfoLab = [UILabel initWithTitle:@"黑" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [circleBgView addSubview:heiInfoLab];
    [heiInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(hongInfoLab);
        make.top.offset(80);
        make.width.height.mas_equalTo(20);
    }];
    
    UIView *heiLine = [UIView new];
    heiLine.backgroundColor =  COLOR_DBDBDB;
    [circleBgView addSubview:heiLine];
    [heiLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(170));
        make.centerY.equalTo(heiInfoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(180), 1));
    }];
    
    UILabel *zsLab = [UILabel initWithTitle:@"近0场走势" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    self.zsCountLab = zsLab;
    [circleBgView addSubview:zsLab];
    [zsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(zjLab);
        make.left.equalTo(hongInfoLab.mas_right);
    }];
    
    [circleBgView addSubview:self.zs_infoLab];
    [self.zs_infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(zjLab);
        make.left.equalTo(zsLab.mas_right).offset(10);
    }];

}

- (void)setExprtModel:(JCWExpertBall *)exprtModel {
    _exprtModel = exprtModel;
    if (exprtModel.value.length>0) {
        UIColor *color = [UIColor colorWithHexString:exprtModel.value];
        self.huibaoLab.textColor = color;
    }
    
    self.huibaoLab.text = exprtModel.return_rate;//盈利率
    NSString *recent_hong= [NSString stringWithFormat:@"%ld连红",exprtModel.late_hong];
    NSMutableAttributedString *recent_hong_attr = [[NSMutableAttributedString alloc] initWithString:recent_hong];
    NSRange recent_hong_range = [recent_hong rangeOfString:@"连红"];
    [recent_hong_attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:recent_hong_range];
    self.recent_hongLab.attributedText = recent_hong_attr;
    NSString *history_hong= [NSString stringWithFormat:@"%@连红",exprtModel.history_hong];
    NSMutableAttributedString *history_hong_attr = [[NSMutableAttributedString alloc] initWithString:history_hong];
    NSRange history_hong_range = [history_hong rangeOfString:@"连红"];
    [history_hong_attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:history_hong_range];
    self.most_hongLab.attributedText = history_hong_attr;
    
    float hong = 0;
    NSInteger hei = 0;
    NSInteger zou = 0;


    NSArray *rateArray = [exprtModel.trend componentsSeparatedByString:@","];

    if (exprtModel.trend.length>0) {
        self.huibaoInfoLab.text = [NSString stringWithFormat:@"近%ld场盈利率",rateArray.count];
        self.zjCountLab.text = [NSString stringWithFormat:@"近%ld场战绩",rateArray.count];
        self.zsCountLab.text = [NSString stringWithFormat:@"近%ld场走势",rateArray.count];
        self.mizhongInfoLab.text = [NSString stringWithFormat:@"近%ld场命中率",rateArray.count];
    }
    
    for (int i=0; i<rateArray.count; i++) {
        NSString *value = rateArray[i];
        if ([value integerValue]==1) {
            hong++;
        }
        if ([value integerValue]==2) {
            hei++;
        }
        if ([value integerValue]==5) {
            zou++;
        }
    }
    NSString *hongString = [NSString stringWithFormat:@"%.0f红",hong];
    NSString *heiString = [NSString stringWithFormat:@"%ld黑",hei];
    NSString *zouString = [NSString stringWithFormat:@"%ld走",zou];
    NSString *zsString = [NSString stringWithFormat:@"%@   %@   %@",hongString,zouString,heiString];
    
    self.mizhongLab.text = [NSString stringWithFormat:@"%.0f%%",hong/rateArray.count*100];
    
    NSMutableAttributedString *zsAttr = [[NSMutableAttributedString alloc] initWithString:zsString];
    NSRange hong_range = [zsString rangeOfString:hongString];
    if (hong_range.location!=NSNotFound) {
        [zsAttr addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:hong_range];
    }
    NSRange zou_range = [zsString rangeOfString:zouString];
    if (zou_range.location!=NSNotFound) {
        [zsAttr addAttribute:NSForegroundColorAttributeName value:COLOR_002868 range:zou_range];
    }
    NSRange hei_range = [zsString rangeOfString:heiString];
    if (hei_range.location!=NSNotFound) {
        [zsAttr addAttribute:NSForegroundColorAttributeName value:COLOR_1B1B1B range:hei_range];
    }
    self.zs_infoLab.attributedText = zsAttr;
    
        NSMutableArray *pointArray = [NSMutableArray array];
        NSInteger startX = AUTO(150);
        NSInteger startY = 30;
        
        UIBezierPath* path = [UIBezierPath bezierPath];
        path.lineWidth = 1;
        
        path.lineCapStyle = kCGLineCapRound; //线条拐角
        path.lineJoinStyle = kCGLineJoinRound; //终点处理
        for (int i=0; i<rateArray.count; i++) {
            NSString *value = rateArray[i];
            startX = startX+AUTO(20);
            if ([value integerValue]==1) {
                startY = 30;
            }
            if ([value integerValue]==5) {
                startY = 60;
            }
            if ([value integerValue]==2) {
                startY = 90;
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
            if ([value intValue]==5) {
                ponitView.backgroundColor = COLOR_2655B3;
            }
            if ([value intValue]==2) {
                ponitView.backgroundColor = COLOR_505050;
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
    


            CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            pathAnimation.duration = 1;
            pathAnimation.repeatCount = 1;
            pathAnimation.removedOnCompletion = YES;
            pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
            pathAnimation.toValue = [NSNumber numberWithFloat:1];
            // 设置动画代理，动画结束时添加一个标签，显示折线终点的信息
//            pathAnimation.delegate = self;
            [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];



        [pointArray enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.circleBgView bringSubviewToFront:obj];
        }];

    

    self.circleView.drawColor = COLOR_F9502A;
    float hongRate =  (float)hong/rateArray.count;
    self.circleView.hongProgress = hongRate;
    float zouRate =  (float)zou/rateArray.count;;
    self.circleView.zouProgress = zouRate;
    float heiRate =  (float)hei/rateArray.count;;
    self.circleView.heiProgress = heiRate;
    [self.circleView setNeedsDisplay];
}

//- (void)data {

//
//
//
//
//
//}

- (UILabel *)huibaoInfoLab {
    if (!_huibaoInfoLab) {
        _huibaoInfoLab = [UILabel initWithTitle:@"近0场盈利率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _huibaoInfoLab;
}

- (UILabel *)recent_hongInfoLab {
    if (!_recent_hongInfoLab) {
        _recent_hongInfoLab = [UILabel initWithTitle:@"近期情况" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _recent_hongInfoLab;
}

- (UILabel *)most_hongInfoLab {
    if (!_most_hongInfoLab) {
        _most_hongInfoLab = [UILabel initWithTitle:@"最高连红" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _most_hongInfoLab;
}

- (UILabel *)huibaoLab {
    if (!_huibaoLab) {
        _huibaoLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _huibaoLab;
}

- (UILabel *)recent_hongLab {
    if (!_recent_hongLab) {
        _recent_hongLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _recent_hongLab;
}

- (UILabel *)mizhongLab {
    if (!_mizhongLab) {
        _mizhongLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _mizhongLab;
}

- (UILabel *)mizhongInfoLab {
    if (!_mizhongInfoLab) {
        _mizhongInfoLab = [UILabel initWithTitle:@"近10场命中率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _mizhongInfoLab;
}

- (UILabel *)most_hongLab {
    if (!_most_hongLab) {
        _most_hongLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _most_hongLab;
}

- (JCHongBangCircleView *)circleView {
    if (!_circleView) {
        _circleView = [JCHongBangCircleView new];
    }
    return _circleView;
}

- (UILabel *)zs_infoLab {
    if (!_zs_infoLab) {
        _zs_infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _zs_infoLab;
}

@end
