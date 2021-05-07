//
//  JCActivityGuessChooseCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuessChooseCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIImageView *timeBgView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIImageView *resultImgView;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,assign) NSInteger selCount;;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,copy) void(^JCSelectBlock)(NSInteger selCount);

@end

NS_ASSUME_NONNULL_END
