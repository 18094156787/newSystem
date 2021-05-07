//
//  JCDatabaseCommomMatchCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCDataBaseMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDatabaseCommomMatchCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataSource;

@end

NS_ASSUME_NONNULL_END
