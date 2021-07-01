//
//  JCBuyPlanLock_GZH_Cell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWTjInfoDetailBall.h"
#import "JCImgCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBuyPlanLock_GZH_Cell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UILabel *introduceLab;//简介

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIView *topBgView;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *bzfhImageView;//不中返还

@property (nonatomic,strong) UILabel *hoursLab;

@property (nonatomic,strong) UILabel *minutesLab;

@property (nonatomic,strong) UILabel *secondsLab;


@property (nonatomic,strong) UILabel *endTimeLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *countLab;//购买人数

@property (nonatomic,strong) UILabel *buyTipLab;//购买提示

@property (nonatomic,strong) UILabel *yushouLab;//预售

@property (nonatomic,strong) UILabel *infoLab;//不中返还或者不中补单

@property (nonatomic,strong) UIImageView *iconImageView;

@property (nonatomic,strong) UILabel *priceLab;//

@property (nonatomic,strong) NSString * hours;

@property (nonatomic,strong) NSString * minutes;

@property (nonatomic,strong) NSString * seconds;

@property (nonatomic, strong) JCWTjInfoDetailBall *tjInfoDetailBall;//方案详情

@property (nonatomic,strong) JCWTjInfoBall *payInfoModel;

@end

NS_ASSUME_NONNULL_END
