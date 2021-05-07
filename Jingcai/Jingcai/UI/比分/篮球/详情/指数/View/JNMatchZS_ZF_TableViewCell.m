//
//  JNMatchZS_ZF_TableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JNMatchZS_ZF_TableViewCell.h"

@implementation JNMatchZS_ZF_TableViewCell

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
        make.width.mas_equalTo(AUTO(70));
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [bgView addSubview:self.equalLab];
    [self.equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.right.equalTo(self.loseLab.mas_left);
        make.width.mas_equalTo(AUTO(70));
        make.height.mas_equalTo(AUTO(22));
    }];
    
    [bgView addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.right.equalTo(self.equalLab.mas_left);
        make.width.mas_equalTo(AUTO(70));
        make.height.mas_equalTo(AUTO(22));
    }];
    

    
    [bgView addSubview:self.j_loseLab];
     [self.j_loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(bgView);
         make.right.equalTo(bgView).offset(AUTO(-30));
         make.width.mas_equalTo(AUTO(70));
         make.height.mas_equalTo(AUTO(22));
     }];
     
     [bgView addSubview:self.j_equalLab];
     [self.j_equalLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(bgView);
         make.right.equalTo(self.j_loseLab.mas_left);
         make.width.mas_equalTo(AUTO(70));
         make.height.mas_equalTo(AUTO(22));
     }];
     
     [bgView addSubview:self.j_windLab];
     [self.j_windLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(bgView);
         make.right.equalTo(self.j_equalLab.mas_left);
         make.width.mas_equalTo(AUTO(70));
         make.height.mas_equalTo(AUTO(22));
     }];
    

    [bgView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
}


- (void)setBasketballModel:(JNMatchZS_PLInfoModel *)basketballModel {
    _basketballModel = basketballModel;
    self.companyLab.text = basketballModel.company_name;
    self.windLab.text = basketballModel.start_win;//start_win
    self.equalLab.text = basketballModel.start_equal;//start_equal
    self.loseLab.text = basketballModel.start_lose;//start_lose
    self.j_windLab.text = basketballModel.win;
    self.j_equalLab.text = basketballModel.equal;
    self.j_loseLab.text = basketballModel.lose;
    self.j_windLab.textColor = basketballModel.win_color.length>0?[UIColor colorWithHexString:basketballModel.win_color]:COLOR_333333;
    self.j_loseLab.textColor = basketballModel.lose_color.length>0?[UIColor colorWithHexString:basketballModel.lose_color]:COLOR_333333;
    self.j_equalLab.textColor = basketballModel.equal_color.length>0?[UIColor colorWithHexString:basketballModel.equal_color]:COLOR_333333;
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
