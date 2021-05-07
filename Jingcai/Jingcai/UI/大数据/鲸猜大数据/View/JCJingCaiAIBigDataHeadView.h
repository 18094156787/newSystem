//
//  JCJingCaiAIBigDataHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCJingCaiAIBigDataBuyInfoView.h"
#import "JCJingCaiAIBigDataXufeiInfoView.h"
#import "JCBigDataMonthProduceModel.h"
#import "JCJingCaiAIBigDataMZInfoView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIBigDataHeadView : JCBaseView<SDCycleScrollViewDelegate>

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong)UIView *buyBgView;

@property (nonatomic,strong) JCJingCaiAIBigDataBuyInfoView *buyInfoView;

@property (nonatomic, strong) UIButton *sureBtn;

//@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) SDCycleScrollView *noticeCycleScrollView;//中奖轮播

@property (nonatomic,strong) NSArray *titleArray;

@property (nonatomic,strong) JCJingCaiAIBigDataMZInfoView *mzInfovView;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic, copy) void(^JCBuyClickBlock)(void);

@property (nonatomic,strong) JCBigDataMonthProduceModel *productModel;

@end

NS_ASSUME_NONNULL_END
