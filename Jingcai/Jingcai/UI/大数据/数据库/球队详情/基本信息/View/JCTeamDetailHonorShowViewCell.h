//
//  JCTeamDetailHonorShowViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamDetailInfoHonorModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailHonorShowViewCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *numberLab;

@property (nonatomic,strong) UIView *infoView;

@property (nonatomic,strong) JCTeamDetailInfoHonorModel *model;

@end

NS_ASSUME_NONNULL_END
