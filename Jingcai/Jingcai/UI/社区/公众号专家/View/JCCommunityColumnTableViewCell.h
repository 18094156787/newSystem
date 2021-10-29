//
//  JCCommunityColumnTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCColumnDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCCommunityColumnTableViewCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,copy) void(^JCBlock)(void);

@end

NS_ASSUME_NONNULL_END
