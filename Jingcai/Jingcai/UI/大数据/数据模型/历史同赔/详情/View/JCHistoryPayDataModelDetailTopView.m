//
//  JCHistoryPayDataModelDetailTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelDetailTopView.h"

@implementation JCHistoryPayDataModelDetailTopView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    self.bgView = [[UIImageView alloc] init];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.image = JCIMAGE(@"ic_dataModel_nav_img_black");
//    self.bgView.backgroundColor = JCWhiteColor;
//    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    self.bgView.frame = CGRectMake(0,0,SCREEN_WIDTH,AUTO(172)+kNavigationBarHeight);
    [self addSubview:self.bgView];
    

    
    UIButton *backBtn = [UIButton new];
    [self.bgView addSubview:backBtn];
    [backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:0];
    [backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:UIControlStateHighlighted];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(StatusBar_HEIGHT);
        make.width.height.mas_equalTo(44);
    }];
    
    
    UILabel *titleLab = [UILabel initWithTitle:@"同赔分析" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.centerY.equalTo(backBtn);
    }];

    [self addSubview:self.matchView];
    [self.matchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(16)+kNavigationBarHeight);
        make.left.offset(AUTO(16));
        make.right.offset(AUTO(-16));
        make.height.mas_equalTo(AUTO(216));
    }];
    self.matchView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.matchView.layer.cornerRadius = 8;
    self.matchView.layer.shadowColor = [UIColor colorWithRed:78/255.0 green:83/255.0 blue:99/255.0 alpha:0.16].CGColor;
    self.matchView.layer.shadowOffset = CGSizeMake(0,8);
    self.matchView.layer.shadowOpacity = 1;
    self.matchView.layer.shadowRadius = 16;
    
    [self addSubview:self.tpBgView];
    [self.tpBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.matchView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(350));
    }];
    
    UIView *redLineView = [UIView new];
    redLineView.backgroundColor = JCBaseColor;
    [self.tpBgView addSubview:redLineView];
    self.redLineView =redLineView;
    [redLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.offset(AUTO(35));
        make.size.mas_equalTo(CGSizeMake(AUTO(4), AUTO(16)));
    }];
    
    UILabel *tp_lab = [UILabel initWithTitle:@"同赔数据统计" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.tpBgView addSubview:tp_lab];
    [tp_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redLineView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(redLineView);
    }];
    
    [self.tpBgView addSubview:self.chuLab];
    [self.chuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(tp_lab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
        make.right.equalTo(self.tpBgView.mas_centerX);
    }];
    
    [self.tpBgView addSubview:self.jiLab];
    [self.jiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.equalTo(self.chuLab);
        make.height.mas_equalTo(AUTO(20));
        make.left.equalTo(self.tpBgView.mas_centerX);
    }];
    
    [self.tpBgView addSubview:self.homeWinView];
    [self.homeWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.top.equalTo(self.chuLab.mas_bottom).offset(AUTO(8));
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(140));
    }];
    
    [self.tpBgView addSubview:self.homeEqualView];
    [self.homeEqualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeWinView.mas_right);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(140));
    }];
    
    [self.tpBgView addSubview:self.homeLoseView];
    [self.homeLoseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeEqualView.mas_right);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(140));
    }];
    
    [self.tpBgView addSubview:self.awayLoseView];
    [self.awayLoseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(140));
    }];
    
    [self.tpBgView addSubview:self.awayEqualView];
    [self.awayEqualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayLoseView.mas_left);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(140));
    }];
    
    [self.tpBgView addSubview:self.awayWinView];
    [self.awayWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayEqualView.mas_left);
        make.top.equalTo(self.homeWinView);
        make.width.mas_equalTo(AUTO(52));
        make.height.mas_equalTo(AUTO(140));
    }];
    
    [self.tpBgView addSubview:self.bottomView];

    
    [self.tpBgView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.homeWinView.mas_bottom).offset(AUTO(12));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    

    
    [self.tpBgView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.historyLab.mas_bottom).offset(AUTO(8));

    }];
    
    [self.tpBgView addSubview:self.tipLab];
    [self.tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(32));
        make.right.offset(AUTO(-32));
        make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(8));
//        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(24));
        make.right.offset(AUTO(-24));
        make.top.equalTo(self.historyLab).offset(AUTO(-4));
        make.bottom.equalTo(self.tipLab).offset(AUTO(4));
    }];
    
    UIView *grayView = [UIView new];
    grayView.backgroundColor = UIColorFromRGB(0xF5F5F5);
    [self addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tpBgView.mas_bottom);
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(8));
    }];
    
    [self addSubview:self.historyBgView];
    [self.historyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(grayView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(40));
    }];
    
    UIView *redLineView1 = [UIView new];
    redLineView1.backgroundColor = JCBaseColor;
    [self.historyBgView addSubview:redLineView1];
    [redLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.offset(AUTO(16));
        make.size.mas_equalTo(CGSizeMake(AUTO(4), AUTO(16)));
    }];
    
    UILabel *tp_history_lab = [UILabel initWithTitle:@"历史同赔样本数据" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.historyBgView addSubview:tp_history_lab];
    [tp_history_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redLineView1.mas_right).offset(AUTO(8));
        make.centerY.equalTo(redLineView1);
    }];
    
   
    WeakSelf;
    [backBtn bk_whenTapped:^{
        [[weakSelf getViewController].navigationController popViewControllerAnimated:YES];
    }];

}

- (void)setMatch_id:(NSString *)match_id {
    _match_id = match_id;
    self.matchView.match_id = match_id;
}

- (void)setModel_id:(NSString *)model_id {
    _model_id = model_id;
    self.matchView.model_id = model_id;
}

- (void)setModel:(JCKellyDataDetailModel *)model {
    _model = model;
    self.matchView.model = model;
    self.chuLab.text = [NSString stringWithFormat:@"相同初指（%@）",model.similar.begin_count.total];
    self.jiLab.text = [NSString stringWithFormat:@"相同即指（%@）",model.similar.last_count.total];

    self.homeWinView.topLab.text = [NSString stringWithFormat:@"%@%%",model.similar.begin_rate.won];
    self.homeWinView.bottomLab.text = [NSString stringWithFormat:@"%@",model.similar.begin_odds.won];
    self.homeWinView.countLab.text = [NSString stringWithFormat:@"(%@场)",NonNil(model.similar.begin_count.won)];
    self.homeEqualView.topLab.text = [NSString stringWithFormat:@"%@%%",model.similar.begin_rate.draw];
    self.homeEqualView.bottomLab.text = [NSString stringWithFormat:@"%@",model.similar.begin_odds.draw];
    self.homeEqualView.countLab.text = [NSString stringWithFormat:@"(%@场)",NonNil(model.similar.begin_count.draw)];
    self.homeLoseView.topLab.text = [NSString stringWithFormat:@"%@%%",model.similar.begin_rate.loss];
    self.homeLoseView.bottomLab.text = [NSString stringWithFormat:@"%@",model.similar.begin_odds.draw];
    self.homeLoseView.countLab.text = [NSString stringWithFormat:@"(%@场)",NonNil(model.similar.begin_count.loss)];
    
    self.awayWinView.topLab.text = [NSString stringWithFormat:@"%@%%",model.similar.last_rate.won];
    self.awayWinView.bottomLab.text = [NSString stringWithFormat:@"%@",model.similar.last_odds.won];
    self.awayWinView.countLab.text = [NSString stringWithFormat:@"(%@场)",NonNil(model.similar.last_count.won)];
    self.awayEqualView.topLab.text = [NSString stringWithFormat:@"%@%%",model.similar.last_rate.draw];
    self.awayEqualView.bottomLab.text = [NSString stringWithFormat:@"%@",model.similar.last_odds.draw];
    self.awayEqualView.countLab.text = [NSString stringWithFormat:@"(%@场)",NonNil(model.similar.last_count.draw)];
    self.awayLoseView.topLab.text = [NSString stringWithFormat:@"%@%%",model.similar.last_rate.loss];
    self.awayLoseView.bottomLab.text = [NSString stringWithFormat:@"%@",model.similar.last_odds.draw];
    self.awayLoseView.countLab.text = [NSString stringWithFormat:@"(%@场)",NonNil(model.similar.last_count.loss)];
    
    if ([model.similar.last_odds.won floatValue]>[model.similar.begin_odds.won floatValue]) {
        self.awayWinView.bottomLab.textColor = COLOR_EF2F2F;
    }else  if ([model.similar.last_odds.won floatValue]>[model.similar.begin_odds.won floatValue]) {
        self.awayWinView.bottomLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayWinView.bottomLab.textColor = COLOR_30B27A;
    }
    if ([model.similar.last_odds.draw floatValue]>[model.similar.begin_odds.draw floatValue]) {
        self.awayEqualView.bottomLab.textColor = COLOR_EF2F2F;
    }else  if ([model.similar.last_odds.draw floatValue]>[model.similar.begin_odds.draw floatValue]) {
        self.awayEqualView.bottomLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayEqualView.bottomLab.textColor = COLOR_30B27A;
    }
    if ([model.similar.last_odds.loss floatValue]>[model.similar.begin_odds.loss floatValue]) {
        self.awayLoseView.bottomLab.textColor = COLOR_EF2F2F;
    }else  if ([model.similar.last_odds.loss floatValue]>[model.similar.begin_odds.loss floatValue]) {
        self.awayLoseView.bottomLab.textColor = COLOR_2F2F2F;
    }else{
        self.awayLoseView.bottomLab.textColor = COLOR_30B27A;
    }
    
    float homeTotal = [model.similar.begin_count.total floatValue];
    if (homeTotal>0) {
        self.homeWinView.rate =  [model.similar.begin_count.won floatValue]/homeTotal;
        self.homeEqualView.rate =  [model.similar.begin_count.draw floatValue]/homeTotal;
        self.homeLoseView.rate =  [model.similar.begin_count.loss floatValue]/homeTotal;
    }else{
        self.homeWinView.rate =  0;
        self.homeEqualView.rate =  0;
        self.homeLoseView.rate =  0;
        
    }
    float awayTotal = [model.similar.last_count.total floatValue];
    if (awayTotal>0) {
        self.awayWinView.rate =  [model.similar.last_count.won floatValue]/awayTotal;
        self.awayEqualView.rate =  [model.similar.last_count.draw floatValue]/awayTotal;
        self.awayLoseView.rate =  [model.similar.last_count.loss floatValue]/awayTotal;
    }else{
        self.awayWinView.rate =  0;
        self.awayEqualView.rate =   0;
        self.awayLoseView.rate =   0;
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

- (void)setHidetopMatch:(BOOL)hidetopMatch {
    _hidetopMatch = hidetopMatch;
    if (hidetopMatch) {
        self.bgView.hidden = hidetopMatch;
        self.matchView.hidden = YES;
        [self.matchView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.height.mas_equalTo(0);
        }];
        [self.redLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(16));
        }];
    }
}

- (JCHistoryPayDataModelDetailMatchView *)matchView {
    if (!_matchView) {
        _matchView = [JCHistoryPayDataModelDetailMatchView new];
    }
    return _matchView;
}

- (UIView *)tpBgView {
    if (!_tpBgView) {
        _tpBgView = [UIView new];
    }
    return _tpBgView;
}

- (UIView *)historyBgView {
    if (!_historyBgView) {
        _historyBgView = [UIView new];
    }
    return _historyBgView;
}

- (UILabel *)chuLab {
    if (!_chuLab) {
        _chuLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuLab;
}

- (UILabel *)jiLab {
    if (!_jiLab) {
        _jiLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _jiLab;
}

- (JCHistoryPayDataModelColumnarView *)homeWinView {
    if (!_homeWinView) {
        _homeWinView =  [JCHistoryPayDataModelColumnarView new];
        _homeWinView.topLab.textColor = COLOR_EF2F2F;
        _homeWinView.colorView.backgroundColor = COLOR_EF2F2F;
        _homeWinView.nameLab.text = @"主胜";
    }
    return _homeWinView;
}

- (JCHistoryPayDataModelColumnarView *)homeEqualView {
    if (!_homeEqualView) {
        _homeEqualView =  [JCHistoryPayDataModelColumnarView new];
        _homeEqualView.topLab.textColor = COLOR_30B27A;
        _homeEqualView.colorView.backgroundColor = COLOR_30B27A;
        _homeEqualView.nameLab.text = @"平";
    }
    return _homeEqualView;
}

- (JCHistoryPayDataModelColumnarView *)homeLoseView {
    if (!_homeLoseView) {
        _homeLoseView =  [JCHistoryPayDataModelColumnarView new];
        _homeLoseView.topLab.textColor = COLOR_002868;
        _homeLoseView.colorView.backgroundColor = COLOR_002868;
        _homeLoseView.nameLab.text = @"客胜";
    }
    return _homeLoseView;
}

- (JCHistoryPayDataModelColumnarView *)awayWinView {
    if (!_awayWinView) {
        _awayWinView =  [JCHistoryPayDataModelColumnarView new];
        _awayWinView.topLab.textColor = COLOR_EF2F2F;
        _awayWinView.colorView.backgroundColor = COLOR_EF2F2F;
        _awayWinView.nameLab.text = @"主胜";
    }
    return _awayWinView;
}

- (JCHistoryPayDataModelColumnarView *)awayEqualView {
    if (!_awayEqualView) {
        _awayEqualView =  [JCHistoryPayDataModelColumnarView new];
        _awayEqualView.topLab.textColor = COLOR_30B27A;
        _awayEqualView.colorView.backgroundColor = COLOR_30B27A;
        _awayEqualView.nameLab.text = @"平";
    }
    return _awayEqualView;
}

- (JCHistoryPayDataModelColumnarView *)awayLoseView {
    if (!_awayLoseView) {
        _awayLoseView =  [JCHistoryPayDataModelColumnarView new];
        _awayLoseView.topLab.textColor = COLOR_002868;
        _awayLoseView.colorView.backgroundColor = COLOR_002868;
        _awayLoseView.nameLab.text = @"客胜";
    }
    return _awayLoseView;
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
