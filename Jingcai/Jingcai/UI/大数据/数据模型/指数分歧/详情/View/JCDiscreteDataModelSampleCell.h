//
//  JCDiscreteDataModelSampleCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCKellyDataDetailSampleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDiscreteDataModelSampleCell : JCBaseTableViewCell_New

@property (nonatomic, strong) UILabel *home_winLab;

@property (nonatomic, strong) UILabel *home_equalLab;

@property (nonatomic, strong) UILabel *home_loseLab;
//
@property (nonatomic, strong) UILabel *away_winLab;

@property (nonatomic, strong) UILabel *away_equalLab;

@property (nonatomic, strong) UILabel *away_loseLab;

@property (nonatomic, strong) UILabel *home_zs_WinLab;

@property (nonatomic, strong) UILabel *home_zs_EqualLab;

@property (nonatomic, strong) UILabel *home_zs_LoseLab;

@property (nonatomic, strong) UILabel *home_fc_WinLab;

@property (nonatomic, strong) UILabel *home_fc_EqualLab;

@property (nonatomic, strong) UILabel *home_fc_LoseLab;

@property (nonatomic, strong) UILabel *home_rateLab;

@property (nonatomic, strong) UILabel *away_rateLab;

@property (nonatomic, strong) UILabel *companyLab;

@property (nonatomic, strong) JCKellyDataDetailSampleModel *model;

@end

NS_ASSUME_NONNULL_END
