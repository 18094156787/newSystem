//
//  JCKellyDataModelOpenRateView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCKellyDataModelModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelOpenRateView : JCBaseView

@property (nonatomic, strong) UILabel *chuLab;//初指

@property (nonatomic, strong) UILabel *winLab;

@property (nonatomic, strong) UILabel *equalLab;

@property (nonatomic, strong) UILabel *loseLab;

@property (nonatomic, strong) UILabel *rateLab;

@property (nonatomic, strong) UILabel *zsLab;

@property (nonatomic, strong) UILabel *zs_WinLab;

@property (nonatomic, strong) UILabel *zs_EqualLab;

@property (nonatomic, strong) UILabel *zs_LoseLab;

@property (nonatomic, strong) UILabel *fcLab;

@property (nonatomic, strong) UILabel *fc_WinLab;

@property (nonatomic, strong) UILabel *fc_EqualLab;

@property (nonatomic, strong) UILabel *fc_LoseLab;

@property (nonatomic, assign) BOOL is_jp;//记录即指

@property (nonatomic, strong) NSString *homeWinValue;
@property (nonatomic, strong) NSString *homeEqualValue;
@property (nonatomic, strong) NSString *homeLoseValue;

@property (nonatomic, strong) NSString *awayWinValue;
@property (nonatomic, strong) NSString *awayEqualValue;
@property (nonatomic, strong) NSString *awayLoseValue;

@property (nonatomic, strong) JCKellyDataModelOddsIndexModel *chuModel;

@property (nonatomic, strong) JCKellyDataModelOddsIndexModel *model;

@end

NS_ASSUME_NONNULL_END
