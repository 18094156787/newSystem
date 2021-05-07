//
//  JCCommunity_HB_Item_HeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCCommunity_HB_Item_HeadView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,assign) BOOL isHongbang;//默认是大咖,yes==红榜

@property (nonatomic,assign) NSString *type;//当1时为命中率 2为盈利率 3为连红

@end

NS_ASSUME_NONNULL_END
