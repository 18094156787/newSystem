//
//  JCTeamMatchInfoTongJiItemCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell.h"
#import "JCTeamMatchTongjiModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoTongJiItemCell : JCBaseCollectionViewCell

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *numberLab;

@property (nonatomic,strong) JCTeamMatchTongjiModel *model;

@end

NS_ASSUME_NONNULL_END
