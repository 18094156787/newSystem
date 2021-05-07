//
//  JCMatchGoalDistributionInfoProgressView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchGoalDistributionInfoProgressView.h"

@implementation JCMatchGoalDistributionInfoProgressView

- (void)initViews {
    [self addSubview:self.progressView];
    self.progressView.layer.cornerRadius = AUTO(6);
    self.progressView.layer.masksToBounds = YES;
    self.progressView.frame = CGRectMake(AUTO(35), AUTO(15), AUTO(140), AUTO(12));
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self addSubview:self.leftLab];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressView);
        make.right.equalTo(self.progressView.mas_left).offset(AUTO(-10));
    }];
    
    [self addSubview:self.rightLab];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressView);
        make.left.equalTo(self.progressView.mas_right).offset(AUTO(10));
    }];
    
    [self addSubview:self.leftRateLab];
    [self.leftRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressView);
        make.left.equalTo(self.progressView.mas_left).offset(AUTO(5));
    }];
    
    [self addSubview:self.rightRateLab];
    [self.rightRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressView);
        make.right.equalTo(self.progressView.mas_right).offset(AUTO(-5));
    }];
    
    [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:0.5];
    [self setupLineView:self.progressView colors:COLOR_002868 startPoint:0.5 endPoint:1];
}

- (void)setShoot_centerModel:(JCLiveDistributionModel *)shoot_centerModel {
    _shoot_centerModel = shoot_centerModel;
    self.leftLab.text = shoot_centerModel.home.shoot_center;
        self.rightLab.text = shoot_centerModel.away.shoot_center;
//        self.titleLab.text = model.desc;
        float total = [shoot_centerModel.home.shoot_center floatValue]+[shoot_centerModel.away.shoot_center floatValue];
    
        if (total>0) {
            self.leftRateLab.text = [NSString stringWithFormat:@"%.0f%%",[shoot_centerModel.home.shoot_center floatValue]/total*100];
            self.rightRateLab.text = [NSString stringWithFormat:@"%.0f%%",[shoot_centerModel.away.shoot_center floatValue]/total*100];
            float homeRate = [shoot_centerModel.home.shoot_center floatValue]/total;
            [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:homeRate];
            [self setupLineView:self.progressView colors:COLOR_002868 startPoint:homeRate endPoint:1];
        }else{
            [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:0.5];
            [self setupLineView:self.progressView colors:COLOR_002868 startPoint:0.5 endPoint:1];
            self.leftRateLab.text  = @"50%";
            self.rightRateLab.text  = @"50%";
        }
}

- (void)setShoot_awayModel:(JCLiveDistributionModel *)shoot_awayModel {
    _shoot_awayModel = shoot_awayModel;
    self.leftLab.text = shoot_awayModel.home.shoot_way;
        self.rightLab.text = shoot_awayModel.away.shoot_way;
//        self.titleLab.text = model.desc;
        float total = [shoot_awayModel.home.shoot_way floatValue]+[shoot_awayModel.away.shoot_way floatValue];
    
        if (total>0) {
            self.leftRateLab.text = [NSString stringWithFormat:@"%.0f%%",[shoot_awayModel.home.shoot_way floatValue]/total*100];
            self.rightRateLab.text = [NSString stringWithFormat:@"%.0f%%",[shoot_awayModel.away.shoot_way floatValue]/total*100];
            float homeRate = [shoot_awayModel.home.shoot_way floatValue]/total;
            [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:homeRate];
            [self setupLineView:self.progressView colors:COLOR_002868 startPoint:homeRate endPoint:1];
        }else{
            [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:0.5];
            [self setupLineView:self.progressView colors:COLOR_002868 startPoint:0.5 endPoint:1];
            self.leftRateLab.text  = @"50%";
            self.rightRateLab.text  = @"50%";
        }
}


- (void)setModel:(JCWZBStatusModel *)model {
    _model = model;
    self.leftLab.text = model.away;
    self.rightLab.text = model.home;
    self.titleLab.text = model.desc;
    float total = [model.home floatValue]+[model.away floatValue];
    
    if (total>0) {
        self.leftRateLab.text = [NSString stringWithFormat:@"%.0f%%",[model.away floatValue]/total*100];
        self.rightRateLab.text = [NSString stringWithFormat:@"%.0f%%",[model.home floatValue]/total*100];
        float homeRate = [model.away floatValue]/total;
        [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:homeRate];
        [self setupLineView:self.progressView colors:COLOR_002868 startPoint:homeRate endPoint:1];
    }else{
        [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:0.5];
        [self setupLineView:self.progressView colors:COLOR_002868 startPoint:0.5 endPoint:1];
        self.leftRateLab.text  = @"50%";
        self.rightRateLab.text  = @"50%";
    }
    
}

- (void)setBasketBallModel:(JCWZBStatusModel *)basketBallModel {
    _basketBallModel = basketBallModel;
    self.leftLab.text = [NSString stringWithFormat:@"%@",@([basketBallModel.away floatValue])];
    self.rightLab.text = [NSString stringWithFormat:@"%@",@([basketBallModel.home floatValue])];
    self.titleLab.text = basketBallModel.desc;
    self.leftRateLab.text  = @"";
    self.rightRateLab.text  = @"";
    float total = [basketBallModel.home floatValue]+[basketBallModel.away floatValue];
    if (total>0) {
//        self.leftRateLab.text = [NSString stringWithFormat:@"%.0f%%",[basketBallModel.away floatValue]/total*100];
//        self.rightRateLab.text = [NSString stringWithFormat:@"%.0f%%",[basketBallModel.home floatValue]/total*100];
        float homeRate = [basketBallModel.away floatValue]/total;
        [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:homeRate];
        [self setupLineView:self.progressView colors:COLOR_002868 startPoint:homeRate endPoint:1];
    }else{
        [self setupLineView:self.progressView colors:JCBaseColor startPoint:0 endPoint:0.5];
        [self setupLineView:self.progressView colors:COLOR_002868 startPoint:0.5 endPoint:1];
//        self.leftRateLab.text  = @"50%";
//        self.rightRateLab.text  = @"50%";
    }
}



-(void)setupLineView:(UIView *)lineView colors:(UIColor *)color startPoint:(float)start endPoint:(float)end{
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0, lineView.bounds.size.height/2)];
    [linePath addLineToPoint:CGPointMake(lineView.bounds.size.width, lineView.bounds.size.height/2)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //每次动画的持续时间
    animation.duration = 0.25;
    //动画起始位置
    animation.fromValue = @(0);
    //动画结束位置
    animation.toValue = @(1);
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = linePath.CGPath;
    shapeLayer.lineWidth = lineView.bounds.size.height;
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = color.CGColor;
    //strokeStart defaults to zero and strokeEnd to one.
    shapeLayer.strokeStart = start;
    //分成了多少段，每次加多少分之一
    shapeLayer.strokeEnd = end;
    //添加动画
//    [shapeLayer addAnimation:animation forKey:@"strokeEndAnimation"];
    [lineView.layer addSublayer:shapeLayer];
    

}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIView *)progressView {
    if (!_progressView) {
        _progressView = [UIView new];
    }
    return _progressView;
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

- (UILabel *)leftRateLab {
    if (!_leftRateLab) {
        _leftRateLab = [UILabel initWithTitle:@"" andFont:AUTO(9) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _leftRateLab;
}

- (UILabel *)rightRateLab {
    if (!_rightRateLab) {
        _rightRateLab = [UILabel initWithTitle:@"" andFont:AUTO(9) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];

    }
    return _rightRateLab;
}



@end
