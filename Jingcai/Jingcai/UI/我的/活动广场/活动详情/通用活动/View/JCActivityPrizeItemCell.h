//
//  JCActivityPrizeItemCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCActivityGoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityPrizeItemCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCActivityGoodsModel *model;

@end

NS_ASSUME_NONNULL_END
