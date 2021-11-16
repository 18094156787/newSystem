//
//  JCPlaneDetailMatch_RQCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPlaneDetailMatch_RQCell.h"
#import "JCLayer.h"
@implementation JCPlaneDetailMatch_RQCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.offset(AUTO(10));
    }];
    
    [self.contentView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.height.mas_equalTo(AUTO(16));
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
    

    
    [self.contentView addSubview:self.homeView];
    [self.homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vsLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(56));
        make.right.equalTo(self.mas_centerX).offset(AUTO(-5));
        make.width.mas_equalTo(AUTO(138));
    }];
    
    [self.homeView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.mas_equalTo(AUTO(28));
    }];
    
    [self.homeView addSubview:self.no_rq_windLab];
    [self.no_rq_windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeNameLab.mas_bottom);
        make.left.right.bottom.offset(0);
    }];
    
    [self.contentView addSubview:self.awayView];
    [self.awayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeView);
        make.height.mas_equalTo(AUTO(56));
        make.left.equalTo(self.mas_centerX).offset(AUTO(5));
        make.width.mas_equalTo(AUTO(138));
    }];
    
    
    [self.awayView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.mas_equalTo(AUTO(28));
    }];
    
    [self.awayView addSubview:self.no_rq_loseLab];
    [self.no_rq_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.awayNameLab.mas_bottom);
        make.left.right.bottom.offset(0);
    }];
    

    

    
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

    self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
    self.typeLab.layer.borderColor = COLOR_002868.CGColor;
    self.typeLab.textColor = COLOR_002868;
    self.typeLab.hidden = matchModel.classfly_desc.length>0?NO:YES;
    self.typeLab.text = matchModel.classfly_desc;


    
    self.no_rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.no_rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    

    NSString *home = [NSString stringWithFormat:@"%.2f",[matchModel.no_rq_odds.equal floatValue]*-1];
    NSString *away = [NSString stringWithFormat:@"%.2f",[matchModel.no_rq_odds.equal floatValue]];
    self.no_rq_windLab.text = [NSString stringWithFormat:@"%@  %@",home,matchModel.no_rq_odds.win];
    self.no_rq_loseLab.text = [NSString stringWithFormat:@"%@ %@",away,matchModel.no_rq_odds.lose];
    if (matchModel.classfly==102) {
        self.no_rq_windLab.text = [NSString stringWithFormat:@"%@  %@",away,matchModel.no_rq_odds.lose];
        self.no_rq_loseLab.text = [NSString stringWithFormat:@"%@ %@",home,matchModel.no_rq_odds.win];
    }
    [self layoutIfNeeded];
    
    [JCLayer setupView:self.homeNameLab corners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadius:5 borderWith:1 borderColor:COLOR_E4E4E4];
    [JCLayer setupView:self.awayNameLab corners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadius:5 borderWith:1 borderColor:COLOR_E4E4E4];

    
    
    [JCLayer setupView:self.no_rq_loseLab corners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadius:5 borderWith:1 borderColor:COLOR_E4E4E4];
    [JCLayer setupView:self.no_rq_windLab corners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadius:5 borderWith:1 borderColor:COLOR_E4E4E4];
    self.no_rq_windLab.backgroundColor = JCWhiteColor;
    self.no_rq_loseLab.backgroundColor = JCWhiteColor;
    self.no_rq_windLab.textColor = COLOR_2F2F2F;
    self.no_rq_loseLab.textColor = COLOR_2F2F2F;
    if (matchModel.classfly==2) {
        self.homeLab.text = matchModel.home_name;
        self.awayLab.text = matchModel.away_name;
        self.homeNameLab.text = matchModel.home_name;
        self.awayNameLab.text = matchModel.away_name;
        switch ([matchModel.spf intValue]) {
            case 1:
            {
    //            self.no_rq_loseLab.layer.borderColor = JCBaseColor.CGColor;
                self.no_rq_windLab.textColor = JCBaseColor;
                self.no_rq_windLab.backgroundColor = UIColorFromRGB(0XFEEAEA);
                [JCLayer setupView:self.no_rq_windLab corners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadius:5 borderWith:1 borderColor:JCBaseColor];
            }
                break;

            case 3:
            {
                self.no_rq_loseLab.backgroundColor = UIColorFromRGB(0XFEEAEA);
                self.no_rq_loseLab.textColor = JCBaseColor;
    //            self.no_rq_windLab.layer.borderColor = JCBaseColor.CGColor;
                [JCLayer setupView:self.no_rq_loseLab corners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadius:5 borderWith:1 borderColor:JCBaseColor];
            }
                break;

                
            default:
                break;
        }
    }else{
//        matchModel.classfly==102
        self.homeLab.text = matchModel.away_name;
        self.awayLab.text = matchModel.home_name;
        self.homeNameLab.text = matchModel.away_name;
        self.awayNameLab.text = matchModel.home_name;
        switch ([matchModel.spf intValue]) {
            case 3:
            {
    //            self.no_rq_loseLab.layer.borderColor = JCBaseColor.CGColor;
                self.no_rq_windLab.textColor = JCBaseColor;
                self.no_rq_windLab.backgroundColor = UIColorFromRGB(0XFEEAEA);
                [JCLayer setupView:self.no_rq_windLab corners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadius:5 borderWith:1 borderColor:JCBaseColor];
            }
                break;

            case 1:
            {
                self.no_rq_loseLab.backgroundColor = UIColorFromRGB(0XFEEAEA);
                self.no_rq_loseLab.textColor = JCBaseColor;
    //            self.no_rq_windLab.layer.borderColor = JCBaseColor.CGColor;
                [JCLayer setupView:self.no_rq_loseLab corners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadius:5 borderWith:1 borderColor:JCBaseColor];
            }
                break;

                
            default:
                break;
        }
        
    }


    

}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (KKPaddingLabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _typeLab.layer.borderColor = COLOR_002868.CGColor;
        _typeLab.layer.borderWidth = 1;
        _typeLab.layer.cornerRadius = AUTO(8);
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
    }
    
    return _homeView;
}

- (UIView *)awayView {
    if (!_awayView) {
        _awayView = [UIView new];
    }
    
    return _awayView;
}


- (UILabel *)no_rq_windLab {
    if (!_no_rq_windLab) {
        _no_rq_windLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _no_rq_windLab.layer.borderWidth = 0.5;
//        _no_rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;
//        _no_rq_windLab.layer.masksToBounds = YES;

    }
    return _no_rq_windLab;
}

- (UILabel *)no_rq_equalLab {
    if (!_no_rq_equalLab) {
        _no_rq_equalLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F2F2F2 andTextAlignment:NSTextAlignmentCenter];
//        _no_rq_equalLab.layer.borderWidth = 0.5;
//        _no_rq_equalLab.layer.borderColor = COLOR_E4E4E4.CGColor;
//        _no_rq_equalLab.layer.masksToBounds = YES;
    }
    return _no_rq_equalLab;
}

- (UILabel *)no_rq_loseLab {
    if (!_no_rq_loseLab) {
        _no_rq_loseLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _no_rq_loseLab.layer.borderWidth = 0.5;
//        _no_rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
//        _no_rq_loseLab.layer.masksToBounds = YES;
    }
    return _no_rq_loseLab;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayNameLab;
}

@end
