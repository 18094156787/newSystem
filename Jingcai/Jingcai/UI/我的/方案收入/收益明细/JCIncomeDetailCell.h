//
//  JCIncomeDetailCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/1/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMyIncomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCIncomeDetailCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *moneyLab;

@property (nonatomic,strong) JCMyIncomeModel *model;

@end

NS_ASSUME_NONNULL_END
