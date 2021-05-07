//
//  JCParticipateJingCaSuccessCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCParticipateJingCaSuccessCell.h"

@implementation JCParticipateJingCaSuccessCell

- (void)initViews {
//    self.contentView.backgroundColor = COLOR_F8F8F8;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F8F8F8;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
    }];
    
    [bgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.width.mas_equalTo(AUTO(50));
    }];
    
    [bgView addSubview:self.masterNameLab];
    [self.masterNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.right.equalTo(self.scoreLab.mas_left);
        make.height.mas_equalTo(AUTO(40));
        make.left.offset(0);
    }];
    
    [bgView addSubview:self.customerNameLab];
    [self.customerNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.left.equalTo(self.scoreLab.mas_right);
        make.height.mas_equalTo(AUTO(40));
        make.right.offset(0);
    }];
    
    [bgView addSubview:self.predicateLab];
    [self.predicateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.masterNameLab.mas_bottom).offset(AUTO(0));
        make.left.offset(0);
        make.right.equalTo(bgView.mas_centerX);
    }];
    
    [bgView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.masterNameLab.mas_bottom).offset(AUTO(0));
        make.right.offset(0);
        make.left.equalTo(bgView.mas_centerX);
    }];
    
//    [bgView addSubview:self.infoLab];
//    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(10));
//        make.right.offset(0);
//        make.left.equalTo(bgView.mas_centerX);
//    }];
    
  
}


- (void)setMathInfoModel:(JCJingCaiResultInfoMatchModel *)mathInfoModel {
    _mathInfoModel = mathInfoModel;
    
    NSString *nameString = [NSString stringWithFormat:@"%@ | %@",mathInfoModel.match_info.match_name,mathInfoModel.match_info.event_name];
    NSMutableAttributedString *nameAttrString = [[NSMutableAttributedString alloc] initWithString:nameString];
    NSRange nameRange = [nameString rangeOfString:mathInfoModel.match_info.event_name];
    [nameAttrString addAttribute:NSForegroundColorAttributeName value:COLOR_4A90E2 range:nameRange];
    self.titleLab.attributedText = nameAttrString;
    

    self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",mathInfoModel.match_info.full_home_score,mathInfoModel.match_info.full_away_score];
    self.masterNameLab.text = mathInfoModel.match_info.homeName;
    self.customerNameLab.text = mathInfoModel.match_info.awayName;
    self.predicateLab.text = [NSString stringWithFormat:@"预测：%@",mathInfoModel.spf_type];
    
    if (mathInfoModel.spfresult_type.length>0) {
        NSString *string = [NSString stringWithFormat:@"结果：%@",mathInfoModel.spfresult_type];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
        NSRange range = [string rangeOfString:mathInfoModel.spfresult_type];
        
         self.resultLab.text = [NSString stringWithFormat:@"结果：%@",mathInfoModel.spfresult_type];
        if ([mathInfoModel.spf_type isEqualToString:mathInfoModel.spfresult_type]&&mathInfoModel.spfresult_type) {
            [attrString addAttribute:NSForegroundColorAttributeName value:COLOR_EA2525 range:range];
        }else{
            [attrString addAttribute:NSForegroundColorAttributeName value:COLOR_6CC40C range:range];
        }
        self.resultLab.attributedText = attrString;
    }else{
        self.resultLab.textColor = COLOR_999999;
        self.resultLab.text = @"";
    }


}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

- (UILabel *)masterNameLab {
    if (!_masterNameLab) {
        _masterNameLab = [UILabel labelTitle:@"" andFont:AUTO(13) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _masterNameLab.numberOfLines = 2;
    }
    return _masterNameLab;
}

- (UILabel *)customerNameLab {
    if (!_customerNameLab) {
        _customerNameLab = [UILabel labelTitle:@"" andFont:AUTO(13) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _customerNameLab.numberOfLines = 2;
    }
    return _customerNameLab;
}

- (UILabel *)predicateLab {
    if (!_predicateLab) {
        _predicateLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _predicateLab;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resultLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

@end
