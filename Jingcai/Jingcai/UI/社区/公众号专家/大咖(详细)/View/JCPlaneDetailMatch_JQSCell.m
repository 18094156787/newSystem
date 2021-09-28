//
//  JCPlaneDetailMatch_JQSCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailMatch_JQSCell.h"

@implementation JCPlaneDetailMatch_JQSCell

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
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.top.equalTo(self.vsLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(30));
    }];
    

    
    
    [self.homeView addSubview:self.no_rq_windLab];
    [self.no_rq_windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.homeView addSubview:self.no_rq_equalLab];
    [self.no_rq_equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.homeView addSubview:self.no_rq_loseLab];
    [self.no_rq_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(1));
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    

    [homeArray addObject:self.no_rq_windLab];
    [homeArray addObject:self.no_rq_equalLab];
    [homeArray addObject:self.no_rq_loseLab];
    [homeArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:1 tailSpacing:1];

    
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
     }else if(matchModel.classfly==2||matchModel.classfly==102){

         self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
         self.typeLab.layer.borderColor = COLOR_002868.CGColor;
         self.typeLab.textColor = COLOR_002868;
     }else if(matchModel.classfly==3||matchModel.classfly==103){
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
//         self.typeLab.text = [NSString stringWithFormat:@"  %@  ",matchModel.name];
         self.typeLab.backgroundColor = [COLOR_1B1B1B colorWithAlphaComponent:0.1];
         self.typeLab.layer.borderColor = COLOR_1B1B1B.CGColor;
         self.typeLab.textColor = COLOR_1B1B1B;
     }
    self.typeLab.hidden = matchModel.classfly_desc.length>0?NO:YES;
    self.typeLab.text = matchModel.classfly_desc;
    self.homeLab.text = matchModel.home_name;
    self.awayLab.text = matchModel.away_name;
    


    


    
    if (matchModel.classfly==1) {
        self.no_rq_equalLab.backgroundColor = JCWhiteColor;
        self.no_rq_windLab.text = [NSString stringWithFormat:@"主胜 %@",matchModel.no_rq_odds.win];
        self.no_rq_equalLab.text = [NSString stringWithFormat:@"平 %@",matchModel.no_rq_odds.equal];
        self.no_rq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",matchModel.no_rq_odds.lose];
    }
    if (matchModel.classfly==2) {
        self.no_rq_windLab.text = [NSString stringWithFormat:@"主胜 %@",matchModel.no_rq_odds.win];
        self.no_rq_equalLab.text = [NSString stringWithFormat:@"指数 %@",matchModel.no_rq_odds.equal];
        self.no_rq_loseLab.text = [NSString stringWithFormat:@"客胜 %@",matchModel.no_rq_odds.lose];
    }
    if (matchModel.classfly==3) {
        self.no_rq_windLab.text = [NSString stringWithFormat:@"高 %@",matchModel.no_rq_odds.win];
        self.no_rq_equalLab.text = [NSString stringWithFormat:@"指数 %@",matchModel.no_rq_odds.equal];
        self.no_rq_loseLab.text = [NSString stringWithFormat:@"低 %@",matchModel.no_rq_odds.lose];
    }

    
    self.no_rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.no_rq_equalLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.no_rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
    
    
    switch ([matchModel.spf intValue]) {
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

            
        default:
            break;
    }
    
    if (matchModel.classfly==102||matchModel.classfly==103) {
        self.no_rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.no_rq_equalLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.no_rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        self.homeLab.text = matchModel.away_name;
        self.awayLab.text = matchModel.home_name;

        if (matchModel.classfly==102) {
            self.no_rq_windLab.text = [NSString stringWithFormat:@"客胜 %@",matchModel.no_rq_odds.lose];
            self.no_rq_equalLab.text = [NSString stringWithFormat:@"指数 %@",matchModel.no_rq_odds.equal];
            self.no_rq_loseLab.text = [NSString stringWithFormat:@"主胜 %@",matchModel.no_rq_odds.win];
            switch ([matchModel.spf intValue]) {
                case 1:
                {
                    self.no_rq_loseLab.layer.borderColor = JCBaseColor.CGColor;
                }
                    break;
                case 2:
                {
                    self.no_rq_equalLab.layer.borderColor = JCBaseColor.CGColor;
                }
                    break;
                case 3:
                {
                    self.no_rq_windLab.layer.borderColor = JCBaseColor.CGColor;
                }
                    break;
                case 4:

                    
                default:
                    break;
            }
        }
        if (matchModel.classfly==103) {
            self.no_rq_windLab.text = [NSString stringWithFormat:@"大分 %@",matchModel.no_rq_odds.win];
            self.no_rq_equalLab.text = [NSString stringWithFormat:@"指数 %@",matchModel.no_rq_odds.equal];
            self.no_rq_loseLab.text = [NSString stringWithFormat:@"小分 %@",matchModel.no_rq_odds.lose];
            switch ([matchModel.spf intValue]) {
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

                    
                default:
                    break;
            }
        }
        

    }

    

}

//- (void)setupView:(UIView *)view corners:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)width borderColor:(UIColor *)color {
//    CAShapeLayer *maskLayer  = [CAShapeLayer layer];
//    maskLayer.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
//    CAShapeLayer *borderLayer = [CAShapeLayer layer];
//    borderLayer.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
//    borderLayer.lineWidth = width;
//    borderLayer.strokeColor = color.CGColor;
//    borderLayer.fillColor = [UIColor clearColor].CGColor;
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corner  cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
//    maskLayer.path = bezierPath.CGPath;
//    borderLayer.path = bezierPath.CGPath;
//    [view.layer insertSublayer:borderLayer atIndex:0];
//    [view.layer addSublayer:maskLayer];
//}

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



- (UILabel *)no_rq_windLab {
    if (!_no_rq_windLab) {
        _no_rq_windLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rq_windLab.layer.borderWidth = 0.5;
        _no_rq_windLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _no_rq_windLab.layer.masksToBounds = YES;

    }
    return _no_rq_windLab;
}

- (UILabel *)no_rq_equalLab {
    if (!_no_rq_equalLab) {
        _no_rq_equalLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F2F2F2 andTextAlignment:NSTextAlignmentCenter];
        _no_rq_equalLab.layer.borderWidth = 0.5;
        _no_rq_equalLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _no_rq_equalLab.layer.masksToBounds = YES;
    }
    return _no_rq_equalLab;
}

- (UILabel *)no_rq_loseLab {
    if (!_no_rq_loseLab) {
        _no_rq_loseLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rq_loseLab.layer.borderWidth = 0.5;
        _no_rq_loseLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _no_rq_loseLab.layer.masksToBounds = YES;
    }
    return _no_rq_loseLab;
}


@end
