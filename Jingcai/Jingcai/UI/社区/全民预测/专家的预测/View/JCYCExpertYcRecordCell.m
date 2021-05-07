//
//  JCYCExpertYcRecordCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCExpertYcRecordCell.h"

@implementation JCYCExpertYcRecordCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(15), AUTO(12), 0, AUTO(12)));
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
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [bgView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-25));
        make.centerY.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(23)));
    }];

//    [bgView addSubview:self.contentLab];
//    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.priceLab.mas_bottom).offset(AUTO(10));
//        make.centerX.equalTo(self.priceLab);
//    }];
    
    
//    [self data];
}

//- (void)data {
//    self.titleLab.text = @"第 8 期";
//    self.timeLab.text = @"2020/01/02-2020/01-09";
//
//    self.priceLab.text = @"3.35元";
//}

- (void)setModel:(JCMyZhanJiModel *)model {
    self.titleLab.text = [NSString stringWithFormat:@"第 %@ 期",model.rand_id];
    self.timeLab.text = [NSString stringWithFormat:@"%@-%@",model.start_time,model.end_time];
    self.infoLab.text = @"";
    float price = [model.total floatValue]/100.0f;
    self.priceLab.text = [NSString stringWithFormat:@"%@",[NSString stringWithFormat:@"%.2f元",price]];
    if (model.lianhong.length>0&&model.mingzhong.length>0) {
        self.infoLab.text = [NSString stringWithFormat:@"%@连胜 | 命中%@场",model.lianhong,model.mingzhong];
    }else if (model.lianhong.length>0){
        self.infoLab.text = [NSString stringWithFormat:@"%@连胜",model.lianhong];
    }else if (model.mingzhong.length>0){
        self.infoLab.text = [NSString stringWithFormat:@"命中%@场",model.mingzhong];
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
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _priceLab.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:AUTO(22)];
    }
    return _priceLab;;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"获得奖励" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _contentLab;
}

@end
