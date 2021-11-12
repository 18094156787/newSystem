//
//  JCKellyDataModelTrackCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelTrackCell : JCBaseTableViewCell_New

@property (nonatomic, strong) UILabel *winLab;

@property (nonatomic, strong) UILabel *equalLab;

@property (nonatomic, strong) UILabel *loseLab;

@property (nonatomic, strong) UILabel *zs_WinLab;

@property (nonatomic, strong) UILabel *zs_EqualLab;

@property (nonatomic, strong) UILabel *zs_LoseLab;

@property (nonatomic, strong) UILabel *fc_WinLab;

@property (nonatomic, strong) UILabel *fc_EqualLab;

@property (nonatomic, strong) UILabel *fc_LoseLab;

@property (nonatomic, strong) UILabel *rateLab;

@property (nonatomic, strong) UILabel *timeLab;

@end

NS_ASSUME_NONNULL_END
