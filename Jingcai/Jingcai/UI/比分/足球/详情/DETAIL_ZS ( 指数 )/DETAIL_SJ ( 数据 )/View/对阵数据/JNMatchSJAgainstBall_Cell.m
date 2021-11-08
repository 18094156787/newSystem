//
//  JNMatchSJAgainstBall_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstBall_Cell.h"

@implementation JNMatchSJAgainstBall_Cell

- (void)initViews {
    
    [self addSubview:self.titleInfoLab];
    [self.titleInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(28));
    }];
    
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleInfoLab.mas_bottom).offset(AUTO(8));
        make.left.offset(AUTO(16));
        make.height.mas_equalTo(AUTO(20));
    }];

    
    
    [self addSubview:self.homeProgressView];
    self.homeProgressView.layer.cornerRadius = AUTO(4);
    self.homeProgressView.layer.masksToBounds = YES;
//    [self.homeProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(8));
//        make.top.offset(AUTO(66));
//        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-AUTO(16), AUTO(20)));
//    }];
    self.homeProgressView.frame = CGRectMake(AUTO(8), AUTO(30), SCREEN_WIDTH-AUTO(16), AUTO(24));
    
    [self addSubview:self.homeRateLab];
    [self.homeRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeProgressView).offset(AUTO(5));
        make.centerY.equalTo(self.homeProgressView);
    }];
    
    [self addSubview:self.awayRateLab];
    [self.awayRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeProgressView).offset(-AUTO(5));
        make.centerY.equalTo(self.homeProgressView);
    }];


    
    [self addSubview:self.awayInfoLab];
    [self.awayInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.offset(AUTO(-15));
        make.width.mas_lessThanOrEqualTo(AUTO(80));
    }];
    
    [self addSubview:self.awayView];
    [self.awayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayInfoLab.mas_left).offset(-4);
        make.centerY.equalTo(self.awayInfoLab);
        make.width.height.mas_equalTo(AUTO(8));
    }];
    
    [self addSubview:self.homeInfoLab];
    [self.homeInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayView.mas_left).offset(-AUTO(10));
        make.centerY.equalTo(self.titleLab);
        make.width.mas_lessThanOrEqualTo(AUTO(80));
    }];
    
    [self addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeInfoLab.mas_left).offset(-4);
        make.centerY.equalTo(self.homeInfoLab);
        make.width.height.mas_equalTo(AUTO(8));
    }];

}

- (void)setModel:(JCBigDataMonthProduceModel *)model {
    _model = model;
    if (self.is_rq) {
        self.titleInfoLab.text = @"";
        self.homeProgressView.frame = CGRectMake(AUTO(16), AUTO(30), SCREEN_WIDTH-AUTO(32), AUTO(24));
        
        [self.titleInfoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        
        self.titleLab.text = [NSString stringWithFormat:@"让球(%@)",model.rq];
        self.homeInfoLab.text = @"主胜";
        self.awayInfoLab.text = @"客胜";
        [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:[model.ai_yp_win floatValue]];
        [self setupLineView:self.homeProgressView colors:COLOR_002868 startPoint:[model.ai_yp_win floatValue] endPoint:1];
        self.homeRateLab.text = [NSString stringWithFormat:@"%.0f%%",[model.ai_yp_win floatValue]*100];
        self.awayRateLab.text = [NSString stringWithFormat:@"%.0f%%",[model.ai_yp_lose floatValue]*100];
        if ([model.ai_yp_win floatValue]==0&&[model.ai_yp_lose floatValue]==0) {
            [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:0.5];
            [self setupLineView:self.homeProgressView colors:COLOR_002868 startPoint:0.5 endPoint:1];
        }
        



    }else{
        self.titleInfoLab.text = @"  进球&让球概率分布";
        
        self.homeProgressView.frame = CGRectMake(AUTO(16), AUTO(68), SCREEN_WIDTH-AUTO(32), AUTO(24));
        
        [self.titleInfoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(28));
        }];
        
        
        self.titleLab.text = [NSString stringWithFormat:@"进球数(%@)",model.jqs];
        self.homeInfoLab.text = @"大球";
        self.awayInfoLab.text = @"小球";
        [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:[model.ai_dx_win floatValue]];
        [self setupLineView:self.homeProgressView colors:COLOR_002868 startPoint:[model.ai_dx_win floatValue] endPoint:1];
        self.homeRateLab.text = [NSString stringWithFormat:@"%.0f%%",[model.ai_dx_win floatValue]*100];
        self.awayRateLab.text = [NSString stringWithFormat:@"%.0f%%",[model.ai_dx_lose floatValue]*100];
        if ([model.ai_dx_win floatValue]==0&&[model.ai_dx_lose floatValue]==0) {
            [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:0.5];
            [self setupLineView:self.homeProgressView colors:COLOR_002868 startPoint:0.5 endPoint:1];
        }
        

        
    }
    
}


- (void)setAway_analysisModel:(JCBigDataAnalysisModel *)away_analysisModel {
    _away_analysisModel = away_analysisModel;
   
    if (self.is_win) {

        
        self.titleInfoLab.text = @"  近10场均入球&失球数";
        
        self.homeProgressView.frame = CGRectMake(AUTO(16), AUTO(68), SCREEN_WIDTH-AUTO(32), AUTO(24));
        
        [self.titleInfoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(28));
        }];
        
         float total = [self.home_analysisModel.win_score floatValue]+[self.away_analysisModel.win_score floatValue];
        float home_rate = [self.home_analysisModel.win_score floatValue]/total;
        [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:home_rate];
        [self setupLineView:self.homeProgressView colors:COLOR_002868 startPoint:home_rate endPoint:1];
        
        self.homeRateLab.text = [NSString stringWithFormat:@"%.0f%%",home_rate*100];
        float away_rate = [self.away_analysisModel.win_score floatValue]/total;
        self.awayRateLab.text = [NSString stringWithFormat:@"%.0f%%",away_rate*100];
        if ([self.home_analysisModel.win_score intValue]==0&&[self.away_analysisModel.win_score floatValue]==0) {
            [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:home_rate];
            [self setupLineView:self.homeProgressView colors:COLOR_002868 startPoint:home_rate endPoint:1];
        }
    }else{
        self.titleInfoLab.text = @"";
        self.homeProgressView.frame = CGRectMake(AUTO(16), AUTO(30), SCREEN_WIDTH-AUTO(32), AUTO(24));
        
        [self.titleInfoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        

        
        
         float total = [self.home_analysisModel.lose_score floatValue]+[self.away_analysisModel.lose_score floatValue];
        float home_rate = [self.home_analysisModel.lose_score floatValue]/total;
        [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:home_rate];
        [self setupLineView:self.homeProgressView colors:COLOR_002868 startPoint:home_rate endPoint:1];
        self.homeRateLab.text = [NSString stringWithFormat:@"%.0f%%",home_rate*100];
        float away_rate = [self.away_analysisModel.lose_score floatValue]/total;
        self.awayRateLab.text = [NSString stringWithFormat:@"%.0f%%",away_rate*100];
        if ([self.home_analysisModel.lose_score intValue]==0&&[self.away_analysisModel.lose_score floatValue]==0) {
            [self setupLineView:self.homeProgressView colors:JCBaseColor startPoint:0 endPoint:home_rate];
            [self setupLineView:self.homeProgressView colors:COLOR_002868 startPoint:home_rate endPoint:1];
        }
    }
}

-(void)setupLineView:(UIView *)lineView colors:(UIColor *)color startPoint:(float)start endPoint:(float)end{
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0, lineView.bounds.size.height/2)];
    [linePath addLineToPoint:CGPointMake(lineView.bounds.size.width, lineView.bounds.size.height/2)];
//    [linePath moveToPoint:CGPointMake(start*lineView.bounds.size.width, lineView.bounds.size.height/2)];
//    [linePath addLineToPoint:CGPointMake(lineView.bounds.size.width*end, lineView.bounds.size.height/2)];
    
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
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIView *)homeProgressView {
    if (!_homeProgressView) {
        _homeProgressView = [UIView new];
    }
    return _homeProgressView;
}

- (UILabel *)homeRateLab {
    if (!_homeRateLab) {
        _homeRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeRateLab;
}

- (UILabel *)awayRateLab {
    if (!_awayRateLab) {
        _awayRateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayRateLab;
}

- (UILabel *)homeInfoLab {
    if (!_homeInfoLab) {
        _homeInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeInfoLab;
}

- (UILabel *)awayInfoLab {
    if (!_awayInfoLab) {
        _awayInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _awayInfoLab;
}



- (UIView *)homeView {
    if (!_homeView) {
        _homeView = [UIView new];
        _homeView.backgroundColor = JCBaseColor;
        [_homeView hg_setAllCornerWithCornerRadius:4];
    }
    return _homeView;
}

- (UIView *)awayView {
    if (!_awayView) {
        _awayView = [UIView new];
        _awayView.backgroundColor = COLOR_002868;
        [_awayView hg_setAllCornerWithCornerRadius:4];
    }
    return _awayView;
}
- (UIImageView *)leftLineImgView {
    if (!_leftLineImgView) {
        _leftLineImgView = [UIImageView new];
        _leftLineImgView.image = JCIMAGE(@"match_dec_left");
    }
    return _leftLineImgView;
}
- (UIImageView *)rightLineImgView {
    if (!_rightLineImgView) {
        _rightLineImgView = [UIImageView new];
        _rightLineImgView.image = JCIMAGE(@"match_dec_right");
    }
    return _rightLineImgView;
}
- (UILabel *)titleInfoLab {
    if (!_titleInfoLab) {
        _titleInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:[COLOR_002868 colorWithAlphaComponent:0.06] andTextAlignment:0];
    }
    return _titleInfoLab;
}
@end
