//
//  JCActivityPrizeCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityGoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityPrizeTableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *contentLab1;

@property (nonatomic,strong) UILabel *contentLab2;

@property (nonatomic,strong) UILabel *contentLab_m;

@property (nonatomic,strong) UILabel *contentLab3;

@property (nonatomic,strong) JCActivityGoodsModel *model;

@end

NS_ASSUME_NONNULL_END
