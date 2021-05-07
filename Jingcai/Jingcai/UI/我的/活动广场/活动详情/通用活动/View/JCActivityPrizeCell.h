//
//  JCActivityPrizeCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityPrizeCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView *timeBgView;

@property (nonatomic, strong) UILabel *infoLab;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,copy) void(^JCClickBlock)(void);

@end

NS_ASSUME_NONNULL_END
