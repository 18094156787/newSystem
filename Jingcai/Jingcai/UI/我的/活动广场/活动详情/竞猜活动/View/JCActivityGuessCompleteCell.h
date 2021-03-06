//
//  JCActivityGuessCompleteCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuessCompleteCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView *timeBgView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) NSArray *dataSource;


@end

NS_ASSUME_NONNULL_END
