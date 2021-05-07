//
//  JCFamousExpertHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCFamousExpertHeadView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *dataSource;

@property (nonatomic,assign)BOOL isHongbang;

@end

NS_ASSUME_NONNULL_END
