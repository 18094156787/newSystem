//
//  JCTransactionDataModelDetailZhiShuItemCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailZhiShuItemCell.h"

@implementation JCTransactionDataModelDetailZhiShuItemCell

- (void)initViews {
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    float width = (SCREEN_WIDTH-AUTO(30))/4.0f;
    [bgView addSubview:self.labelOne];
    [bgView addSubview:self.labelTwo];
    [bgView addSubview:self.labelThree];
    [bgView addSubview:self.labelFour];

    [bgView addSubview:self.lineOne];
    [bgView addSubview:self.lineTwo];
    [bgView addSubview:self.lineThree];
    
    [self.labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.mas_equalTo(width-AUTO(5));
    }];
    
    [self.labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelOne.mas_right);
        make.width.mas_equalTo(width-AUTO(5));
    }];
    
    [self.labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelTwo.mas_right);
        make.width.mas_equalTo(width-AUTO(5));
    }];
    
    [self.labelFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelThree.mas_right);
        make.right.offset(0);
    }];

    [self.lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelOne.mas_right);
        make.width.mas_equalTo(1);
    }];
    
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelTwo.mas_right);
        make.width.mas_equalTo(1);
    }];
    
    [self.lineThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelThree.mas_right);
        make.width.mas_equalTo(1);
    }];

}

- (void)setRow:(NSInteger)row {
    _row = row;
    if (row==0) {
        
        
        self.labelOne.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        self.labelTwo.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        self.labelThree.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        self.labelFour.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        self.labelFive.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        self.labelSix.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        
        self.labelOne.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelTwo.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelThree.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelFour.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelFive.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelSix.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        
        self.lineOne.backgroundColor = JCWhiteColor;
        self.lineTwo.backgroundColor = JCWhiteColor;
        self.lineThree.backgroundColor = JCWhiteColor;

    }else{
        self.labelOne.font = [UIFont fontWithName:@"PingFangSC-Light" size:AUTO(12)];
        self.labelTwo.font = [UIFont fontWithName:@"PingFangSC-Light" size:AUTO(12)];
        self.labelThree.font = [UIFont fontWithName:@"PingFangSC-Light" size:AUTO(12)];
        self.labelFour.font = [UIFont fontWithName:@"PingFangSC-Light" size:AUTO(12)];
        self.labelFive.font = [UIFont fontWithName:@"PingFangSC-Light" size:AUTO(12)];
        self.labelSix.font = [UIFont fontWithName:@"PingFangSC-Light" size:AUTO(12)];
        
        UIColor *color = row%2==0?[JCBaseColor colorWithAlphaComponent:0.05]:JCWhiteColor;
        self.labelOne.backgroundColor = color;
        self.labelTwo.backgroundColor = color;
        self.labelThree.backgroundColor = color;
        self.labelFour.backgroundColor = color;
        self.labelFive.backgroundColor = color;
        self.labelSix.backgroundColor = color;
        

        
        self.lineOne.backgroundColor = COLOR_F0F0F0;
        self.lineTwo.backgroundColor = COLOR_F0F0F0;
        self.lineThree.backgroundColor = COLOR_F0F0F0;

    }


}
- (void)setModel:(JCBigDataAnalysisMatchModel *)model {
    _model = model;
    self.labelOne.text = [NSString stringWithFormat:@"%@\n%@",model.match_time,model.event_name];
    self.labelTwo.text = model.home_name;
    self.labelThree.text = [NSString stringWithFormat:@"%@:%@\n(%@:%@)",model.home_score,model.away_score,model.half_home_score,model.half_away_score];
    self.labelFour.text = model.away_name;

}



- (UILabel *)labelOne {
    if (!_labelOne) {
        _labelOne = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
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
        _labelFive = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelFive.numberOfLines = 0;
    }
    return _labelFive;
}

- (UILabel *)labelSix {
    if (!_labelSix) {
        _labelSix = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelSix.numberOfLines = 0;
    }
    return _labelSix;
}
- (UIView *)lineOne {
    if (!_lineOne) {
        _lineOne = [UIView new];
    }
    return _lineOne;
}

- (UIView *)lineTwo {
    if (!_lineTwo) {
        _lineTwo = [UIView new];
    }
    return _lineTwo;
}

- (UIView *)lineThree {
    if (!_lineThree) {
        _lineThree = [UIView new];
    }
    return _lineThree;
}
@end
