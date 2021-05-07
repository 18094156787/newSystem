//
//  JCHomeExpertTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHomeExpertTableViewCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,assign) NSInteger clickEnable;//可否点击 1可以点 2不能点



@end

NS_ASSUME_NONNULL_END
