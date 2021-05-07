//
//  JCFootBallBuyPlanEndBuyCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWTjInfoDetailBall.h"
#import "JCImgCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCFootBallBuyPlanEndBuyCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UILabel *introduceLab;//简介

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) UILabel *endTimeLab;

@property (nonatomic,strong) UILabel *countLab;//购买人数

@property (nonatomic, strong) JCWTjInfoDetailBall *tjInfoDetailBall;//方案详情

@end

NS_ASSUME_NONNULL_END
