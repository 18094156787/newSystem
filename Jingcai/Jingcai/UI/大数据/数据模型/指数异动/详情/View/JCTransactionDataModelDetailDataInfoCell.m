//
//  JCTransactionDataModelDetailDataInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelDetailDataInfoCell.h"

@implementation JCTransactionDataModelDetailDataInfoCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.width.mas_equalTo(AUTO(80));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    UIView *rateChangeView = [UIView new];
    rateChangeView.backgroundColor = JCClearColor;
    [rateChangeView hg_setAllCornerWithCornerRadius:2];
    [self.contentView addSubview:rateChangeView];
    [rateChangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(AUTO(12));
        make.centerY.equalTo(self.titleLab);
        make.height.mas_equalTo(AUTO(26));
    }];
    self.rateChangeView = rateChangeView;
    
    
    
    [rateChangeView addSubview:self.windRateLab];
    [self.windRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(rateChangeView);
//        make.width.mas_equalTo(AUTO(35));
    }];
    
    [rateChangeView addSubview:self.upImgView];
    [self.upImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.windRateLab.mas_right).offset(AUTO(2));
        make.centerY.equalTo(rateChangeView);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    

    
    [rateChangeView addSubview:self.equalRateLab];
    [self.equalRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.upImgView.mas_right).offset(AUTO(2));
        make.centerY.equalTo(rateChangeView);
//        make.width.mas_equalTo(AUTO(35));
    }];
    
    [rateChangeView addSubview:self.equalImgView];
    [self.equalImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.equalRateLab.mas_right).offset(AUTO(2));
        make.centerY.equalTo(rateChangeView);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    

    
    [rateChangeView addSubview:self.loseRateLab];
    [self.loseRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.equalImgView.mas_right).offset(AUTO(2));
        make.centerY.equalTo(rateChangeView);
//        make.width.mas_equalTo(AUTO(35));
    }];
    
    [rateChangeView addSubview:self.downImgView];
    [self.downImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loseRateLab.mas_right).offset(AUTO(2));
        make.centerY.equalTo(rateChangeView);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
        make.right.offset(AUTO(-5));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.titleLab);
    }];
}

- (void)setModel:(JCTransactionDataOddsChangeModel *)model {
    _model = model;
    self.titleLab.text = model.change_type_name;
    self.upImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_up");
    self.equalImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_down");
    self.downImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_down");
//    self.windRateLab.text = @"3.99";
//    self.equalRateLab.text = @"3.99";
//    self.loseRateLab.text = @"3.99";
    self.infoLab.text = model.odds_change_name;
    
    if (model.compare_odds_change_data.count>=2) {
        NSString *homeValue = @"";
        NSString *euqalValue = @"";
        NSString *awayValue = @"";
        for (int i=0; i<model.compare_odds_change_data.count; i++) {
            JCTransactionDataChangeFlagModel *flagModel = model.compare_odds_change_data[i];

            if (i==0) {
                homeValue = flagModel.value;
                self.windRateLab.text = homeValue;
                if ([flagModel.flage integerValue]==1) {
                    self.upImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_up");
                    self.windRateLab.textColor = COLOR_EF2F2F;
                }else if([flagModel.flage integerValue]==2){
                    self.upImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_down");
                    self.windRateLab.textColor = COLOR_30B27A;
                }else{
                    self.windRateLab.textColor = COLOR_2F2F2F;
                }
                
            }
            if (i==1) {
                euqalValue = flagModel.value;
                if ([self.type integerValue]==1) {
                    self.equalRateLab.text = euqalValue;
                }else{
                    self.equalRateLab.text = [NSString stringWithFormat:@"(%@)",euqalValue];
                }
                if ([flagModel.flage integerValue]==1) {
                    self.equalImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_up");
                    self.equalRateLab.textColor = COLOR_EF2F2F;
                }else if([flagModel.flage integerValue]==2){
                    self.equalImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_down");
                    self.equalRateLab.textColor = COLOR_30B27A;
                }else{
                    self.equalRateLab.textColor = COLOR_2F2F2F;
                }
                
            }
            if (i==2) {
                awayValue = flagModel.value;
                self.loseRateLab.text = awayValue;
                
                if ([flagModel.flage integerValue]==1) {
                    self.downImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_up");
                    self.loseRateLab.textColor = COLOR_EF2F2F;
                }else if([flagModel.flage integerValue]==2){
                    self.downImgView.image = JCIMAGE(@"ic_dataModel_zhishu_small_down");
                    self.loseRateLab.textColor = COLOR_30B27A;
                }else{
                    self.loseRateLab.textColor = COLOR_2F2F2F;
                }
            }
                if ([self.type integerValue]==1) {
                    if (i==0) {
                        [self showChangeRateView:self.upImgView flag:[flagModel.flage integerValue]];
                    }
                    if (i==1) {
                        [self showChangeRateView:self.equalImgView flag:[flagModel.flage integerValue]];
                    }
                    if (i==2) {
                        [self showChangeRateView:self.downImgView flag:[flagModel.flage integerValue]];
                    }
                    
                }else{
                    if (i==0) {
                        [self showChangeRateView:self.upImgView flag:[flagModel.flage integerValue]];
                    }
                    if (i==1) {
                        [self showChangeRateView:self.downImgView flag:[flagModel.flage integerValue]];
                    }
                    self.equalRateLab.textColor = COLOR_2F2F2F;
                    [self showChangeRateView:self.equalImgView flag:3];
                    
                }

        }

    }
}
- (void)showChangeRateView:(UIImageView *)imageView flag:(NSInteger)flag {
    if (flag==1||flag==2) {
        imageView.hidden = NO;
        [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
        }];
    }else{
        imageView.hidden = YES;
        [imageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(0, 0));
        }];
    }
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)windRateLab {
    if (!_windRateLab) {
        _windRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _windRateLab;
}

- (UILabel *)equalRateLab {
    if (!_equalRateLab) {
        _equalRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _equalRateLab;
}

- (UILabel *)loseRateLab {
    if (!_loseRateLab) {
        _loseRateLab =[UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_EF2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseRateLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab =[UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIImageView *)upImgView {
    if (!_upImgView) {
        _upImgView = [UIImageView new];
    }
    return _upImgView;
}

- (UIImageView *)equalImgView {
    if (!_equalImgView) {
        _equalImgView = [UIImageView new];
    }
    return _equalImgView;
}

- (UIImageView *)downImgView {
    if (!_downImgView) {
        _downImgView = [UIImageView new];
    }
    return _downImgView;
}

@end
