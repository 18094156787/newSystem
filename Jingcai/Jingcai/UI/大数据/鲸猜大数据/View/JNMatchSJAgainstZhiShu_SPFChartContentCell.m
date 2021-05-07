//
//  JNMatchSJAgainstZhiShu_SPFChartContentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstZhiShu_SPFChartContentCell.h"

@implementation JNMatchSJAgainstZhiShu_SPFChartContentCell

- (void)initViews {
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    float width = (SCREEN_WIDTH-AUTO(30))/6.0f;
    [bgView addSubview:self.labelOne];
    [bgView addSubview:self.labelTwo];
    [bgView addSubview:self.labelThree];
    [bgView addSubview:self.labelFour];
    [bgView addSubview:self.labelFive];
    [bgView addSubview:self.labelSix];
    
    [self.labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.mas_equalTo(width-AUTO(3));
    }];
    
    [self.labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelOne.mas_right);
        make.width.mas_equalTo(width-AUTO(3));
    }];
    
    [self.labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelTwo.mas_right);
        make.width.mas_equalTo(width-AUTO(3));
    }];
    
    [self.labelFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelThree.mas_right);
        make.width.mas_equalTo(width-AUTO(3));
    }];
    
    [self.labelFive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelFour.mas_right);
        make.width.mas_equalTo(width-AUTO(3));
    }];
    
    [self.labelSix mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelFive.mas_right);
        make.right.offset(0);

    }];

}

- (void)setRow:(NSInteger)row {
    _row = row;
    if (row==0) {
        self.labelOne.backgroundColor = COLOR_F4F6F9;
        self.labelTwo.backgroundColor = COLOR_F4F6F9;
        self.labelThree.backgroundColor = COLOR_F4F6F9;
        self.labelFour.backgroundColor = COLOR_F4F6F9;
        self.labelFive.backgroundColor = COLOR_F4F6F9;
        self.labelSix.backgroundColor = COLOR_F4F6F9;
        self.labelOne.textColor = COLOR_333333;
        self.labelTwo.textColor = COLOR_333333;
        self.labelThree.textColor = COLOR_333333;
        self.labelFour.textColor = COLOR_333333;
        self.labelFive.textColor = COLOR_333333;
        self.labelSix.textColor = COLOR_333333;
    }else{
        self.labelOne.backgroundColor = COLOR_F3F3F3;
        self.labelTwo.backgroundColor = COLOR_F3F3F3;
        self.labelThree.backgroundColor = COLOR_F3F3F3;
        self.labelFour.backgroundColor = COLOR_F3F3F3;
        self.labelFive.backgroundColor = COLOR_F3F3F3;
        self.labelSix.backgroundColor = COLOR_F3F3F3;
        self.labelOne.textColor = COLOR_333333;
        self.labelTwo.textColor = COLOR_333333;
        self.labelThree.textColor = COLOR_333333;
        self.labelFour.textColor = COLOR_333333;
        self.labelFive.textColor = COLOR_333333;
        self.labelSix.textColor = COLOR_333333;
    }
}

- (void)setModel:(JCBigDataZhishuModel *)model {
    _model = model;
    self.labelOne.text = model.name;
    self.labelTwo.text = model.higt;
    self.labelThree.text = model.low;
    self.labelFour.text = model.average;
    self.labelFive.text = model.kl;
    self.labelSix.text = model.trend;

}

- (UILabel *)labelOne {
    if (!_labelOne) {
        _labelOne = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelOne.numberOfLines = 0;
        _labelOne.layer.borderColor = COLOR_DBDBDB.CGColor;
        _labelOne.layer.borderWidth = 0.5;
    }
    return _labelOne;
}

- (UILabel *)labelTwo {
    if (!_labelTwo) {
        _labelTwo = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelTwo.numberOfLines = 0;
        _labelTwo.layer.borderColor = COLOR_DBDBDB.CGColor;
        _labelTwo.layer.borderWidth = 0.5;
    }
    return _labelTwo;
}

- (UILabel *)labelThree {
    if (!_labelThree) {
        _labelThree = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelThree.numberOfLines = 0;
        _labelThree.layer.borderColor = COLOR_DBDBDB.CGColor;
        _labelThree.layer.borderWidth = 0.5;
    }
    return _labelThree;
}

- (UILabel *)labelFour {
    if (!_labelFour) {
        _labelFour = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelFour.numberOfLines = 0;
        _labelFour.layer.borderColor = COLOR_DBDBDB.CGColor;
        _labelFour.layer.borderWidth = 0.5;
    }
    return _labelFour;
}

- (UILabel *)labelFive {
    if (!_labelFive) {
        _labelFive = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelFive.numberOfLines = 0;
        _labelFive.layer.borderColor = COLOR_DBDBDB.CGColor;
        _labelFive.layer.borderWidth = 0.5;
    }
    return _labelFive;
}

- (UILabel *)labelSix {
    if (!_labelSix) {
        _labelSix = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelSix.numberOfLines = 0;
        _labelSix.layer.borderColor = COLOR_DBDBDB.CGColor;
        _labelSix.layer.borderWidth = 0.5;
    }
    return _labelSix;
}
@end
