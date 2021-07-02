//
//  JCActivityDetailHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/23.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityDetailHeadView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic, strong) UIImageView *timeBgView;

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *infoLab;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIImage *kindImageView;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,copy) void(^JCClickBlock)(void);

@property (nonatomic,copy) void(^JCHeightBlock)(float height);

@end

NS_ASSUME_NONNULL_END
