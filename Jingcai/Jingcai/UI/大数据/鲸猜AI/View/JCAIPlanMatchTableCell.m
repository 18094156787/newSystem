//
//  JCAIPlanMatchTableCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAIPlanMatchTableCell.h"

@implementation JCAIPlanMatchTableCell

- (void)initViews {
    self.backgroundColor = COLOR_F6F6F6;
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-8));
    }];
    
//    [self.contentView addSubview:self.refundImgView];
//    [self.refundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(0);
//        make.centerY.equalTo(self.contentView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(32), AUTO(32)));
//    }];
//
//    [self.contentView addSubview:self.statusImgView];
//    [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.refundImgView.mas_left).offset(AUTO(8));
//        make.centerY.equalTo(self.contentView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(36), AUTO(32)));
//    }];
    
    [self.contentView addSubview:self.statusImgView];
    [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(AUTO(10));
        make.right.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(35)));
    }];
    
    [self.contentView addSubview:self.refundImgView];
    [self.refundImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(AUTO(-5));
        make.size.mas_equalTo(CGSizeMake(AUTO(52), AUTO(18)));
    }];
}

//- (void)setMatchDic:(NSDictionary *)matchDic {
//    _matchDic = matchDic;
//    NSString *match_name = matchDic[@"match_name"];
//    if (match_name.length==0) {
//        self.titleLab.text = [NSString stringWithFormat:@"%@ %@  %@ vs %@", matchDic[@"match_time"], matchDic[@"league_name"], matchDic[@"home_name"], matchDic[@"away_name"]];
//    }else{
//        self.titleLab.text = [NSString stringWithFormat:@"%@ [%@] %@  %@ vs %@", matchDic[@"match_time"],match_name, matchDic[@"league_name"], matchDic[@"home_name"], matchDic[@"away_name"]];
//    }
//
////    self.statusImgView.image = JCIMAGE(@"ic_match_qx");
//}

- (void)setDianPingBall:(JCHongBangBall *)dianPingBall {
    _dianPingBall = dianPingBall;
    self.statusImgView.hidden = dianPingBall.base_info.wl==0?YES:NO;
    if (dianPingBall.base_info.wl==1||dianPingBall.base_info.wl==3) {
        self.statusImgView.image = JCIMAGE(@"ic_match_hong");
        
    }
    if (dianPingBall.base_info.wl==2||dianPingBall.base_info.wl==4) {
        self.statusImgView.image = JCIMAGE(@"ic_match_hei");
    }
    if (dianPingBall.base_info.wl==5) {
        self.statusImgView.image = JCIMAGE(@"ic_match_zs");
    }
    if (dianPingBall.base_info.wl==6) {
        self.statusImgView.image = JCIMAGE(@"ic_match_yq");
    }
    if (dianPingBall.base_info.wl==7) {
        self.statusImgView.image = JCIMAGE(@"ic_match_qx");
    }
}


- (void)setModel:(JCHongBangMatchModel *)model {
    _model = model;
    if (self.is_zh) {
        model.home_team_name = model.home_team_name;
        model.away_team_name = model.away_team_name;
    }
    if (self.is_round_num) {
        model.issue_num = model.round_num;
    }
    
    NSString *home_team_name = model.home_team_name;
    NSString *away_team_name = model.away_team_name;
    if (model.is_reverse==1) {
        home_team_name = model.away_team_name;
        away_team_name = model.home_team_name;
    }
    
  
    if (model.issue_num.length==0) {
        self.titleLab.text = [NSString stringWithFormat:@"%@ %@  %@ vs %@", model.match_time, model.competition_name, home_team_name, away_team_name];
    }else{
        self.titleLab.text = [NSString stringWithFormat:@"%@ [%@] %@  %@ vs %@", model.match_time,model.issue_num, model.competition_name, home_team_name, away_team_name];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLab.text = title;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

-(UIImageView *)statusImgView {
    if (!_statusImgView) {
        _statusImgView = [UIImageView new];
        _statusImgView.hidden = YES;
    }
    return _statusImgView;
}

-(UIImageView *)refundImgView {
    if (!_refundImgView) {
        _refundImgView = [UIImageView new];
        _refundImgView.image = JCIMAGE(@"hb_bzfh");
        _refundImgView.hidden = YES;
    }
    return _refundImgView;
}

@end
