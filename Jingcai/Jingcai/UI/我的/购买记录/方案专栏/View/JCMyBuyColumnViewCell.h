//
//  JCMyBuyColumnViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCColumnDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyBuyColumnViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) JCColumnDetailModel *model; 

@end

NS_ASSUME_NONNULL_END
