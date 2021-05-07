//
//  JCBasketBallMatchDetailZBCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchDetailZBCell.h"

@implementation JCBasketBallMatchDetailZBCell

- (void)initViews {
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(45));
        make.top.offset(AUTO(15));
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.timeLab);
        make.width.mas_equalTo(AUTO(60));
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLab.mas_right).offset(AUTO(8));
        make.top.offset(AUTO(15));
//        make.right.offset(AUTO(-75));
        make.right.equalTo(self.scoreLab.mas_left).offset(AUTO(-15));
        make.bottom.offset(AUTO(-10));
    }];
    
    UIView *dianBgView = [UIView new];
    dianBgView.layer.borderColor = COLOR_F0F1F3.CGColor;
    dianBgView.layer.borderWidth = 1;
    dianBgView.layer.masksToBounds = YES;
    dianBgView.layer.cornerRadius = AUTO(6);
    [self.contentView addSubview:dianBgView];
    [dianBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.top.equalTo(self.timeLab).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];

    [dianBgView addSubview:self.dianView];
    [self.dianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(dianBgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(6), AUTO(6)));
    }];

    [self.contentView insertSubview:self.bottomLineView atIndex:0];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(dianBgView);
        make.top.equalTo(dianBgView.mas_bottom);
        make.width.mas_equalTo(1);
        make.bottom.offset(0);
    }];

    [self.contentView insertSubview:self.topLineView atIndex:0];
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(dianBgView);
        make.bottom.equalTo(dianBgView.mas_top);
        make.width.mas_equalTo(1);
        make.top.offset(0);
    }];
    

}

//- (void)data {
//    self.timeLab.text = @"第四节\n00:00";
//    self.contentLab.text = @"弗雷戴特三分跳投不中，罗汉琛抢到进攻篮板罗汉琛抢到进攻篮";
//    self.scoreLab.text = @"112 - 107";
//}

- (void)setModel:(JNMatchLiveBall *)model {
    _model = model;
    self.timeLab.text = [NSString stringWithFormat:@"%@\n%@",model.per,model.time];
    self.contentLab.text = model.desc;
    self.scoreLab.text = model.score;
}

- (void)setHideTopLine:(BOOL)hideTopLine {
    _hideTopLine = hideTopLine;
    self.topLineView.hidden = hideTopLine;
    self.dianView.backgroundColor = hideTopLine?JCBaseColor:COLOR_C3C6CA;
}

- (UIView *)dianView {
    if (!_dianView) {
        _dianView = [UIView new];
        _dianView.backgroundColor = COLOR_C3C6CA;
        [_dianView hg_setAllCornerWithCornerRadius:AUTO(3)];
    }
    return _dianView;
}

- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [UIView new];
        _topLineView.backgroundColor = COLOR_F0F0F0;
    }
    return _topLineView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = COLOR_F0F0F0;
    }
    return _bottomLineView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =  [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
        _timeLab.numberOfLines = 0;
    }
    return _timeLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab =  [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab =  [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _scoreLab;
}

@end
