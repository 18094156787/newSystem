//
//  JCTeamMatchInfoScoreXioaZuInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoScoreXioaZuInfoCell.h"

@implementation JCTeamMatchInfoScoreXioaZuInfoCell

- (void)initViews {
    
    UIView *bottomView = [UIView new];
    [self.contentView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.bottomView = bottomView;
    
    [bottomView addSubview:self.rankLab];
    [self.rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(18)));
    }];
    
    [bottomView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(18)));
    }];
    
    [bottomView addSubview:self.jsLab];
    [self.jsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.scoreLab.mas_left);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(45), AUTO(18)));
    }];
    
    [bottomView addSubview:self.spfLab];
    [self.spfLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.jsLab.mas_left);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(18)));
    }];
    
    [bottomView addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.spfLab.mas_left);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(18)));
    }];
    
    [bottomView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.numberLab.mas_left);
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(18)));
    }];
    
    [bottomView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.teamLab);
        make.right.equalTo(self.teamLab.mas_left).offset(AUTO(-3));
        make.width.height.mas_equalTo(AUTO(20));
    }];
}
- (void)data {

}

- (void)setModel:(JCEventScoreLianSaiInfoModel *)model {
    _model = model;
    self.rankLab.text = model.position;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.team_logo]];
    self.teamLab.text = model.team_name;
    self.numberLab.text = model.total;
    self.scoreLab.text = model.points;
    self.spfLab.text = [NSString stringWithFormat:@"%@/%@/%@",model.won,model.draw,model.loss];
    self.jsLab.text = [NSString stringWithFormat:@"%@/%@",model.goals,model.goals_against];
//    self.groupLab.text = @" 欧冠杯小组赛资格 ";
//    self.groupLab.backgroundColor = JCBaseColor;
//    self.rankLab.text = @"1";
//    self.scoreLab.text = @"86";
//    self.jsLab.text = @"70/25";
//    self.spfLab.text = @"28/2/2";
//    self.numberLab.text = @"32";
//    self.teamLab.text = @"曼彻斯特联赛";
//    self.iconImgView.backgroundColor = JCBaseColor;
  
}


- (UILabel *)rankLab {
    if (!_rankLab) {
        _rankLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rankLab;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _teamLab;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _numberLab;
}

- (UILabel *)spfLab {
    if (!_spfLab) {
        _spfLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _spfLab;
}

- (UILabel *)jsLab {
    if (!_jsLab) {
        _jsLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _jsLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
//        [_iconImgView hg_setAllCornerWithCornerRadius:AUTO(10)];
    }
    return _iconImgView;
}

@end
