//
//  JCPlaneDetailMatch_CustomCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailMatch_CustomCell.h"

@implementation JCPlaneDetailMatch_CustomCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.offset(AUTO(10));
    }];
    
//    [self.contentView addSubview:self.typeLab];
//    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(AUTO(-10));
//        make.centerY.equalTo(self.titleLab);
//    }];
    
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
    

    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vsLab.mas_bottom).offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(28)));
    }];
    
    [self.contentView addSubview:self.tuiJianLab];
    [self.tuiJianLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.vsLab.mas_bottom).offset(AUTO(10));
        make.left.equalTo(self.nameLab.mas_right).offset(AUTO(11));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(28));
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
    if ([matchModel.column_id integerValue]==2) {
        self.homeLab.text = matchModel.away_name;
        self.awayLab.text = matchModel.home_name;
    }

    self.nameLab.text = matchModel.classfly_desc;
    self.tuiJianLab.text = [NSString stringWithFormat:@"推荐：%@",matchModel.spf_name];
    

}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
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


- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F2F2F2 andTextAlignment:NSTextAlignmentCenter];
        _nameLab.layer.borderWidth = 0.5;
        _nameLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _nameLab.layer.cornerRadius = 5;
        _nameLab.layer.masksToBounds = YES;
        
    }
    return _nameLab;
}

- (UILabel *)tuiJianLab {
    if (!_tuiJianLab) {
        _tuiJianLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:UIColorFromRGB(0xFEEAEA) andTextAlignment:NSTextAlignmentCenter];
        _tuiJianLab.layer.borderWidth = 0.5;
        _tuiJianLab.layer.borderColor = JCBaseColor.CGColor;
        _tuiJianLab.layer.cornerRadius = 5;
        _tuiJianLab.layer.masksToBounds = YES;

    }
    return _tuiJianLab;
}


@end
