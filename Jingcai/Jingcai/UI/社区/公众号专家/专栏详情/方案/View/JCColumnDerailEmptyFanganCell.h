//
//  JCColumnDerailEmptyFanganCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCColumnListPlanModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDerailEmptyFanganCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCColumnListPlanModel *model;

@end

NS_ASSUME_NONNULL_END
