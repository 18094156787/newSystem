//
//  JCHistoryPayHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDataModelDateView.h"
#import "JCJingCaiAIBigDataBuyInfoView.h"
#import "JCKellyDataModelPayInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayHeadView : JCBaseView

@property (nonatomic,strong) UIImageView *bgView;

@property (nonatomic,strong) UILabel *backTitleLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIButton *statusBtn;

@property (nonatomic,strong)UIView *buyBgView;

@property (nonatomic,strong)  JCJingCaiAIBigDataBuyInfoView *buyInfoView;

@property (nonatomic, strong) UIView *sureBgView;

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic,strong) JCDataModelDateView *dateHeadView;

@property (nonatomic,strong) UIButton *backBtn;

@property (nonatomic, assign) NSInteger type;//0是历史同赔 1是泊凇分布 2是分歧 3是凯利 4是指数异动

@property (nonatomic,strong) JCKellyDataModelPayInfoModel *model;

@property (nonatomic, copy) void(^JCBuyClickBlock)(void);

@property (nonatomic,copy) void(^JCTimeBlock)(NSString *time);

@end

NS_ASSUME_NONNULL_END
