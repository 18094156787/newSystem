//
//  JCTeamDetailHonorCollectionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseCollectionViewCell.h"
#import "JCTeamDetailInfoHonorModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailHonorCollectionCell : JCBaseCollectionViewCell

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *numberLab;

@property (nonatomic,strong) JCTeamDetailInfoHonorModel *model;

@end

NS_ASSUME_NONNULL_END
