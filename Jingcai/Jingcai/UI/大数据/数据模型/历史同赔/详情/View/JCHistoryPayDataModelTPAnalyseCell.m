//
//  JCHistoryPayDataModelTPAnalyseCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelTPAnalyseCell.h"

@implementation JCHistoryPayDataModelTPAnalyseCell

- (void)initViews {
    [self.contentView addSubview:self.zhishuLab];
    [self.zhishuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(10);
        make.right.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.progressView];
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.equalTo(self.zhishuLab.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-16));
        make.height.mas_equalTo(AUTO(12));
    }];
    
    [self.contentView addSubview:self.winView];
    [self.winView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressView.mas_bottom).offset(AUTO(8));
        make.left.offset(AUTO(15));
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_equalTo(AUTO(30));
//        make.bottom.offset(AUTO(-20));
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
    
    [self.contentView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.winView.mas_bottom).offset(AUTO(20));
        make.bottom.offset(AUTO(-20));
    }];
    
    [self.bottomView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(AUTO(4));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    

    
    [self.bottomView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.equalTo(self.historyLab.mas_bottom).offset(AUTO(8));

    }];
    
    [self.bottomView addSubview:self.tipLab];
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(8));
        make.bottom.offset(AUTO(-12));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    
}

- (void)setModel:(JCKellyDataDetailModel *)model {
    if (!model) {
        return;
    }
    _model = model;
    [self layoutIfNeeded];
    self.zhishuLab.text = [NSString stringWithFormat:@"相同初指  (%@  %@  %@)",NonNil(model.similar.begin_odds.won),NonNil(model.similar.begin_odds.draw),NonNil(model.similar.begin_odds.loss)];
    self.winLab.text = [NSString stringWithFormat:@"主胜：%@%%(%@场)",model.similar.begin_rate.won,model.similar.begin_count.won];
    self.equalLab.text = [NSString stringWithFormat:@"平：%@%%(%@场)",model.similar.begin_rate.draw,model.similar.begin_count.draw];
    self.loseLab.text = [NSString stringWithFormat:@"客胜：%@%%(%@场)",model.similar.begin_rate.loss,model.similar.begin_count.loss];

    if ([model.similar.begin_rate.won integerValue]==0&&[model.similar.begin_rate.draw integerValue]==0&&[model.similar.begin_rate.loss integerValue]==0) {
        [self setupLineView:self.progressView colors:UIColorFromRGB(0x0EEEEEE) startPoint:0 endPoint:1];
    }else{
        float homeRate = [model.similar.begin_rate.won integerValue]/100.0f;
        float equalRate = [model.similar.begin_rate.won integerValue]/100.0f+[model.similar.begin_rate.draw integerValue]/100.0f;
//        float lossRate =[model.similar.begin_rate.loss integerValue]/100.0f;
        [self setupLineView:self.progressView colors:COLOR_EF2F2F startPoint:0 endPoint:homeRate];
        [self setupLineView:self.progressView colors:COLOR_30B27A startPoint:homeRate endPoint:equalRate];
        [self setupLineView:self.progressView colors:COLOR_002868 startPoint:equalRate endPoint:1];
        
    }
    NSString *title = [NSString stringWithFormat:@"查询历史数据，找到相同初指比赛%@场，%@%%比赛结果指向客胜；",NonNil(model.similar.begin_count.total),NonNil(model.similar.begin_big_rate.rate)];
    if ([model.similar.last_count.total integerValue]>0) {
        title = [NSString stringWithFormat:@"%@相同即指比赛%@场，%@%%比赛指向客胜。",title,NonNil(model.similar.last_count.total),NonNil(model.similar.last_big_rate.rate)];
    }
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
    if (model.similar.begin_count.total.length>0) {
        NSRange range = [title rangeOfString:model.similar.begin_count.total];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }
    if (model.similar.begin_big_rate.rate.length>0) {
        NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%@%%",model.similar.begin_big_rate.rate]];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }
    if (model.similar.last_count.total.length>0) {
        NSRange range = [title rangeOfString:model.similar.last_count.total];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }
    if (model.similar.last_big_rate.rate.length>0) {
        NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%@%%",model.similar.last_big_rate.rate]];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
    }
    self.historyLab.attributedText = attr;
    
        NSString *result = [NSString stringWithFormat:@"本场推荐：%@",NonNil(model.similar.begin_big_rate.spf_desc)];
    if (model.similar.begin_big_rate.spf_desc.length>0) {
            NSRange range = [result rangeOfString:model.similar.begin_big_rate.spf_desc];
        NSMutableAttributedString *result_attr = [[NSMutableAttributedString alloc] initWithString:result];
        [result_attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
        self.resultLab.attributedText = result_attr;
    }else{
        self.resultLab.text = @"";
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

- (UILabel *)zhishuLab {
    if (!_zhishuLab) {
        _zhishuLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _zhishuLab;
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

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = UIColorFromRGB(0xF5F5F5);
        [_bottomView hg_setAllCornerWithCornerRadius:4];
    }
    return _bottomView;
}

- (UILabel *)historyLab {
    if (!_historyLab) {
        _historyLab =[UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
        _historyLab.numberOfLines = 0;
    }
    return _historyLab;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab =[UILabel initWithTitle:@"" andFont:AUTO(12  ) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resultLab;
}

- (UILabel *)tipLab {
    if (!_tipLab) {
        _tipLab = [UILabel initWithTitle:@"数据模型运算结果仅供参考" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _tipLab;
}

@end
