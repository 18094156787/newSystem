//
//  JCBasketBallMatchDetailErrorCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchDetailErrorCell.h"
#import "JCWZBStatusModel.h"
@implementation JCBasketBallMatchDetailErrorCell

- (void)initViews {
    
    [self.contentView addSubview:self.homeFgLab];
    [self.homeFgLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self.contentView addSubview:self.homeFgInfoLab];
    [self.homeFgInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeFgLab.mas_bottom).offset(AUTO(8));
        make.centerX.equalTo(self.homeFgLab);
    }];
    
    [self.contentView addSubview:self.awayFgLab];
    [self.awayFgLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self.contentView addSubview:self.awayFgInfoLab];
    [self.awayFgInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.awayFgLab.mas_bottom).offset(AUTO(8));
        make.centerX.equalTo(self.awayFgLab);
    }];
    
    
    
    [self.contentView addSubview:self.defenThreeProgressView];
    [self.defenThreeProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(30)));
    }];
    
    [self.contentView addSubview:self.defenTwoProgressView];
    [self.defenTwoProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.defenThreeProgressView.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(30)));
    }];
    
    [self.contentView addSubview:self.faqiuProgressView];
    [self.faqiuProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.defenTwoProgressView.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(30)));
    }];
    
    [self.contentView addSubview:self.mingzhongProgressView];
    [self.mingzhongProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.faqiuProgressView.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(30)));
    }];
    
    [self.contentView addSubview:self.homeZtLab];
    [self.homeZtLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.faqiuProgressView).offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self.contentView addSubview:self.homeZtInfoLab];
    [self.homeZtInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeZtLab.mas_bottom).offset(AUTO(8));
        make.centerX.equalTo(self.homeZtLab);
    }];
    
    [self.contentView addSubview:self.awayZtLab];
    [self.awayZtLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.faqiuProgressView).offset(AUTO(10));
        make.right.offset(AUTO(-15));
        make.width.mas_equalTo(AUTO(70));
    }];
    
    [self.contentView addSubview:self.awayZtInfoLab];
    [self.awayZtInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.awayZtLab.mas_bottom).offset(AUTO(8));
        make.centerX.equalTo(self.awayZtLab);
    }];
    
    [self.viewArray addObject:self.defenThreeProgressView];
    [self.viewArray addObject:self.defenTwoProgressView];
    [self.viewArray addObject:self.faqiuProgressView];
    [self.viewArray addObject:self.mingzhongProgressView];
}

- (void)setFgArray:(NSArray *)fgArray {
    _fgArray = fgArray;
    if (fgArray.count<=self.viewArray.count) {
        for (int i=0; i<fgArray.count; i++) {
            JCWZBStatusModel *model = fgArray[i];
            JCMatchGoalDistributionInfoProgressView *view = self.viewArray[i];
            view.basketBallModel = model;
        }
        
    }else {
        for (int i=0; i<fgArray.count; i++) {
            if (i<self.viewArray.count) {
                JCWZBStatusModel *model = fgArray[i];
                JCMatchGoalDistributionInfoProgressView *view = self.viewArray[i];
                view.basketBallModel = model;
            }

        }
    }
}

- (void)setFgInfoModel:(JCBasketMatchDetailZBFanGuiModel *)fgInfoModel {
    _fgInfoModel = fgInfoModel;
    self.homeFgLab.text = @"本节犯规数";
    self.homeFgInfoLab.text = fgInfoModel.away_fgcs;
    self.awayFgLab.text = @"本节犯规数";
    self.awayFgInfoLab.text = fgInfoModel.home_fgcs;
    
    self.homeZtLab.text = @"剩余暂停";
    self.homeZtInfoLab.text = [NSString stringWithFormat:@"%@",@([fgInfoModel.away_syzt floatValue])];
    self.awayZtLab.text = @"剩余暂停";
    self.awayZtInfoLab.text = [NSString stringWithFormat:@"%@",@([fgInfoModel.home_syzt floatValue])];
}

- (void)data {
    self.homeFgLab.text = @"本节犯规数";
    self.homeFgInfoLab.text = @"6";
    self.awayFgLab.text = @"本节犯规数";
    self.awayFgInfoLab.text = @"6";
}

- (UILabel *)homeFgLab {
    if (!_homeFgLab) {
        _homeFgLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeFgLab;
}

- (UILabel *)homeFgInfoLab {
    if (!_homeFgInfoLab) {
        _homeFgInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeFgInfoLab;
}

- (UILabel *)awayFgLab {
    if (!_awayFgLab) {
        _awayFgLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayFgLab;
}

- (UILabel *)awayFgInfoLab {
    if (!_awayFgInfoLab) {
        _awayFgInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayFgInfoLab;
}

- (UILabel *)homeZtLab {
    if (!_homeZtLab) {
        _homeZtLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeZtLab;
}

- (UILabel *)homeZtInfoLab {
    if (!_homeZtInfoLab) {
        _homeZtInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeZtInfoLab;
}

- (UILabel *)awayZtLab {
    if (!_awayZtLab) {
        _awayZtLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayZtLab;
}

- (UILabel *)awayZtInfoLab {
    if (!_awayZtInfoLab) {
        _awayZtInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayZtInfoLab;
}

- (JCMatchGoalDistributionInfoProgressView *)defenTwoProgressView {
    if (!_defenTwoProgressView) {
        _defenTwoProgressView = [JCMatchGoalDistributionInfoProgressView new];
    }
    return _defenTwoProgressView;
}

- (JCMatchGoalDistributionInfoProgressView *)defenThreeProgressView {
    if (!_defenThreeProgressView) {
        _defenThreeProgressView = [JCMatchGoalDistributionInfoProgressView new];
    }
    return _defenThreeProgressView;
}

- (JCMatchGoalDistributionInfoProgressView *)faqiuProgressView {
    if (!_faqiuProgressView) {
        _faqiuProgressView = [JCMatchGoalDistributionInfoProgressView new];
    }
    return _faqiuProgressView;
}

- (JCMatchGoalDistributionInfoProgressView *)mingzhongProgressView {
    if (!_mingzhongProgressView) {
        _mingzhongProgressView = [JCMatchGoalDistributionInfoProgressView new];
    }
    return _mingzhongProgressView;
}

- (NSMutableArray *)viewArray {
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}


@end
