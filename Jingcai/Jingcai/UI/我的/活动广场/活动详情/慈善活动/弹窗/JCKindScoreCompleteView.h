//
//  JCKindScoreCompleteView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKindScoreCompleteView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,copy) void(^JCClickBlock)(NSArray *dataArray);

@property (nonatomic,copy) void(^JCCloseBlock)(void);

@end

NS_ASSUME_NONNULL_END
