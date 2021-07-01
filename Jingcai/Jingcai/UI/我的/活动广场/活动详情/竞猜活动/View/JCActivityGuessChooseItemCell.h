//
//  JCActivityGuessChooseItemCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCActivityOptionModel.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuessChooseItemCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIImageView *selImgView;

@property (nonatomic,strong) UIImageView *chooseImgView;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCActivityOptionModel *model;

@end

NS_ASSUME_NONNULL_END
