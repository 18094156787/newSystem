//
//  JNMatchSJAgainstTeam_HistoryBattleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstTeam_HistoryBattleCell.h"

@interface JNMatchSJAgainstTeam_HistoryBattleCell()

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation JNMatchSJAgainstTeam_HistoryBattleCell

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(20));
    }];

    
//    [self addSubview:self.homeView];
//    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
//        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//    }];
    
    [self addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.right.offset(AUTO(-15));
    }];
    
//    [self addSubview:self.awayView];
//    [self.awayView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.top.equalTo(self.homeView.mas_bottom).offset(AUTO(10));
//        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
//    }];
    
    [self addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.homeLab.mas_bottom).offset(AUTO(2));
        make.right.offset(AUTO(-15));
    }];

    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.awayLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(45)*6+AUTO(35));
        make.bottom.offset(AUTO(-20));
    }];
    
    [self.tableView registerClass:[JNMatchSJAgainstTeam_HistoryBattleContentCell class] forCellReuseIdentifier:@"JNMatchSJAgainstTeam_HistoryBattleContentCell"];

}

- (void)setModel:(JCBigDataVS_AnalysisModel *)model {
    _model = model;
    NSInteger count = model.match.count;
    if (count>10) {
        count=10;
    }
    NSString *title = [NSString stringWithFormat:@"历史交锋(%ld场)",count];
//    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
//    NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%ld场",count]];
//    if (range.location!=NSNotFound) {
//        [attr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(11)] range:range];
//    }
    self.titleLab.text = title;
    self.homeLab.text = [NSString stringWithFormat:@"%@：%@胜%@平%@负，进%@球，失%@球",model.home_name,model.win,model.draw,model.lose,model.win_score,model.lose_score];
    self.awayLab.text = [NSString stringWithFormat:@"%@：%@胜%@平%@负，进%@球，失%@球",model.away_name,model.lose,model.draw,model.win,model.lose_score,model.win_score];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(45)*count+AUTO(35));

    }];
    [self.tableView reloadData];
}


#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.model.match.count>10) {
        return 11;
    }
    return self.model.match.count+1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchSJAgainstTeam_HistoryBattleContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchSJAgainstTeam_HistoryBattleContentCell"];
    cell.row = indexPath.row;
    if (indexPath.row==0) {

        cell.labelOne.text = @"日期/赛事";
        cell.labelTwo.text = @"主队";
        cell.labelThree.text = @"比分";
        cell.labelFour.text = @"客队";
        cell.labelOne.backgroundColor = COLOR_F0F0F0;
        cell.labelTwo.backgroundColor = COLOR_F0F0F0;
        cell.labelThree.backgroundColor = COLOR_F0F0F0;
        cell.labelFour.backgroundColor = COLOR_F0F0F0;



        
    }else{
        JCBigDataAnalysisMatchModel *model = self.model.match[indexPath.row-1];
        cell.model = model;
        cell.labelOne.backgroundColor = JCWhiteColor;
        cell.labelTwo.backgroundColor = JCWhiteColor;
        cell.labelThree.backgroundColor = JCWhiteColor;
        cell.labelFour.backgroundColor = JCWhiteColor;

    }

    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
            return AUTO(35);
        }
        return AUTO(45);
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;

        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
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
- (UIView *)homeView {
    if (!_homeView) {
        _homeView = [UIView new];
        _homeView.backgroundColor = JCBaseColor;
        [_homeView hg_setAllCornerWithCornerRadius:2];
    }
    return _homeView;
}

- (UIView *)awayView {
    if (!_awayView) {
        _awayView = [UIView new];
        [_awayView hg_setAllCornerWithCornerRadius:2];
        _awayView.backgroundColor = COLOR_5194E3;
    }
    return _awayView;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _homeLab.numberOfLines = 0;
    }
    return _homeLab ;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _awayLab.numberOfLines = 0;
    }
    return _awayLab ;
}
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"日期/赛事",@"主队",@"比分",@"客队",];
    }
    return _titleArray;
}

@end
