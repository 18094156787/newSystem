//
//  JCHistoryPayDataModelOpenCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelOpenCell.h"

@implementation JCHistoryPayDataModelOpenCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(AUTO(8));
        make.bottom.offset(0);
//        make.bottom.offset(AUTO(-20));
//        make.height.mas_equalTo(100);
    }];
    
    [self.contentView addSubview:self.matchNameLab];
    [self.matchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.top.offset(AUTO(20));
        make.height.mas_equalTo(AUTO(17));
    }];
    
    [self.contentView addSubview:self.matchTimeLab];
    [self.matchTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchNameLab);
        make.left.equalTo(self.matchNameLab.mas_right).offset(AUTO(12));
        make.centerY.equalTo(self.matchNameLab);
//        make.bottom.offset(AUTO(-20));
        
    }];
    
    [self.contentView addSubview:self.matchStatusLab];
    [self.matchStatusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchNameLab);
        make.left.equalTo(self.matchTimeLab.mas_right).offset(AUTO(12));
        make.centerY.equalTo(self.matchNameLab);
       
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorFromRGB(0xE8E8E8);
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.matchNameLab.mas_bottom).offset(AUTO(12));
        make.height.mas_equalTo(1);
    }];
    
    [self.contentView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.bottom.equalTo(lineView).offset(AUTO(7));
        make.width.height.mas_equalTo(AUTO(36));
    }];
    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(18));
        make.height.mas_equalTo(AUTO(25));
        make.width.mas_equalTo(AUTO(60));
        
    }];
    
    [self.contentView addSubview:self.homeTeamImgView];
    [self.homeTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.matchNameLab);
        make.centerY.equalTo(self.scoreLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.homeTeamLab];
    [self.homeTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeTeamImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.scoreLab.mas_left);
    }];
    
    [self.contentView addSubview:self.awayTeamImgView];
    [self.awayTeamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.centerY.equalTo(self.scoreLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.awayTeamLab];
    [self.awayTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayTeamImgView.mas_left).offset(AUTO(-8));
        make.centerY.equalTo(self.scoreLab);
        make.left.equalTo(self.scoreLab.mas_right);
    }];
    self.progressView.frame = CGRectMake(AUTO(24), AUTO(115), SCREEN_WIDTH-AUTO(48), AUTO(12));

    
    [self.contentView addSubview:self.progressView];
//    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(24));
//        make.top.equalTo(self.homeTeamImgView.mas_bottom).offset(AUTO(16));
//        make.right.offset(AUTO(-24));
//        make.height.mas_equalTo(AUTO(12));
//    }];
//
    [self.contentView addSubview:self.winView];
    [self.winView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.progressView.mas_bottom).offset(AUTO(8));
        make.left.offset(AUTO(24));
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
        make.right.offset(AUTO(-24));
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

    
    [self.contentView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.winView.mas_bottom).offset(AUTO(12));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    

    
    [self.contentView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.historyLab.mas_bottom).offset(AUTO(8));

    }];
    
    [self.contentView addSubview:self.tipLab];
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(8));
        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.historyLab).offset(AUTO(-4));
        make.bottom.equalTo(self.tipLab).offset(AUTO(4));
    }];
}

- (void)setModel:(JCKellyDataModelModel *)model {
    _model = model;
   
    self.matchNameLab.text = model.short_name_zh;
    self.matchNameLab.textColor = model.competition_color.length>0?[UIColor colorWithHexString:NonNil(model.competition_color)]:UIColorFromRGB(0x606062);
    self.matchTimeLab.text = model.match_time_str;
    self.matchStatusLab.text = model.status_cn;
    self.homeTeamLab.text = model.home_team_name;
    self.awayTeamLab.text =  model.away_team_name;

    
    [self.homeTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayTeamImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.resultImgView.hidden = model.wl==0?YES:NO;
    if (model.wl==1) {
        self.resultImgView.image = JCIMAGE(@"ic_dataModel_red");
    }
    if (model.wl==2) {
        self.resultImgView.image = JCIMAGE(@"ic_dataModel_black");
    }
    self.winLab.text = [NSString stringWithFormat:@"主胜：%@%%(%@场)",model.similar.begin_rate.won,model.similar.begin_count.won];
    self.equalLab.text = [NSString stringWithFormat:@"平：%@%%(%@场)",model.similar.begin_rate.draw,model.similar.begin_count.draw];
    self.loseLab.text = [NSString stringWithFormat:@"客胜：%@%%(%@场)",model.similar.begin_rate.loss,model.similar.begin_count.loss];

    if ([model.similar.begin_rate.won integerValue]==0&&[model.similar.begin_rate.draw integerValue]==0&&[model.similar.begin_rate.loss integerValue]==0) {
        [self setupLineView:self.progressView colors:UIColorFromRGB(0x0EEEEEE) startPoint:0 endPoint:1];
    }else{
        float homeRate = [model.similar.begin_rate.won integerValue]/100.0f;
        float equalRate = [model.similar.begin_rate.won integerValue]/100.0f+[model.similar.begin_rate.draw integerValue]/100.0f;
//        float lossRate =[model.similar.begin_rate.loss integerValue]/100.0f;
//        [self layoutIfNeeded];
        [self setupLineView:self.progressView colors:COLOR_EF2F2F startPoint:0 endPoint:homeRate];
        [self setupLineView:self.progressView colors:COLOR_30B27A startPoint:homeRate endPoint:equalRate];
        [self setupLineView:self.progressView colors:COLOR_002868 startPoint:equalRate endPoint:1];
//        NSLog(@"是%@",NSStringFromCGRect(self.progressView.frame));
        
    }
    
    

    
    NSString *title = [NSString stringWithFormat:@"查询历史数据，找到相同初指比赛%@场，%@%%比赛结果指向客胜；",NonNil(model.similar.begin_count.total),NonNil(model.similar.begin_big_rate.rate)];
//    if ([model.similar.last_count.total integerValue]>0) {
//        title = [NSString stringWithFormat:@"%@相同即指比赛%@场，%@%%比赛指向客胜。",title,NonNil(model.similar.last_count.total),NonNil(model.similar.last_big_rate.rate)];
//    }
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
    if ([model.similar.last_count.total integerValue]>0) {
       NSString * last_title = [NSString stringWithFormat:@"相同即指比赛%@场，%@%%比赛指向客胜。",NonNil(model.similar.last_count.total),NonNil(model.similar.last_big_rate.rate)];
        NSMutableAttributedString *last_attr = [[NSMutableAttributedString alloc] initWithString:last_title];
        NSRange range = [last_title rangeOfString:model.similar.last_count.total];
        if (range.location!=NSNotFound) {
            [last_attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        }
        
        if (model.similar.last_big_rate.rate.length>0) {
            NSRange range = [last_title rangeOfString:[NSString stringWithFormat:@"%@%%",model.similar.last_big_rate.rate]];
            if (range.location!=NSNotFound) {
                [last_attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
            }
        }
        [attr appendAttributedString:last_attr];
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

    //半场比分,角球
    if (model.status_id>1&&model.status_id<9) {
        self.scoreLab.text = [NSString stringWithFormat:@"%ld : %ld",model.home_score,model.away_score];
    }else{
        self.scoreLab.text = @"VS";
    }
    //进行中的比赛显示分钟数
     if (model.status_id>1&&model.status_id<8) {
        self.matchStatusLab.textColor = COLOR_30B27A;
        self.scoreLab.textColor = COLOR_30B27A;

        if (model.status_id==2||model.status_id==4) {
//            self.ongoingTimeLab.text = model.status_cn;
            if (model.second_half_time>0) {
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-model.second_half_time;

                self.matchStatusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60+45];
    //            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
            }else{
                //计算时间差
                double currentTime = [[NSDate date] timeIntervalSince1970];
                double distance = currentTime-model.first_half_time;
                if (distance<0) {
                    distance = 0;
                }
                self.matchStatusLab.text = [NSString stringWithFormat:@"%.0f'",distance/60];
            }
        }else{
            self.matchStatusLab.text = model.status_cn;
        }
    }else if(model.status_id==8){
        self.matchStatusLab.text = model.status_cn;
        self.matchStatusLab.textColor = JCBaseColor;
        self.scoreLab.textColor = JCBaseColor;
    }else{
        self.matchStatusLab.text = model.status_cn;
        self.matchStatusLab.textColor = COLOR_9F9F9F;
        self.scoreLab.textColor = COLOR_9F9F9F;
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

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:8];
    }
    return _bgView;
}

- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchNameLab;
}

- (UILabel *)matchTimeLab {
    if (!_matchTimeLab) {
        _matchTimeLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchTimeLab;
}

- (UILabel *)matchStatusLab {
    if (!_matchStatusLab) {
        _matchStatusLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchStatusLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab =[UILabel initWithTitle:@"" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];

    }
    return _scoreLab;
}

- (UILabel *)homeTeamLab {
    if (!_homeTeamLab) {
        _homeTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeTeamLab;
}

- (UILabel *)awayTeamLab {
    if (!_awayTeamLab) {
        _awayTeamLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _awayTeamLab;
}

- (UIImageView *)homeTeamImgView {
    if (!_homeTeamImgView) {
        _homeTeamImgView = [UIImageView new];
        [_homeTeamImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeTeamImgView;
}

- (UIImageView *)awayTeamImgView {
    if (!_awayTeamImgView) {
        _awayTeamImgView = [UIImageView new];
        [_awayTeamImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _awayTeamImgView;
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

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
    }
    return _resultImgView;
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

@end
