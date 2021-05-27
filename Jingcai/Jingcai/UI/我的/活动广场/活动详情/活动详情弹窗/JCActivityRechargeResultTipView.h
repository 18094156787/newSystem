//
//  JCActivityRechargeResultTipView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityRechargeResultTipView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic, strong) UILabel *moneyLab;

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,copy) void(^JCClickBlock)(void);

@end

NS_ASSUME_NONNULL_END
