//
//  JCYCMyYcRecordCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCMyYcRecordCell.h"

@implementation JCYCMyYcRecordCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(15), AUTO(15), 0, AUTO(15)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.mas_equalTo(AUTO(20));
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(15));
    }];
    

    
    [bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-25));
        make.top.offset(AUTO(45));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(23)));
    }];
    
    [bgView addSubview:self.codeLab];
    [self.codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.priceLab);
        make.top.equalTo(self.priceLab.mas_bottom).offset(AUTO(12));
//        make.height.mas_equalTo(AUTO(15));
    }];

    [bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self.priceLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(52), AUTO(18)));
    }];

}


- (void)setModel:(JCMyZhanJiModel *)model {
    self.titleLab.text = [NSString stringWithFormat:@"第 %@ 期",model.rand_id];
    self.timeLab.text = [NSString stringWithFormat:@"%@-%@",model.start_time,model.end_time];
    self.infoLab.text = @"5连胜 | 命中10场";
//    float price = [model.total floatValue]/100.0f;
    self.priceLab.text = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%@元",model.total]];
    if (model.lianhong.length>0&&model.mingzhong.length>0) {
        self.infoLab.text = [NSString stringWithFormat:@"%@连胜 | 命中%@场",model.lianhong,model.mingzhong];
    }else if (model.lianhong.length>0){
        self.infoLab.text = [NSString stringWithFormat:@"%@连胜",model.lianhong];
    }else if (model.mingzhong.length>0){
        self.infoLab.text = [NSString stringWithFormat:@"命中%@场",model.mingzhong];
    }
    self.codeLab.text = [NSString stringWithFormat:@"验证码: %@",model.code];
//    self.contentLab.text = model.use_type;
//    self.contentLab.backgroundColor = COLOR_C1C1C1;//COLOR_FFBC3B
    if ([model.use intValue]==1) {
        self.contentLab.text = @"已领取";
        self.contentLab.backgroundColor = COLOR_C1C1C1;
    }else {
        self.contentLab.backgroundColor = COLOR_FF8D4D;
        self.contentLab.text = @"领取奖励";
        
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}


- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}


- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:3 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _priceLab.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:AUTO(22)];
    }
    return _priceLab;;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        [_contentLab hg_setCornerOnBottomWithRadius:AUTO(4)];
    }
    return _contentLab;
}

- (UILabel *)codeLab {
    if (!_codeLab) {
        _codeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _codeLab;
}

@end
