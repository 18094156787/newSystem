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
    
    float width = (SCREEN_WIDTH-AUTO(30))/7.0f;
    width = width+5;
    [bgView addSubview:self.labelOne];
    [bgView addSubview:self.labelTwo];
    [bgView addSubview:self.labelThree];
    [bgView addSubview:self.labelFour];
    [bgView addSubview:self.labelFive];
    [bgView addSubview:self.labelSix];
    
    [bgView addSubview:self.lineOne];
    [bgView addSubview:self.lineTwo];
    [bgView addSubview:self.lineThree];
    [bgView addSubview:self.lineFour];
    [bgView addSubview:self.lineFive];
    
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
    
    [self.labelSix addSubview:self.upImgView];
    [self.upImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(6);
        make.centerY.equalTo(self.labelSix);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    
    [self.labelSix addSubview:self.upLabel];
    [self.upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.upImgView.mas_right);
        make.centerY.equalTo(self.labelSix);
    }];
    
    [self.labelSix addSubview:self.equalImgView];
    [self.equalImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.labelSix);
        make.centerX.offset(-4);
        make.size.mas_equalTo(CGSizeMake(16, 16));
    }];
    
    [self.labelSix addSubview:self.equalLabel];
    [self.equalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.equalImgView.mas_right);
        make.centerY.equalTo(self.labelSix);
    }];
    
    [self.labelSix addSubview:self.downLabel];
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-6);
        make.centerY.equalTo(self.labelSix);

    }];
    
    [self.labelSix addSubview:self.downImgView];
    [self.downImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.downLabel.mas_left);
        make.centerY.equalTo(self.labelSix);
        make.size.mas_equalTo(CGSizeMake(16, 16));
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
    
    [self.lineFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelFour.mas_right);
        make.width.mas_equalTo(1);
    }];
    
    [self.lineFive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(self.labelFive.mas_right);
        make.width.mas_equalTo(1);
    }];
    


}

- (void)setRow:(NSInteger)row {
    _row = row;
    if (row==0) {
        self.labelOne.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelTwo.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelThree.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelFour.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelFive.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.labelSix.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        
        self.lineOne.backgroundColor = JCWhiteColor;
        self.lineTwo.backgroundColor = JCWhiteColor;
        self.lineThree.backgroundColor = JCWhiteColor;
        self.lineFour.backgroundColor = JCWhiteColor;
        self.lineFive.backgroundColor = JCWhiteColor;
        
        self.upImgView.hidden = YES;
        self.equalImgView.hidden = YES;
        self.downImgView.hidden = YES;
        self.upLabel.hidden = YES;
        self.equalLabel.hidden = YES;
        self.downLabel.hidden = YES;

    }else{
        
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
        self.lineFour.backgroundColor = COLOR_F0F0F0;
        self.lineFive.backgroundColor = COLOR_F0F0F0;
        
        self.upImgView.hidden = NO;
        self.equalImgView.hidden = NO;
        self.downImgView.hidden = NO;
        self.upLabel.hidden = NO;
        self.equalLabel.hidden = NO;
        self.downLabel.hidden = NO;

    }
}

- (void)setModel:(JCBigDataZhishuModel *)model {
    _model = model;
    self.labelOne.text = model.name;
    self.labelTwo.text = model.higt;
    self.labelThree.text = model.low;
    self.labelFour.text = model.average;
    self.labelFive.text = model.kl;
//    self.labelSix.text = model.trend;
    
    self.upLabel.text = model.trend_up;
    self.equalLabel.text = model.trend_same;
    self.downLabel.text = model.trend_down;

}

- (UILabel *)labelOne {
    if (!_labelOne) {
        _labelOne = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelOne.numberOfLines = 0;
//        _labelOne.layer.borderColor = COLOR_DBDBDB.CGColor;
//        _labelOne.layer.borderWidth = 0.5;
    }
    return _labelOne;
}

- (UILabel *)labelTwo {
    if (!_labelTwo) {
        _labelTwo = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelTwo.numberOfLines = 0;
//        _labelTwo.layer.borderColor = COLOR_DBDBDB.CGColor;
//        _labelTwo.layer.borderWidth = 0.5;
    }
    return _labelTwo;
}

- (UILabel *)labelThree {
    if (!_labelThree) {
        _labelThree = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelThree.numberOfLines = 0;
//        _labelThree.layer.borderColor = COLOR_DBDBDB.CGColor;
//        _labelThree.layer.borderWidth = 0.5;
    }
    return _labelThree;
}

- (UILabel *)labelFour {
    if (!_labelFour) {
        _labelFour = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelFour.numberOfLines = 0;
//        _labelFour.layer.borderColor = COLOR_DBDBDB.CGColor;
//        _labelFour.layer.borderWidth = 0.5;
    }
    return _labelFour;
}

- (UILabel *)labelFive {
    if (!_labelFive) {
        _labelFive = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelFive.numberOfLines = 0;
//        _labelFive.layer.borderColor = COLOR_DBDBDB.CGColor;
//        _labelFive.layer.borderWidth = 0.5;
    }
    return _labelFive;
}

- (UILabel *)labelSix {
    if (!_labelSix) {
        _labelSix = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
        _labelSix.numberOfLines = 0;
//        _labelSix.layer.borderColor = COLOR_DBDBDB.CGColor;
//        _labelSix.layer.borderWidth = 0.5;
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

- (UIView *)lineFour {
    if (!_lineFour) {
        _lineFour = [UIView new];
    }
    return _lineFour;
}

- (UIView *)lineFive {
    if (!_lineFive) {
        _lineFive = [UIView new];
    }
    return _lineFive;
}

- (UIImageView *)upImgView {
    if (!_upImgView) {
        _upImgView = [UIImageView new];
        _upImgView.image = JCIMAGE(@"icon_bigdata_up");
    }
    return _upImgView;
}

- (UIImageView *)equalImgView {
    if (!_equalImgView) {
        _equalImgView = [UIImageView new];
        _equalImgView.image = JCIMAGE(@"icon_bigdata_chiping");
    }
    return _equalImgView;
}

- (UIImageView *)downImgView {
    if (!_downImgView) {
        _downImgView = [UIImageView new];
        _downImgView.image = JCIMAGE(@"icon_bigdata_down");
    }
    return _downImgView;
}

- (UILabel *)upLabel {
    if (!_upLabel) {
        _upLabel = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _upLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
    }
    return _upLabel;
}

- (UILabel *)equalLabel {
    if (!_equalLabel) {
        _equalLabel = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _equalLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
    }
    return _equalLabel;
}

- (UILabel *)downLabel {
    if (!_downLabel) {
        _downLabel = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_30B27A andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _downLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:12];
    }
    return _downLabel;
}

@end
