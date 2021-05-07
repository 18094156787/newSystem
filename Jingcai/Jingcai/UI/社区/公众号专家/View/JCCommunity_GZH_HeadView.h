//
//  JCCommunity_GZH_HeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCCommunity_GZH_HeadView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIView *moreView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@end

NS_ASSUME_NONNULL_END
