//
//  JCHistoryPayDataModelJFAnalyseCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelJFAnalyseCell.h"

@implementation JCHistoryPayDataModelJFAnalyseCell

- (void)initViews {
    [self.contentView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.right.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.equalTo(self.teamLab.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-16));
        make.height.mas_equalTo(AUTO(12));
    }];
    
    [self.contentView addSubview:self.winView];
    [self.winView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressView.mas_bottom).offset(AUTO(8));
        make.left.offset(AUTO(15));
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_equalTo(AUTO(30));
        make.bottom.offset(AUTO(-10));
    }];
    UIView *windian = [UIView new];
    windian.backgroundColor = COLOR_EF2F2F;
    [windian hg_setAllCornerWithCornerRadius:AUTO(3)];
    [self.winView addSubview:windian];
    [windian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.winView);
        make.width.height.mas_equalTo(AUTO(6));
    }];
    
    [self.winView addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(windian.mas_right).offset(2);
        make.centerY.equalTo(self.winView);
        make.right.offset(0);
    }];
    
    [self.contentView addSubview:self.equalView];
    [self.equalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_equalTo(AUTO(30));
        make.centerX.equalTo(self.contentView);
    }];

    
    [self.equalView addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(equaldian.mas_right).offset(2);
        make.centerY.equalTo(self.equalView);
        make.centerX.equalTo(self.equalView);
    }];
    
    UIView *equaldian = [UIView new];
    equaldian.backgroundColor = COLOR_30B27A;
    [equaldian hg_setAllCornerWithCornerRadius:AUTO(3)];
    [self.equalView addSubview:equaldian];
    [equaldian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.equalLab.mas_left).offset(AUTO(-2));
        make.centerY.equalTo(self.winView);
        make.width.height.mas_equalTo(AUTO(6));
    }];
    
    [self.contentView addSubview:self.loseView];
    [self.loseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_equalTo(AUTO(30));
        make.right.offset(AUTO(-16));
    }];
    
    [self.loseView addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.loseView);
        make.right.offset(0);
    }];

    UIView *losedian = [UIView new];
    losedian.backgroundColor = COLOR_002868;
    [losedian hg_setAllCornerWithCornerRadius:AUTO(3)];
    [self.loseView addSubview:losedian];
    [losedian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.loseLab.mas_left).offset(AUTO(-2));
        make.centerY.equalTo(self.loseView);
        make.width.height.mas_equalTo(AUTO(6));
    }];
    

    
}

- (void)setModel:(JCKellyDataDetailModel *)model {
    if (!model) {
        return;
    }
    _model = model;
    [self layoutIfNeeded];
    NSInteger home_Rate = model.history_vs.won_rate;
    NSInteger home_Count = model.history_vs.won;
    NSInteger away_Rate = model.history_vs.loss_rate;
    NSInteger away_Count = model.history_vs.loss;
    if (self.row==1) {
        away_Rate = model.history_vs.won_rate;
        away_Count = model.history_vs.won;
        home_Rate = model.history_vs.loss_rate;
        home_Count = model.history_vs.loss;
    }
    
    self.teamLab.text = self.row==0?model.home_team.name_zh:model.away_team.name_zh;
    self.winLab.text = [NSString stringWithFormat:@"主胜：%ld%%(%ld场)",home_Rate,home_Count];
    self.equalLab.text = [NSString stringWithFormat:@"平：%ld%%(%ld场)",model.history_vs.draw_rate,model.history_vs.draw];
    self.loseLab.text = [NSString stringWithFormat:@"客胜：%ld%%(%ld场)",away_Rate,away_Count];

    if (model.history_vs.won_rate==0&&model.history_vs.draw_rate==0&&model.history_vs.loss_rate==0) {
        [self setupLineView:self.progressView colors:UIColorFromRGB(0x0EEEEEE) startPoint:0 endPoint:1];
    }else{
        float homeRate = home_Rate/100.0f;
        float equalRate = home_Rate/100.0f+model.history_vs.draw_rate/100.0f;

        [self setupLineView:self.progressView colors:COLOR_EF2F2F startPoint:0 endPoint:homeRate];
        [self setupLineView:self.progressView colors:COLOR_30B27A startPoint:homeRate endPoint:equalRate];
        [self setupLineView:self.progressView colors:COLOR_002868 startPoint:equalRate endPoint:1];
        
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

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _teamLab;
}

- (UILabel *)winLab {
    if (!_winLab) {
        _winLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _winLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _equalLab;
}

- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _loseLab;
}

- (UIView *)winView {
    if (!_winView) {
        _winView = [UIView new];
    }
    return _winView;
}

- (UIView *)equalView {
    if (!_equalView) {
        _equalView = [UIView new];
    }
    return _equalView;
}

- (UIView *)loseView {
    if (!_loseView) {
        _loseView = [UIView new];
    }
    return _loseView;
}

- (UIView *)progressView {
    if (!_progressView) {
        _progressView = [UIView new];
        _progressView.backgroundColor = UIColorFromRGB(0xEEEEEE);
        _progressView.layer.cornerRadius = AUTO(6);
        _progressView.layer.masksToBounds = YES;
    }
    return _progressView;
}


@end
