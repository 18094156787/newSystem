//
//  JCMatchGoalDistributionInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchGoalDistributionInfoCell.h"
#import "JCWZBStatusModel.h"
@implementation JCMatchGoalDistributionInfoCell

- (void)initViews {
    [self.contentView addSubview:self.teamBgView];
    [self.teamBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(AUTO(40));
    }];
    
    [self.teamBgView addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.teamBgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(2), AUTO(16)));
    }];
    
    [self.teamBgView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeView.mas_right).offset(3);
        make.centerY.equalTo(self.teamBgView);

    }];
    
    [self.teamBgView addSubview:self.awayView];
    [self.awayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.teamBgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(2), AUTO(16)));
    }];
    
    [self.teamBgView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayView.mas_left).offset(-3);
        make.centerY.equalTo(self.teamBgView);
    }];
    
    [self.contentView addSubview:self.attackCircleView];
    [self.attackCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.teamBgView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3.0, AUTO(70)));
    }];
    
    [self.contentView addSubview:self.controlCircleView];
    [self.controlCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.equalTo(self.teamBgView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3.0, AUTO(70)));
    }];
    
    [self.contentView addSubview:self.dangerousCircleView];
    [self.dangerousCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.controlCircleView.mas_left);
        make.top.equalTo(self.teamBgView.mas_bottom);
        make.left.equalTo(self.attackCircleView.mas_right);
        make.height.mas_equalTo(AUTO(70));
    }];
    
    [self.contentView addSubview:self.shezhengProgressView];
    [self.shezhengProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(80));
        make.right.offset(AUTO(-80));
        make.top.equalTo(self.attackCircleView.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(30));
    }];

    [self.contentView addSubview:self.shepianProgressView];
    [self.shepianProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(80));
        make.right.offset(AUTO(-80));
        make.top.equalTo(self.shezhengProgressView.mas_bottom);
        make.height.mas_equalTo(AUTO(30));
//        make.bottom.offset(AUTO(-20));
    }];
    
    [self addSubview:self.homeJiaoImgView];
    [self.homeJiaoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.bottom.equalTo(self.shezhengProgressView).offset(AUTO(-3));
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self addSubview:self.homeJiaoLab];
    [self.homeJiaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeJiaoImgView);
        make.bottom.equalTo(self.shepianProgressView).offset(AUTO(-1));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(16)));
    }];
    
    [self addSubview:self.homeYellowImgView];
    [self.homeYellowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeJiaoImgView.mas_right).offset(AUTO(15));
        make.centerY.equalTo(self.homeJiaoImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];

    [self addSubview:self.homeYellowLab];
    [self.homeYellowLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeYellowImgView);
        make.centerY.equalTo(self.homeJiaoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(16)));
    }];

    [self addSubview:self.homeRedImgView];
    [self.homeRedImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeYellowImgView.mas_right).offset(AUTO(15));
        make.centerY.equalTo(self.homeJiaoImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];

    [self addSubview:self.homeRedLab];
    [self.homeRedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeRedImgView);
        make.centerY.equalTo(self.homeJiaoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(16)));
    }];

    //
    [self addSubview:self.awayJiaoImgView];
     [self.awayJiaoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.offset(AUTO(-8));
//         make.bottom.equalTo(self.shezhengProgressView).offset(AUTO(8));
         make.centerY.equalTo(self.homeJiaoImgView);
         make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
     }];

     [self addSubview:self.awayJiaoLab];
     [self.awayJiaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.awayJiaoImgView);
         make.centerY.equalTo(self.homeJiaoLab);
         make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(16)));
     }];

    [self addSubview:self.awayYellowImgView];
    [self.awayYellowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayJiaoImgView.mas_left).offset(AUTO(-15));
        make.centerY.equalTo(self.homeJiaoImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];

    [self addSubview:self.awayYellowLab];
    [self.awayYellowLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayYellowImgView);
        make.centerY.equalTo(self.homeJiaoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(16)));
    }];

    [self addSubview:self.awayRedImgView];
    [self.awayRedImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.awayYellowImgView.mas_left).offset(AUTO(-15));
        make.centerY.equalTo(self.homeJiaoImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];

    [self addSubview:self.awayRedLab];
    [self.awayRedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayRedImgView);
        make.centerY.equalTo(self.homeJiaoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(16)));
//        make.bottom.offset(AUTO(-10));
    }];
    
}
//状态码 type
//0       无
//1 进球 足球技术统计
//2 角球 足球技术统计
//3 黄牌 足球技术统计
//4 红牌 足球技术统计
//5 界外球 足球技术统计
//6 任意球 足球技术统计
//7 球门球 足球技术统计
//8 点球 足球技术统计
//9 换人 足球技术统计
//10 比赛开始 足球技术统计
//11 中场 足球技术统计
//12 结束 足球技术统计
//13 半场比分 足球技术统计
//15 两黄变红 足球技术统计
//16 点球未进 足球技术统计
//17 乌龙球 足球技术统计
//19 伤停补时 足球技术统计
//21 射正 足球技术统计
//22 射偏 足球技术统计
//23 进攻 足球技术统计
//24 危险进攻 足球技术统计
//25 控球率 足球技术统计
//26 加时赛结束 足球技术统计
//27 点球大战结束


- (void)setLiveStatsModel:(JCLiveDistributionModel *)liveStatsModel {
    _liveStatsModel = liveStatsModel;
    self.attackCircleView.attackModel = liveStatsModel;
    self.dangerousCircleView.dangerModel = liveStatsModel;
    self.controlCircleView.possessionModel = liveStatsModel;
    self.attackCircleView.titleLab.text = @"进攻  ";
    self.dangerousCircleView.titleLab.text = @"危险\n进攻";
    self.controlCircleView.titleLab.text = @"控制率";
#pragma mark todo 需要处理
    self.shezhengProgressView.titleLab.text = @"射正球门";
    self.shezhengProgressView.shoot_centerModel = liveStatsModel;
    self.shepianProgressView.titleLab.text = @"射偏球门";
    self.shepianProgressView.shoot_awayModel = liveStatsModel;
//
    self.homeJiaoLab.text = liveStatsModel.home.corner;
    self.homeYellowLab.text = liveStatsModel.home.yellow;
    self.homeRedLab.text = liveStatsModel.home.red;

    self.awayJiaoLab.text = liveStatsModel.away.corner;
    self.awayYellowLab.text = liveStatsModel.away.yellow;
    self.awayRedLab.text = liveStatsModel.away.red;
}

//- (void)setStatusDic:(NSDictionary *)statusDic {
//    _statusDic = statusDic;
//    if (statusDic.allKeys.count==0) {
//        return;
//    }
////   JCWZBStatusModel *typeModel8 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"8"] class:[JCWZBStatusModel class]];
//   JCWZBStatusModel *typeModel4 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"4"] class:[JCWZBStatusModel class]];
//   JCWZBStatusModel *typeModel3 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"3"] class:[JCWZBStatusModel class]];
//
//   JCWZBStatusModel *typeModel2 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"2"] class:[JCWZBStatusModel class]];
//   JCWZBStatusModel *typeModel25 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"25"] class:[JCWZBStatusModel class]];
//   JCWZBStatusModel *typeModel24 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"24"] class:[JCWZBStatusModel class]];
//   JCWZBStatusModel *typeModel23 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"23"] class:[JCWZBStatusModel class]];
//       JCWZBStatusModel *typeModel22 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"22"] class:[JCWZBStatusModel class]];
//       JCWZBStatusModel *typeModel21 = (JCWZBStatusModel *)[JCWJsonTool entityWithJson:statusDic[@"21"] class:[JCWZBStatusModel class]];
//
//    self.homeNameLab.text = @"杜海勒";
//    self.awayNameLab.text= @"杜海勒";
//
//    self.attackCircleView.model = typeModel23;
//    self.dangerousCircleView.model = typeModel24;
//    self.controlCircleView.model = typeModel25;
//    self.attackCircleView.titleLab.text = @"进攻  ";
//    self.dangerousCircleView.titleLab.text = @"危险\n进攻";
//    self.controlCircleView.titleLab.text = @"控制率";
//
//    self.shezhengProgressView.titleLab.text = @"射正球门";
//    self.shezhengProgressView.model = typeModel21;
//    self.shepianProgressView.titleLab.text = @"射偏球门";
//    self.shepianProgressView.model = typeModel22;
//
//    self.homeJiaoLab.text = typeModel2.home;
//    self.homeYellowLab.text = typeModel3.home;
//    self.homeRedLab.text = typeModel4.home;
//
//    self.awayJiaoLab.text = typeModel2.away;
//    self.awayYellowLab.text = typeModel3.away;
//    self.awayRedLab.text = typeModel4.away;
//
//}

- (void)setMatchBall:(JCMatchBall *)matchBall {
    _matchBall = matchBall;
    self.homeNameLab.text = matchBall.home_team.name_zh;;
    self.awayNameLab.text = matchBall.away_team.name_zh;
}

- (UIView *)teamBgView {
    if (!_teamBgView) {
        _teamBgView = [UIView new];
        _teamBgView.backgroundColor = COLOR_F0F0F0;
    }
    return _teamBgView;
}

- (UIView *)homeView {
    if (!_homeView) {
        _homeView = [UIView new];
        _homeView.backgroundColor = JCBaseColor;
    }
    return _homeView;
}

- (UIView *)awayView {
    if (!_awayView) {
        _awayView = [UIView new];
        _awayView.backgroundColor = COLOR_002868;
    }
    return _awayView;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayNameLab;
}

- (JCMatchGoalDistributionInfoCirCleView *)attackCircleView {
    if (!_attackCircleView) {
        _attackCircleView = [JCMatchGoalDistributionInfoCirCleView new];
    }
    return _attackCircleView;
}

- (JCMatchGoalDistributionInfoCirCleView *)dangerousCircleView {
    if (!_dangerousCircleView) {
        _dangerousCircleView = [JCMatchGoalDistributionInfoCirCleView new];
    }
    return _dangerousCircleView;
}

- (JCMatchGoalDistributionInfoCirCleView *)controlCircleView {
    if (!_controlCircleView) {
        _controlCircleView = [JCMatchGoalDistributionInfoCirCleView new];
    }
    return _controlCircleView;
}

- (JCMatchGoalDistributionInfoProgressView *)shezhengProgressView {
    if (!_shezhengProgressView) {
        _shezhengProgressView = [JCMatchGoalDistributionInfoProgressView new];
    }
    return _shezhengProgressView;
}

- (JCMatchGoalDistributionInfoProgressView *)shepianProgressView {
    if (!_shepianProgressView) {
        _shepianProgressView = [JCMatchGoalDistributionInfoProgressView new];
    }
    return _shepianProgressView;
}

- (UIImageView *)homeJiaoImgView {
    if (!_homeJiaoImgView) {
        _homeJiaoImgView = [UIImageView new];
        _homeJiaoImgView.image = JCIMAGE(@"zb_icon_jiaoqiu");
    }
    return _homeJiaoImgView;
}

- (UIImageView *)homeYellowImgView {
    if (!_homeYellowImgView) {
        _homeYellowImgView = [UIImageView new];
        _homeYellowImgView.image = JCIMAGE(@"zb_icon_huangpai");
    }
    return _homeYellowImgView;
}

- (UIImageView *)homeRedImgView {
    if (!_homeRedImgView) {
        _homeRedImgView = [UIImageView new];
        _homeRedImgView.image = JCIMAGE(@"zb_icon_hongpai");
    }
    return _homeRedImgView;
}

- (UILabel *)homeJiaoLab {
    if (!_homeJiaoLab) {
        _homeJiaoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeJiaoLab;
}

- (UILabel *)homeYellowLab {
    if (!_homeYellowLab) {
        _homeYellowLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeYellowLab;
}

- (UILabel *)homeRedLab {
    if (!_homeRedLab) {
        _homeRedLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeRedLab;
}



- (UIImageView *)awayJiaoImgView {
    if (!_awayJiaoImgView) {
        _awayJiaoImgView = [UIImageView new];
        _awayJiaoImgView.image = JCIMAGE(@"zb_icon_jiaoqiu");
    }
    return _awayJiaoImgView;
}

- (UIImageView *)awayYellowImgView {
    if (!_awayYellowImgView) {
        _awayYellowImgView = [UIImageView new];
        _awayYellowImgView.image = JCIMAGE(@"zb_icon_huangpai");
    }
    return _awayYellowImgView;
}

- (UIImageView *)awayRedImgView {
    if (!_awayRedImgView) {
        _awayRedImgView = [UIImageView new];
        _awayRedImgView.image = JCIMAGE(@"zb_icon_hongpai");
    }
    return _awayRedImgView;
}

- (UILabel *)awayJiaoLab {
    if (!_awayJiaoLab) {
        _awayJiaoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayJiaoLab;
}

- (UILabel *)awayYellowLab {
    if (!_awayYellowLab) {
        _awayYellowLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayYellowLab;
}

- (UILabel *)awayRedLab {
    if (!_awayRedLab) {
        _awayRedLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayRedLab;
}

@end
