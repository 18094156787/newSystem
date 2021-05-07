//
//  JNMatchZS_OP_TableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_OP_TableViewCell.h"

@implementation JNMatchZS_OP_TableViewCell
- (void)initViews {
    self.contentView.backgroundColor= JCClearColor;
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
        make.bottom.offset(AUTO(-5));
    }];

    [bgView addSubview:self.companyLab];
    [self.companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(AUTO(80));
    }];
    
    [bgView addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.right.equalTo(bgView).offset(AUTO(-30));
        make.width.mas_equalTo(AUTO(65));
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [bgView addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.right.equalTo(self.loseLab.mas_left);
        make.width.mas_equalTo(AUTO(65));
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [bgView addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.right.equalTo(self.equalLab.mas_left);
        make.width.mas_equalTo(AUTO(65));
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [bgView addSubview:self.c_Lab];
    [self.c_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.right.equalTo(self.windLab.mas_left);
        make.left.equalTo(self.companyLab.mas_right);
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [bgView addSubview:self.j_loseLab];
     [self.j_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(bgView);
         make.right.equalTo(bgView).offset(AUTO(-30));
         make.width.mas_equalTo(AUTO(65));
         make.height.mas_equalTo(AUTO(22));
     }];
     
     [bgView addSubview:self.j_equalLab];
     [self.j_equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(bgView);
         make.right.equalTo(self.j_loseLab.mas_left);
         make.width.mas_equalTo(AUTO(65));
         make.height.mas_equalTo(AUTO(22));
     }];
     
     [bgView addSubview:self.j_windLab];
     [self.j_windLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(bgView);
         make.right.equalTo(self.j_equalLab.mas_left);
         make.width.mas_equalTo(AUTO(65));
         make.height.mas_equalTo(AUTO(22));
     }];
    
    [bgView addSubview:self.j_Lab];
    [self.j_Lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.right.equalTo(self.windLab.mas_left);
        make.left.equalTo(self.companyLab.mas_right);
        make.height.mas_equalTo(AUTO(22));
    }];

    [bgView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    self.companyLab.text = @"";
    self.windLab.text = @"-";//start_win
    self.equalLab.text = @"-";//start_equal
    self.loseLab.text = @"-";//start_lose
    self.j_windLab.text = @"-";
    self.j_equalLab.text = @"-";
    self.j_loseLab.text = @"-";
    self.windLab.textColor = COLOR_333333;
    self.equalLab.textColor = COLOR_333333;
    self.loseLab.textColor = COLOR_333333;
    self.j_windLab.textColor = COLOR_333333;
    self.j_equalLab.textColor = COLOR_333333;
    self.j_loseLab.textColor = COLOR_333333;
    if (dataArray.count==2) {
        JNMatchZS_PLInfoModel *model = dataArray.firstObject;
        JNMatchZS_PLInfoModel *cuModel;
        JNMatchZS_PLInfoModel *jiModel;
        if ([model.is_begin_odds integerValue]==1) {
            cuModel = dataArray.firstObject;
            jiModel = dataArray.lastObject;
        }else{
            cuModel = dataArray.lastObject;
            jiModel = dataArray.firstObject;
        }
        
        self.companyLab.text = [NSString stringWithFormat:@"%@",cuModel.company_name];
//        self.windLab.text = [NSString stringWithFormat:@"%@",cuModel.home_winner];
        self.windLab.text = [NSString stringWithFormat:@"%@",cuModel.home_winner];
        self.equalLab.text = [NSString stringWithFormat:@"%@",cuModel.draw];
        self.loseLab.text = [NSString stringWithFormat:@"%@",cuModel.away_winner];
        self.j_windLab.text = [NSString stringWithFormat:@"%@",jiModel.home_winner];
        self.j_equalLab.text = [NSString stringWithFormat:@"%@",jiModel.draw];
        self.j_loseLab.text = [NSString stringWithFormat:@"%@",jiModel.away_winner];
        
        if (self.isBasketBall) {
            self.windLab.text = [NSString stringWithFormat:@"%@",cuModel.away_winner];
            self.equalLab.text = [NSString stringWithFormat:@"%@",cuModel.draw];
            self.loseLab.text = [NSString stringWithFormat:@"%@",cuModel.home_winner];
            self.j_windLab.text = [NSString stringWithFormat:@"%@",jiModel.away_winner];
            self.j_equalLab.text = [NSString stringWithFormat:@"%@",jiModel.draw];
            self.j_loseLab.text = [NSString stringWithFormat:@"%@",jiModel.home_winner];
        }

        
        
        
        self.j_windLab.textColor = [cuModel.home_winner floatValue]>[jiModel.home_winner floatValue]?[UIColor colorWithHexString:@"#13AE13"]:[UIColor colorWithHexString:@"#C82525"];
        if ([cuModel.home_winner floatValue]==[jiModel.home_winner floatValue]) {
            self.j_windLab.textColor = COLOR_333333;
        }
        self.j_equalLab.textColor = [cuModel.draw floatValue]>[jiModel.draw floatValue]?[UIColor colorWithHexString:@"#13AE13"]:[UIColor colorWithHexString:@"#C82525"];
        if ([cuModel.draw floatValue]==[jiModel.draw floatValue]) {
            self.j_equalLab.textColor = COLOR_333333;
        }
        self.j_loseLab.textColor = [cuModel.away_winner floatValue]>[jiModel.away_winner floatValue]?[UIColor colorWithHexString:@"#13AE13"]:[UIColor colorWithHexString:@"#C82525"];
        if ([cuModel.away_winner floatValue]==[jiModel.away_winner floatValue]) {
            self.j_loseLab.textColor = COLOR_333333;
        }
        if (self.isBasketBall) {
            self.j_windLab.textColor = [jiModel.away_winner floatValue]>[cuModel.away_winner floatValue]?[UIColor colorWithHexString:@"#EF2F2F"]:[UIColor colorWithHexString:@"#30B27A"];
            if ([cuModel.away_winner floatValue]==[jiModel.away_winner floatValue]) {
                self.j_windLab.textColor = COLOR_333333;
            }
            self.j_equalLab.textColor = [jiModel.draw floatValue]>[cuModel.draw floatValue]?[UIColor colorWithHexString:@"#EF2F2F"]:[UIColor colorWithHexString:@"#30B27A"];
            if ([cuModel.draw floatValue]==[jiModel.draw floatValue]) {
                self.j_equalLab.textColor = COLOR_333333;
            }
            self.j_loseLab.textColor = [jiModel.home_winner floatValue]>[cuModel.home_winner floatValue]?[UIColor colorWithHexString:@"#EF2F2F"]:[UIColor colorWithHexString:@"#30B27A"];
            if ([cuModel.home_winner floatValue]==[jiModel.home_winner floatValue]) {
                self.j_loseLab.textColor = COLOR_333333;
            }
        }

        
    }
    if (dataArray.count==1) {
        JNMatchZS_PLInfoModel *model = dataArray.firstObject;
        JNMatchZS_PLInfoModel *cuModel;
        JNMatchZS_PLInfoModel *jiModel;
        if ([model.is_begin_odds integerValue]==1) {
            cuModel = dataArray.firstObject;

        }else{
            jiModel = dataArray.firstObject;
        }
        if (cuModel) {
            self.companyLab.text = cuModel.company_name;
            self.windLab.text = [NSString stringWithFormat:@"%@",cuModel.home_winner];
            self.equalLab.text = [NSString stringWithFormat:@"%@",cuModel.draw];
            self.loseLab.text = [NSString stringWithFormat:@"%@",cuModel.away_winner];
            self.j_windLab.text = @"-";
            self.j_equalLab.text = @"-";
            self.j_loseLab.text = @"-";
            
        }else{
            self.companyLab.text = jiModel.company_name;
            self.windLab.text = @"-";
            self.equalLab.text = @"-";
            self.loseLab.text = @"-";
            self.j_windLab.text = [NSString stringWithFormat:@"%@",jiModel.home_winner];
            self.j_equalLab.text = [NSString stringWithFormat:@"%@",jiModel.draw];
            self.j_loseLab.text = [NSString stringWithFormat:@"%@",jiModel.away_winner];
            
        }

    }
}

- (void)setModel:(JNMatchZS_PLInfoModel *)model {
    _model = model;
    self.companyLab.text = model.company_name;
    self.windLab.text = model.start_win;//start_win
    self.equalLab.text = model.start_equal;//start_equal
    self.loseLab.text = model.start_lose;//start_lose
    self.j_windLab.text = model.win;
    self.j_equalLab.text = model.equal;
    self.j_loseLab.text = model.lose;
    self.j_windLab.textColor = model.win_color.length>0?[UIColor colorWithHexString:model.win_color]:COLOR_333333;
    self.j_loseLab.textColor = model.lose_color.length>0?[UIColor colorWithHexString:model.lose_color]:COLOR_333333;
    self.j_equalLab.textColor = model.equal_color.length>0?[UIColor colorWithHexString:model.equal_color]:COLOR_333333;
//    _win_color    NSTaggedPointerString *    @""    0xbbeeb783b8b9409e
//    _lose_color    NSTaggedPointerString *    @""    0xbb8e8084880e609e
}


- (void)setBasketballModel:(JNMatchZS_PLInfoModel *)basketballModel {
    _basketballModel = basketballModel;
    self.companyLab.text = basketballModel.company_name;
    self.windLab.text = basketballModel.start_lose;//start_win
    self.equalLab.text = basketballModel.start_equal;//start_equal
    self.loseLab.text = basketballModel.start_win;//start_lose
    self.j_windLab.text = basketballModel.lose;
    self.j_equalLab.text = basketballModel.equal;
    self.j_loseLab.text = basketballModel.win;
    self.j_windLab.textColor = basketballModel.lose_color.length>0?[UIColor colorWithHexString:basketballModel.lose_color]:COLOR_333333;
    self.j_loseLab.textColor = basketballModel.win_color.length>0?[UIColor colorWithHexString:basketballModel.win_color]:COLOR_333333;
    self.j_equalLab.textColor = basketballModel.equal_color.length>0?[UIColor colorWithHexString:basketballModel.equal_color]:COLOR_333333;
}

- (void)setZfModel:(JNMatchZS_PLInfoModel *)zfModel {
    _zfModel = zfModel;
    self.companyLab.text = zfModel.company_name;
    self.windLab.text = zfModel.start_win;//start_win
    self.equalLab.text = zfModel.start_equal;//start_equal
    self.loseLab.text = zfModel.start_lose;//start_lose
    self.j_windLab.text = zfModel.win;
    self.j_equalLab.text = zfModel.equal;
    self.j_loseLab.text = zfModel.lose;
    self.j_windLab.textColor = zfModel.win_color.length>0?[UIColor colorWithHexString:zfModel.win_color]:COLOR_333333;
    self.j_loseLab.textColor = zfModel.lose_color.length>0?[UIColor colorWithHexString:zfModel.lose_color]:COLOR_333333;
    self.j_equalLab.textColor = zfModel.equal_color.length>0?[UIColor colorWithHexString:zfModel.equal_color]:COLOR_333333;
}


- (UILabel *)companyLab {
    if (!_companyLab) {
        _companyLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _companyLab;
}

- (UILabel *)windLab {
    if (!_windLab) {
        _windLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windLab;
}

- (UILabel *)equalLab {
    if (!_equalLab) {
        _equalLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalLab;
}


- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}

- (UILabel *)j_windLab {
    if (!_j_windLab) {
        _j_windLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _j_windLab;
}

- (UILabel *)j_equalLab {
    if (!_j_equalLab) {
        _j_equalLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _j_equalLab;
}


- (UILabel *)j_loseLab {
    if (!_j_loseLab) {
        _j_loseLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _j_loseLab;
}

- (UILabel *)c_Lab {
    if (!_c_Lab) {
        _c_Lab = [UILabel initWithTitle:@"初" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _c_Lab;
}

- (UILabel *)j_Lab {
    if (!_j_Lab) {
        _j_Lab = [UILabel initWithTitle:@"即" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _j_Lab;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"zhishu_back");
    }
    return _indicateImgView;
}

@end
