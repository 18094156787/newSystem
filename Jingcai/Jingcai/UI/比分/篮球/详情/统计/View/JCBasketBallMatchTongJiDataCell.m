//
//  JCBasketBallMatchTongJiDataCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchTongJiDataCell.h"

@implementation JCBasketBallMatchTongJiDataCell

- (void)initViews {
    [self.contentView addSubview:self.progressView];
    self.progressView.layer.cornerRadius = AUTO(6);
    self.progressView.layer.masksToBounds = YES;
    self.progressView.frame = CGRectMake(AUTO(44), AUTO(25), SCREEN_WIDTH-AUTO(88), AUTO(12));
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(5));
        make.centerX.equalTo(self.progressView);
//        make.height.mas_equalTo(AUTO(15));
    }];
    NSLog(@"%.0f",self.contentView.width);
    
    [self.contentView addSubview:self.leftLab];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressView);
        make.right.equalTo(self.progressView.mas_left).offset(AUTO(-10));
    }];
    
    [self.contentView addSubview:self.rightLab];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.progressView);
        make.left.equalTo(self.progressView.mas_right).offset(AUTO(10));
    }];
    

}

- (void)setModel:(JCBasketBallMatchTongJiDataModel *)model {
    _model = model;
    [self layoutIfNeeded];
    self.titleLab.text = model.desc;
        self.leftLab.text = model.away;
        self.rightLab.text = model.home;
        float total = [model.home floatValue]+[model.away floatValue];
    //
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
    [shapeLayer addAnimation:animation forKey:@"strokeEndAnimation"];
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
