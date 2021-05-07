//
//  JCPlaneDetailMatch_JZCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailMatch_JZCell.h"

@implementation JCPlaneDetailMatch_JZCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.offset(AUTO(10));
    }];
    
    [self.contentView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(self.titleLab);
    }];
    
    [self.contentView addSubview:self.vsLab];
    [self.vsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(25), AUTO(25)));
    }];
    
    [self.contentView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.vsLab.mas_left).offset(AUTO(-20));
        make.centerY.equalTo(self.vsLab);
        make.left.offset(AUTO(15));
    }];
    
    [self.contentView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.vsLab.mas_right).offset(AUTO(20));
        make.centerY.equalTo(self.vsLab);
        make.right.offset(AUTO(-15));
    }];
    
    NSMutableArray *homeArray = [NSMutableArray array];
    
    [self.contentView addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(65));
        make.right.offset(AUTO(-30));
        make.top.equalTo(self.vsLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.contentView addSubview:self.no_rqLab];
    [self.no_rqLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.centerY.equalTo(self.homeView);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    
    [self.homeView addSubview:self.no_rq_windLab];
    [self.no_rq_windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(83), AUTO(28)));
    }];
    
    [self.homeView addSubview:self.no_rq_equalLab];
    [self.no_rq_equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(83), AUTO(28)));
    }];
    
    [self.homeView addSubview:self.no_rq_loseLab];
    [self.no_rq_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(83), AUTO(28)));
    }];
    

    [homeArray addObject:self.no_rq_windLab];
    [homeArray addObject:self.no_rq_equalLab];
    [homeArray addObject:self.no_rq_loseLab];
    [homeArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:1 tailSpacing:1];
    
    [self.contentView addSubview:self.awayView];
    [self.awayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(65));
        make.right.offset(AUTO(-30));
        make.top.equalTo(self.homeView.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.contentView addSubview:self.rqLab];
    [self.rqLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(30));
        make.centerY.equalTo(self.awayView);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    NSMutableArray *awayArray = [NSMutableArray array];
    

    
    [self.awayView addSubview:self.rq_windLab];
    [self.rq_windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(83), AUTO(28)));
    }];
    
    [self.awayView addSubview:self.rq_equalLab];
    [self.rq_equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(83), AUTO(28)));
    }];
    
    [self.awayView addSubview:self.rq_loseLab];
    [self.rq_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(83), AUTO(28)));
    }];
    

    [awayArray addObject:self.rq_windLab];
    [awayArray addObject:self.rq_equalLab];
    [awayArray addObject:self.rq_loseLab];
    [awayArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:1 tailSpacing:1];
    
}


- (void)setMatchModel:(JCWVerTjInfoMatchBall *)matchModel {
    _matchModel = matchModel;
    NSString *matchTime = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[matchModel.match_time doubleValue]];
        NSString *title = NonNil(matchModel.event_name);
        if (matchModel.group_num_new.length>0||matchModel.round_num_two.length>0) {
            title = [title stringByAppendingFormat:@" %@%@",NonNil(matchModel.group_num_new),NonNil(matchModel.round_num_two)];
        }
        if (matchTime.length>0) {
            title = [title stringByAppendingFormat:@" %@",NonNil(matchTime)];
        }
        if (matchModel.round_num_one.length>0) {
            title = [title stringByAppendingFormat:@" | %@",NonNil(matchModel.round_num_one)];
        }
    if (matchModel.event_name.length>0) {
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:matchModel.event_name];
        [attrTitle addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
        self.titleLab.attributedText = attrTitle;
    }else{
        self.titleLab.text = title;
    }
    if (matchModel.classfly==1) {
         self.typeLab.backgroundColor = [COLOR_1B1B1B colorWithAlphaComponent:0.1];
         self.typeLab.layer.borderColor = COLOR_1B1B1B.CGColor;
         self.typeLab.textColor = COLOR_1B1B1B;
     }else if(matchModel.classfly==2){

         self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
         self.typeLab.layer.borderColor = COLOR_002868.CGColor;
         self.typeLab.textColor = COLOR_002868;
     }else if(matchModel.classfly==3){
         self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
         self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
         self.typeLab.textColor = COLOR_30B27A;
     }
     else if(matchModel.classfly==4){
         self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
         self.typeLab.layer.borderColor = JCBaseColor.CGColor;
         self.typeLab.textColor = JCBaseColor;
     }
     else{
         self.typeLab.text = [NSString stringWithFormat:@"  %@  ",matchModel.name];
         self.typeLab.backgroundColor = [COLOR_1B1B1B colorWithAlphaComponent:0.1];
         self.typeLab.layer.borderColor = COLOR_1B1B1B.CGColor;
         self.typeLab.textColor = COLOR_1B1B1B;
     }

    self.typeLab.text = matchModel.classfly_desc;
    self.homeLab.text = matchModel.home_name;
    self.awayLab.text = matchModel.away_name;
    
    
    self.homeView.hidden = matchModel.no_rq_odds.win.length>0?NO:YES;
    self.awayView.hidden = matchModel.rq_odds.win.length>0?NO:YES;
    self.no_rqLab.hidden = matchModel.no_rq_odds.win.length>0?NO:YES;
    self.rqLab.hidden = matchModel.rq_odds.win.length>0?NO:YES;
    
    [self.homeView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (matchModel.no_rq_odds.win.length>0) {
            make.height.mas_equalTo(AUTO(30));
        }else{
            make.height.mas_equalTo(0);
        }
    }];
    
    [self.awayView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (matchModel.rq_odds.win.length>0) {
            make.height.mas_equalTo(AUTO(30));
        }else{
            make.height.mas_equalTo(0);
        }
    }];
    

    self.no_rqLab.text = matchModel.no_rq_odds.rq.length>0? matchModel.no_rq_odds.rq : @"0";
    self.no_rq_windLab.text = [NSString stringWithFormat:@"主胜 %@",matchModel.no_rq_odds.win];
    self.no_rq_equalLab.text = [NSString stringWithFormat:@"平 %@",matchModel.no_rq_odds.equal];
    self.no_rq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",matchModel.no_rq_odds.lose];
    

    self.awayView.hidden = matchModel.classfly==1?YES:NO;
    self.rqLab.hidden = matchModel.classfly==1?YES:NO;
    self.rqLab.text = matchModel.rq_odds.rq.length>0? matchModel.rq_odds.rq : @"0";
    self.rq_windLab.text = [NSString stringWithFormat:@"主胜 %@",matchModel.rq_odds.win];
    self.rq_equalLab.text = [NSString stringWithFormat:@"平 %@",matchModel.rq_odds.equal];
    self.rq_loseLab.text =[NSString stringWithFormat:@"客胜 %@",matchModel.rq_odds.lose];
    
    
    self.rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.rq_equalLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.no_rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.no_rq_equalLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.no_rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    
    
    NSArray *array = [matchModel.spf componentsSeparatedByString:@","];
    for (NSString *value in array) {
        
        switch ([value intValue]) {
            case 1:
            {
                self.no_rq_windLab.layer.borderColor = JCBaseColor.CGColor;
            }
                break;
            case 2:
            {
                self.no_rq_equalLab.layer.borderColor = JCBaseColor.CGColor;
            }
                break;
            case 3:
            {
                self.no_rq_loseLab.layer.borderColor = JCBaseColor.CGColor;
            }
                break;
            case 4:
            {
                self.rq_windLab.layer.borderColor = JCBaseColor.CGColor;
            }
                break;
            case 5:
            {
                self.rq_equalLab.layer.borderColor = JCBaseColor.CGColor;;
            }
                break;
            case 6:
            {
                self.rq_loseLab.layer.borderColor = JCBaseColor.CGColor;
            }
                break;

                
            default:
                break;
        }
    }
//    NSString *value1 =
    

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}



- (KKPaddingLabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _typeLab.layer.borderColor = JCBaseColor.CGColor;
        _typeLab.layer.borderWidth = 1;
        _typeLab.layer.cornerRadius = AUTO(2);
        _typeLab.layer.masksToBounds = YES;
        _typeLab.padding = UIEdgeInsetsMake(0, 8, 0, 8);
    }
    return _typeLab;
}

- (UILabel *)vsLab {
    if (!_vsLab) {
        _vsLab = [UILabel initWithTitle:@"vs" andFont:AUTO(20) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _vsLab;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _homeLab.numberOfLines = 2;
    }
    return _homeLab;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _awayLab.numberOfLines = 2;
    }
    return _awayLab;
}

- (UIView *)homeView {
    if (!_homeView) {
        _homeView = [UIView new];
//        _homeView.layer.cornerRadius = 5;
//        _homeView.layer.masksToBounds =YES;
//        _homeView.layer.borderWidth = 0.5;
//        _homeView.layer.borderColor = COLOR_E4E4E4.CGColor;
    }
    return _homeView;
}

- (UILabel *)no_rqLab {
    if (!_no_rqLab) {
        _no_rqLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rqLab.layer.borderWidth = 0.5;
        _no_rqLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _no_rqLab.layer.cornerRadius = 5;
        _no_rqLab.layer.masksToBounds = YES;
        
    }
    return _no_rqLab;
}

- (UILabel *)no_rq_windLab {
    if (!_no_rq_windLab) {
        _no_rq_windLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rq_windLab.layer.borderWidth = 0.5;
        _no_rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;

    }
    return _no_rq_windLab;
}

- (UILabel *)no_rq_equalLab {
    if (!_no_rq_equalLab) {
        _no_rq_equalLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rq_equalLab.layer.borderWidth = 0.5;
        _no_rq_equalLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    }
    return _no_rq_equalLab;
}

- (UILabel *)no_rq_loseLab {
    if (!_no_rq_loseLab) {
        _no_rq_loseLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rq_loseLab.layer.borderWidth = 0.5;
        _no_rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    }
    return _no_rq_loseLab;
}

- (UIView *)awayView {
    if (!_awayView) {
        _awayView = [UIView new];
    }
    return _awayView;
}

- (UILabel *)rqLab {
    if (!_rqLab) {
        _rqLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rqLab.layer.borderWidth = 0.5;
        _rqLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _rqLab.layer.cornerRadius = 5;
        _rqLab  .layer.masksToBounds = YES;
    }
    return _rqLab;
}

- (UILabel *)rq_windLab {
    if (!_rq_windLab) {
        _rq_windLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rq_windLab.layer.borderWidth = 0.5;
        _rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    }
    return _rq_windLab;
}

- (UILabel *)rq_equalLab {
    if (!_rq_equalLab) {
        _rq_equalLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rq_equalLab.layer.borderWidth = 0.5;
        _rq_equalLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    }
    return _rq_equalLab;
}

- (UILabel *)rq_loseLab {
    if (!_rq_loseLab) {
        _rq_loseLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rq_loseLab.layer.borderWidth = 0.5;
        _rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    }
    return _rq_loseLab;
}


@end
