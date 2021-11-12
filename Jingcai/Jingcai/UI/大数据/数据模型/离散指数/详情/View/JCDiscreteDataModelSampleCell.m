//
//  JCDiscreteDataModelSampleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDiscreteDataModelSampleCell.h"

@implementation JCDiscreteDataModelSampleCell

- (void)initViews {
    UIView *topLineView = [UIView new];
    topLineView.backgroundColor = COLOR_E8E8E8;
    [self addSubview:topLineView];
    [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(1);
        make.top.offset(0);
    }];
    
    [self addSubview:self.compnayLab];
    [self.compnayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(0);
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self addSubview:self.chuTopLab];
    [self.chuTopLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-AUTO(1));
        make.left.equalTo(self.compnayLab.mas_right);
        make.width.mas_equalTo(AUTO(100));
    }];
    
    [self addSubview:self.chuBomLab];
    [self.chuBomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_centerY).offset(AUTO(1));
        make.left.equalTo(self.compnayLab.mas_right);
        make.width.mas_equalTo(AUTO(100));
    }];
    
    [self addSubview:self.resulToptLab];
    [self.resulToptLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-AUTO(1));
        make.left.equalTo(self.chuBomLab.mas_right);
        make.width.mas_equalTo(AUTO(100));
    }];
    
    [self addSubview:self.resultBomLab];
    [self.resultBomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_centerY).offset(AUTO(1));
        make.left.equalTo(self.chuBomLab.mas_right);
        make.width.mas_equalTo(AUTO(100));
    }];
    
    [self addSubview:self.rateTopLab];
    [self.rateTopLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-AUTO(1));
        make.left.equalTo(self.resulToptLab.mas_right);
        make.right.offset(0);
    }];
    
    [self addSubview:self.rateBomLab];
    [self.rateBomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_centerY).offset(AUTO(1));
        make.left.equalTo(self.resulToptLab.mas_right);
        make.right.offset(0);
    }];
    

}

- (void)data {
    self.compnayLab.text = @"机构名称";
    self.chuTopLab.text = @"3.40 3.40 3.40";
    self.chuBomLab.text = @"3.40 3.40 3.40";
    self.resulToptLab.text = @"3.40 3.40 3.40";
    self.resultBomLab.text = @"3.40 3.40 3.40";
    self.rateTopLab.text = @"93.50%";
    self.rateBomLab.text = @"93.50%";
}

- (UILabel *)compnayLab {
    if (!_compnayLab) {
        _compnayLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:UIColorFromRGB(0x606062) andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _compnayLab;
}

- (UILabel *)chuTopLab {
    if (!_chuTopLab) {
        _chuTopLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuTopLab;
}

- (UILabel *)chuBomLab {
    if (!_chuBomLab) {
        _chuBomLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _chuBomLab;
}

- (UILabel *)resulToptLab {
    if (!_resulToptLab) {
        _resulToptLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resulToptLab;
}

- (UILabel *)resultBomLab {
    if (!_resultBomLab) {
        _resultBomLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _resultBomLab;
}

- (UILabel *)rateTopLab {
    if (!_rateTopLab) {
        _rateTopLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rateTopLab;
}

- (UILabel *)rateBomLab {
    if (!_rateBomLab) {
        _rateBomLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rateBomLab;
}
@end
