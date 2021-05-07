//
//  JCHongbangMatchInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangMatchInfoCell.h"

@implementation JCHongbangMatchInfoCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.layer.borderColor = COLOR_DDDDDD.CGColor;
    bgView.layer.borderWidth = 0.5;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(90));
    }];
    
    UIView *matchInfoView = [UIView new];
    [bgView addSubview:matchInfoView];
    [matchInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(AUTO(85));
    }];
    
    [matchInfoView addSubview:self.dayLab];
    [self.dayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.right.equalTo(matchInfoView);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [matchInfoView addSubview:self.matchNameLab];
    [self.matchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dayLab.mas_bottom);
        make.left.right.equalTo(matchInfoView);
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [matchInfoView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(matchInfoView).offset(AUTO(-10));
        make.left.right.equalTo(matchInfoView);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.rqLabel];
    [self.rqLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(matchInfoView.mas_right).offset(-0.5);
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(40)));
    }];
    
    [bgView addSubview:self.no_rqLab];
    [self.no_rqLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rqLabel);
        make.top.equalTo(self.rqLabel.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(25)));
    }];
    
    
    [bgView addSubview:self.rqLab];
    [self.rqLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rqLabel);
        make.top.equalTo(self.no_rqLab.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(25)));
    }];
    
    UIView *infoView = [UIView new];
    [bgView addSubview:infoView];
    infoView.layer.borderColor = COLOR_DDDDDD.CGColor;
    infoView.layer.borderWidth = 0.5;
    [self.contentView addSubview:infoView];
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rqLabel.mas_right).offset(-0.5);
        make.top.bottom.right.equalTo(bgView);
    }];
    
    [infoView addSubview:self.vsLab];
    [self.vsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(infoView);
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(25), AUTO(40)));
    }];
    
    [infoView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(infoView);
        make.right.equalTo(self.vsLab.mas_left).offset(0.5);
        make.bottom.equalTo(self.vsLab);
    }];

    
    [infoView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(infoView);
        make.left.equalTo(self.vsLab.mas_right).offset(-0.5);
        make.bottom.equalTo(self.vsLab);
    }];
    
    [infoView addSubview:self.no_rqEquaView];
    [self.no_rqEquaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(infoView);
        make.top.equalTo(self.vsLab.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(25)));
    }];
    
    [infoView addSubview:self.no_rqEqualLab];
    [self.no_rqEqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(infoView);
        make.top.equalTo(self.vsLab.mas_bottom).offset(-0.5);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(25)));
    }];
    
    [infoView addSubview:self.no_rqWinView];
    [self.no_rqWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeLab);
        make.top.equalTo(self.no_rqEqualLab);
        make.height.mas_equalTo(AUTO(25));
        make.right.equalTo(self.no_rqEqualLab.mas_left).offset(0.5);
    }];
    
    [infoView addSubview:self.no_rqWinLab];
    [self.no_rqWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.homeLab);
        make.top.equalTo(self.no_rqEqualLab);
        make.height.mas_equalTo(AUTO(25));
        make.right.equalTo(self.no_rqEqualLab.mas_left).offset(0.5);
    }];
    
    [infoView addSubview:self.no_rqLoseView];
    [self.no_rqLoseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.no_rqEqualLab.mas_right).offset(-0.5);
        make.top.equalTo(self.no_rqEqualLab);
        make.height.mas_equalTo(AUTO(25));
        make.right.offset(0);
    }];

    [infoView addSubview:self.no_rqLoseLab];
    [self.no_rqLoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.no_rqEqualLab.mas_right).offset(-0.5);
        make.top.equalTo(self.no_rqEqualLab);
        make.height.mas_equalTo(AUTO(25));
        make.right.offset(0);
    }];
    
    [infoView addSubview:self.rqEqualView];
    [self.rqEqualView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.no_rqEqualLab);
        make.top.equalTo(self.no_rqEqualLab.mas_bottom).offset(-0.5);
        make.bottom.offset(0);
    }];


    [infoView addSubview:self.rqEqualLab];
    [self.rqEqualLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.no_rqEqualLab);
        make.top.equalTo(self.no_rqEqualLab.mas_bottom).offset(-0.5);
        make.bottom.offset(0);
    }];
    

    [infoView addSubview:self.rqWinView];
    [self.rqWinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.no_rqWinLab);
        make.top.equalTo(self.no_rqWinLab.mas_bottom).offset(-0.5);
        make.bottom.offset(0);
    }];

    
    [infoView addSubview:self.rqWinLab];
    [self.rqWinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.no_rqWinLab);
        make.top.equalTo(self.no_rqWinLab.mas_bottom).offset(-0.5);
        make.bottom.offset(0);
    }];
    
    [infoView addSubview:self.rqLoseView];
    [self.rqLoseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.no_rqLoseLab);
        make.top.equalTo(self.no_rqLoseLab.mas_bottom).offset(-0.5);
        make.bottom.offset(0);
    }];
    
    [infoView addSubview:self.rqLoseLab];
    [self.rqLoseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.no_rqLoseLab);
        make.top.equalTo(self.no_rqLoseLab.mas_bottom).offset(-0.5);
        make.bottom.offset(0);
    }];
    
    [self.labelArray addObject:self.no_rqWinLab];
    [self.labelArray addObject:self.no_rqEqualLab];
    [self.labelArray addObject:self.no_rqLoseLab];
    [self.labelArray addObject:self.rqWinLab];
    [self.labelArray addObject:self.rqEqualLab];
    [self.labelArray addObject:self.rqLoseLab];
    
}

- (void)setModel:(JCWVerTjInfoMatchBall *)model {
    _model = model;
    self.dayLab.text = model.matchInfo;
    self.matchNameLab.text = model.leagueName;
    self.timeLab.text = model.matchTime;
    self.no_rqLab.text = @"0";
    self.rqLab.text = model.rold_plBall.rq;
    self.homeLab.text = model.homeName;
    self.awayLab.text = model.awayName;
    self.no_rqWinLab.text = [NSString stringWithFormat:@"主胜 %@",NonNil(model.old_plBall.win)];
    self.no_rqEqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.old_plBall.equal)];
    self.no_rqLoseLab.text = [NSString stringWithFormat:@"客胜 %@",NonNil(model.old_plBall.lose)];
    self.rqWinLab.text = [NSString stringWithFormat:@"主胜 %@",NonNil(model.rold_plBall.win)];
    self.rqEqualLab.text = [NSString stringWithFormat:@"平 %@",NonNil(model.rold_plBall.equal)];
    self.rqLoseLab.text = [NSString stringWithFormat:@"客胜 %@",NonNil(model.rold_plBall.lose)];


    [self.labelArray enumerateObjectsUsingBlock:^(UILabel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.backgroundColor = JCClearColor;
        obj.textColor = COLOR_333333;
    }];
    
    
    //专家推荐
    
    switch ([model.spf_new integerValue]) {
        case 1:
        {
            self.no_rqWinView.backgroundColor = JCBaseColor;
            self.no_rqWinLab.textColor= JCWhiteColor;
        }

        break;
        case 2:
        {
            self.no_rqEquaView.backgroundColor = JCBaseColor;
            self.no_rqEqualLab.textColor= JCWhiteColor;
        }

        break;
        case 3:
        {
            self.no_rqLoseView.backgroundColor = JCBaseColor;
            self.no_rqLoseLab.textColor= JCWhiteColor;
        }

        break;
        case 4:
        {
            self.rqWinView.backgroundColor = JCBaseColor;
            self.rqWinLab.textColor= JCWhiteColor;
        }

        break;
        case 5:
        {
            self.rqEqualView.backgroundColor = JCBaseColor;
            self.rqEqualLab.textColor= JCWhiteColor;

        }

        break;
        case 6:
        {
            self.rqLoseView.backgroundColor = JCBaseColor;
            self.rqLoseLab.textColor= JCWhiteColor;

        }

        break;

        default:
            break;
    }
//    专家推荐
    switch ([model.spf_new2 integerValue]) {
        case 1:
        {
            self.no_rqWinView.backgroundColor = JCBaseColor;
            self.no_rqWinLab.textColor= JCWhiteColor;
        }

        break;
        case 2:
        {
            self.no_rqEquaView.backgroundColor = JCBaseColor;
            self.no_rqEqualLab.textColor= JCWhiteColor;
        }

        break;
        case 3:
        {
            self.no_rqLoseView.backgroundColor = JCBaseColor;
            self.no_rqLoseLab.textColor= JCWhiteColor;
        }

        break;
        case 4:
        {
            self.rqWinView.backgroundColor = JCBaseColor;
            self.rqWinLab.textColor= JCWhiteColor;
        }

        break;
        case 5:
        {
            self.rqEqualView.backgroundColor = JCBaseColor;
            self.rqEqualLab.textColor= JCWhiteColor;

        }

        break;
        case 6:
        {
            self.rqLoseView.backgroundColor = JCBaseColor;
            self.rqLoseLab.textColor= JCWhiteColor;

        }

        break;

        default:
            break;
    }
    
    
    //开奖结果  根据 is_rq来区分
    switch ([model.spf_result integerValue]) {
        case 1:
        {
            self.tuijianImgView.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.no_rqWinLab addSubview:self.tuijianImgView];

        }

        break;
        case 2:
        {
            self.tuijianImgView.frame = CGRectMake(AUTO(5), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.no_rqEqualLab addSubview:self.tuijianImgView];

        }

        break;
        case 3:
        {
            self.tuijianImgView.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.no_rqLoseLab addSubview:self.tuijianImgView];
        }

        break;
        case 4:
        {
            self.tuijianImgView.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.rqWinLab addSubview:self.tuijianImgView];
        }

        break;
        case 5:
        {
            self.tuijianImgView.frame = CGRectMake(AUTO(5), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.rqEqualLab addSubview:self.tuijianImgView];

        }

        break;
        case 6:
        {
            self.tuijianImgView.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.rqLoseLab addSubview:self.tuijianImgView];

        }

        break;

        default:
            break;
    }
    //开奖结果
    switch ([model.spf_result2 integerValue]) {
        case 1:
        {
            self.tuijianImgView2.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.no_rqWinLab addSubview:self.tuijianImgView2];

        }

        break;
        case 2:
        {
            self.tuijianImgView2.frame = CGRectMake(AUTO(5), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.no_rqEqualLab addSubview:self.tuijianImgView2];

        }

        break;
        case 3:
        {
            self.tuijianImgView2.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.no_rqLoseLab addSubview:self.tuijianImgView2];
        }

        break;
        case 4:
        {
            self.tuijianImgView2.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.rqWinLab addSubview:self.tuijianImgView2];
        }

        break;
        case 5:
        {
            self.tuijianImgView2.frame = CGRectMake(AUTO(5), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.rqEqualLab addSubview:self.tuijianImgView2];

        }

        break;
        case 6:
        {
            self.tuijianImgView2.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
            [self.rqLoseLab addSubview:self.tuijianImgView2];

        }

        break;

        default:
            break;
    }
    
    //注:当model.is_rq==2的时候,model.spf_result只会返回1,2.3 但这时候表示的是让球的1,2,3 .也就是说,1,2,3判断的是底部那排让球的数据
    if ([model.is_rq integerValue]==2) {
            //开奖结果
        switch ([model.spf_result integerValue]) {

            case 1:
            {
                self.tuijianImgView.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
                [self.rqWinLab addSubview:self.tuijianImgView];
            }

            break;
            case 2:
            {
                self.tuijianImgView.frame = CGRectMake(AUTO(5), AUTO(6), AUTO(10.5), AUTO(11.5));
                [self.rqEqualLab addSubview:self.tuijianImgView];

            }

            break;
            case 3:
            {
                self.tuijianImgView.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
                [self.rqLoseLab addSubview:self.tuijianImgView];

            }

            break;

            default:
                break;
        }

        switch ([model.spf_result2 integerValue]) {

            case 1:
            {
                self.tuijianImgView2.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
                [self.rqWinLab addSubview:self.tuijianImgView2];
            }

            break;
            case 2:
            {
                self.tuijianImgView2.frame = CGRectMake(AUTO(5), AUTO(6), AUTO(10.5), AUTO(11.5));
                [self.rqEqualLab addSubview:self.tuijianImgView2];

            }

            break;
            case 3:
            {
                self.tuijianImgView2.frame = CGRectMake(AUTO(3), AUTO(6), AUTO(10.5), AUTO(11.5));
                [self.rqLoseLab addSubview:self.tuijianImgView2];

            }

            break;

            default:
                break;
        }
    }
    
    

    
    
    
    

}


- (UILabel *)dayLab {
    if (!_dayLab) {
        _dayLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _dayLab;
}

- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _matchNameLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

- (UILabel *)rqLabel {
    if (!_rqLabel) {
        _rqLabel = [UILabel initWithTitle:@"让\n球" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rqLabel.numberOfLines = 2;
        _rqLabel.layer.borderColor = COLOR_DDDDDD.CGColor;
        _rqLabel.layer.borderWidth = 0.5;
    }
    return _rqLabel;
}

- (UILabel *)no_rqLab {
    if (!_no_rqLab) {
        _no_rqLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rqLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _no_rqLab.layer.borderWidth = 0.5;
    }
    return _no_rqLab;
}


- (UILabel *)rqLab {
    if (!_rqLab) {
        _rqLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:COLOR_DDDDDD andTextAlignment:NSTextAlignmentCenter];
        _rqLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _rqLab.layer.borderWidth = 0.5;
    }
    return _rqLab;
}

- (UILabel *)vsLab {
    if (!_vsLab) {
        _vsLab = [UILabel initWithTitle:@"VS" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _vsLab;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _homeLab.layer.borderColor = COLOR_DDDDDD.CGColor;
//        _homeLab.layer.borderWidth = 0.5;
    }
    return _homeLab;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _awayLab.layer.borderColor = COLOR_DDDDDD.CGColor;
//        _awayLab.layer.borderWidth = 0.5;
    }
    return _awayLab;
}

- (UILabel *)no_rqWinLab {
    if (!_no_rqWinLab) {
        _no_rqWinLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rqWinLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _no_rqWinLab.layer.borderWidth = 0.5;
    }
    return _no_rqWinLab;
}

- (UILabel *)no_rqEqualLab {
    if (!_no_rqEqualLab) {
        _no_rqEqualLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rqEqualLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _no_rqEqualLab.layer.borderWidth = 0.5;
    }
    return _no_rqEqualLab;
}

- (UILabel *)no_rqLoseLab {
    if (!_no_rqLoseLab) {
        _no_rqLoseLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _no_rqLoseLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _no_rqLoseLab.layer.borderWidth = 0.5;
    }
    return _no_rqLoseLab;
}

- (UILabel *)rqEqualLab {
    if (!_rqEqualLab) {
        _rqEqualLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rqEqualLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _rqEqualLab.layer.borderWidth = 0.5;
    }
    return _rqEqualLab;
}

- (UILabel *)rqWinLab {
    if (!_rqWinLab) {
        _rqWinLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rqWinLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _rqWinLab.layer.borderWidth = 0.5;
    }
    return _rqWinLab;
}

- (UILabel *)rqLoseLab {
    if (!_rqLoseLab) {
        _rqLoseLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _rqLoseLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _rqLoseLab.layer.borderWidth = 0.5;
    }
    return _rqLoseLab;
}

- (UIImageView *)tuijianImgView {
    if (!_tuijianImgView) {
        _tuijianImgView = [UIImageView new];
        _tuijianImgView.image = JCIMAGE(@"tuijian_dagou");
    }
    return _tuijianImgView;
}

- (UIImageView *)tuijianImgView2 {
    if (!_tuijianImgView2) {
        _tuijianImgView2 = [UIImageView new];
        _tuijianImgView2.image = JCIMAGE(@"tuijian_dagou");//
    }
    return _tuijianImgView2;
}

- (NSMutableArray *)labelArray {
    if (!_labelArray) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}

- (UIView *)no_rqWinView {
    if (!_no_rqWinView) {
        _no_rqWinView = [UIView new];
    }
    return _no_rqWinView;
}

- (UIView *)no_rqEquaView {
    if (!_no_rqEquaView) {
        _no_rqEquaView = [UIView new];
    }
    return _no_rqEquaView;
}

- (UIView *)no_rqLoseView {
    if (!_no_rqLoseView) {
        _no_rqLoseView = [UIView new];
    }
    return _no_rqLoseView;
}

- (UIView *)rqWinView {
    if (!_rqWinView) {
        _rqWinView = [UIView new];
    }
    return _rqWinView;
}

- (UIView *)rqEqualView {
    if (!_rqEqualView) {
        _rqEqualView = [UIView new];
    }
    return _rqEqualView;
}

- (UIView *)rqLoseView {
    if (!_rqLoseView) {
        _rqLoseView = [UIView new];
    }
    return _rqLoseView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
