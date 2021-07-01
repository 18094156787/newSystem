//
//  JCActivityGuessCheckView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuessCheckView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIView *titleLab;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIButton *cancelBtn;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,copy) void(^JCSureBlock)(void);

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) NSMutableArray *dataSource;





@end

NS_ASSUME_NONNULL_END
