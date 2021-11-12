//
//  JCPoissonDataModelDetailAttackCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPoissonDataModelDetailAttackCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *homeRateLab;

@property (nonatomic,strong) UILabel *awayRateLab;

@property (nonatomic,strong) UIView *homeProgressView;

@property (nonatomic,strong) UIView *awayProgressView;

@end

NS_ASSUME_NONNULL_END
