//
//  JNBaksetBallMatchZS_ZSDetailInfoHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JNBaksetBallMatchZS_ZSDetailInfoHeadView.h"

@implementation JNBaksetBallMatchZS_ZSDetailInfoHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    [self addSubview:self.companyLab];
    [self.companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.mas_equalTo(AUTO(90));
    }];
    
    [self addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.companyLab.mas_right);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.windLab.mas_right);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.equalLab.mas_right);
        make.width.mas_equalTo(AUTO(65));
    }];
    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.loseLab.mas_right);
        make.right.offset(0);
    }];


}

- (void)setType:(NSInteger)type {
    _type = type;
    if (type==3) {
        self.windLab.text = @"客胜";
        self.loseLab.text = @"主胜";
        [self.windLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(AUTO(100));
        }];
        

        [self.equalLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
        
        [self.loseLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(AUTO(100));
        }];
    }
}



- (UILabel *)companyLab {
    if (!_companyLab) {
        _companyLab = [UILabel initWithTitle:@"公司" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _companyLab;
}

- (UILabel *)windLab {
    if (!_windLab) {
        _windLab = [UILabel initWithTitle:@"主胜" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab = [UILabel initWithTitle:@"平局" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalLab;
}

- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"客胜" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"更新时间" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}
@end
