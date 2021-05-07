//
//  JCYCHomeRewardCycleCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCTitleBannerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCHomeRewardCycleCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) JCTitleBannerModel *model;

@end

NS_ASSUME_NONNULL_END
