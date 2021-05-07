//
//  JCPlaneDetailMatchCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailMatchCell.h"

@implementation JCPlaneDetailMatchCell



- (void)initViews {
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(8));
        make.bottom.offset(AUTO(-10));
    }];

    self.bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.bgView.layer.cornerRadius = 4;
    self.bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.12].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0,0);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 5;
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self.bgView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-12));
        make.centerY.equalTo(self.titleLab);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    
    [self.bgView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.width.mas_lessThanOrEqualTo(AUTO(95));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
    }];

    
    [self.bgView addSubview:self.vsLab];
    [self.vsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(20)));
        make.left.equalTo(self.homeNameLab.mas_right);
        make.centerY.equalTo(self.homeNameLab);
    }];
    

    
    [self.bgView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.vsLab.mas_right);
        make.width.mas_lessThanOrEqualTo(AUTO(95));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.bgView addSubview:self.typeImgView];
    
    [self.typeImgView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsZero);
        make.right.equalTo(self.typeImgView).offset(AUTO(-7));
        make.centerY.equalTo(self.typeImgView);
    }];
    
    [self.typeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-12));
        make.centerY.equalTo(self.homeNameLab);
//        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(24)));
        make.height.mas_equalTo(AUTO(24));
        make.left.equalTo(self.resultLab).offset(AUTO(-12));
    }];

}


- (void)setModel:(JCWVerTjInfoMatchBall *)model {
    _model = model;
    NSString *matchTime = [NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[model.match_time doubleValue]];
    NSString *title = NonNil(model.event_name);
    if (model.group_num_new.length>0||model.round_num_two.length>0) {
        title = [title stringByAppendingFormat:@" %@%@",NonNil(model.group_num_new),NonNil(model.round_num_two)];
    }
    if (matchTime.length>0) {
        title = [title stringByAppendingFormat:@" %@",NonNil(matchTime)];
    }
    if (model.round_num_one.length>0) {
        title = [title stringByAppendingFormat:@" | %@",NonNil(model.round_num_one)];
    }
//    if (model.issue_num.length>0) {
//        title = [NSString stringWithFormat:@"%@ %@ %@",NonNil(model.event_name),NonNil(model.issue_num),NonNil(matchTime)];
//    }


    if (model.leagueName.length>0) {
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:model.leagueName];
        [attrTitle addAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:range];
        self.titleLab.attributedText = attrTitle;
    }else{
        self.titleLab.text = title;
    }
    
    if (model.classfly==1) {
         self.tagLab.backgroundColor = [COLOR_1B1B1B colorWithAlphaComponent:0.1];
         self.tagLab.layer.borderColor = COLOR_1B1B1B.CGColor;
         self.tagLab.textColor = COLOR_1B1B1B;
     }else if(model.classfly==2||model.classfly==102){

         self.tagLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
         self.tagLab.layer.borderColor = COLOR_002868.CGColor;
         self.tagLab.textColor = COLOR_002868;
     }else if(model.classfly==3||model.classfly==103){
         self.tagLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
         self.tagLab.layer.borderColor = COLOR_30B27A.CGColor;
         self.tagLab.textColor = COLOR_30B27A;
     }
     else if(model.classfly==4||model.classfly==101){
         self.tagLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
         self.tagLab.layer.borderColor = JCBaseColor.CGColor;
         self.tagLab.textColor = JCBaseColor;
     }
     else{
//         self.typeLab.text = [NSString stringWithFormat:@"  %@  ",matchModel.name];
         self.tagLab.backgroundColor = [COLOR_1B1B1B colorWithAlphaComponent:0.1];
         self.tagLab.layer.borderColor = COLOR_1B1B1B.CGColor;
         self.tagLab.textColor = COLOR_1B1B1B;
     }
    self.tagLab.text = [NSString stringWithFormat:@"  %@  ",model.classfly_desc];
    self.tagLab.hidden = model.classfly_desc.length==0?YES:NO;
    self.homeNameLab.text = model.home_name;
    self.awayNameLab.text = model.away_name;
    if (model.classfly==101||model.classfly==102||model.classfly==103||[model.column_id intValue]==2) {
        self.homeNameLab.text = model.away_name;
        self.awayNameLab.text = model.home_name;
    }

    self.typeImgView.hidden = model.spf_name.length==0?YES:NO;
    self.resultLab.text = model.spf_name;
}


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _tagLab.layer.borderWidth = 0.5;
        _tagLab.layer.cornerRadius = AUTO(8);
        _tagLab.layer.masksToBounds = YES;
    }
    return _tagLab;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
        _homeNameLab.numberOfLines= 0;
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _awayNameLab.numberOfLines= 0;
    }
    return _awayNameLab;
}

- (UILabel *)vsLab {
    if (!_vsLab) {
        _vsLab = [UILabel initWithTitle:@"VS" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _vsLab;
}
- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        [_resultLab hg_setCornerOnLeftWithRadius:AUTO(16)];
    }
    return _resultLab;
}

- (UIImageView *)typeImgView {
    if (!_typeImgView) {
        _typeImgView = [UIImageView new];
        _typeImgView.image = JCIMAGE(@"Ic_gzh_jg");
    }
    return _typeImgView;
}

@end
