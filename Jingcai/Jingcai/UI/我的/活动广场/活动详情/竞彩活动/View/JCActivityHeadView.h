//
//  JCActivityHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityGuessResultShowView.h"
#import "JCActivityDetailModel.h"
#import "CountDown.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityHeadView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UIImageView *bgImgView;

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIImageView *whImgView;

@property (nonatomic, strong) UIImageView *timeBgView;

@property (nonatomic, strong) UILabel *moreLab;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) JCActivityGuessResultShowView *resultView;

@property (nonatomic,copy) void(^JCHeightBlock)(float height);

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (strong, nonatomic) CountDown *countDown;

@property (assign, nonatomic) NSInteger index;

@end

NS_ASSUME_NONNULL_END
