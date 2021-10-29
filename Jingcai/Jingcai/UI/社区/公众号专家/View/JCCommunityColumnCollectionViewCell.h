//
//  JCCommunityColumnCollectionViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell_New.h"
#import "JCColumnDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCCommunityColumnCollectionViewCell : JCBaseCollectionViewCell_New

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JCColumnDetailModel *model;

@end

NS_ASSUME_NONNULL_END
