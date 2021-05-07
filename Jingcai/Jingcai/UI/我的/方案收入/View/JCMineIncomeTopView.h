//
//  JCMineIncomeTopView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCMyIncomeDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMineIncomeTopView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *moneyLabel;

@property (nonatomic,strong) UILabel *moneyLab;

@property (nonatomic,strong) UIButton *withDrawBtn;

@property (nonatomic,strong) UILabel *yesterdayLabel;

@property (nonatomic,strong) UILabel *yesterdayLab;

@property (nonatomic,strong) UILabel *monthLabel;

@property (nonatomic,strong) UILabel *monthLab;

@property (nonatomic,strong) UILabel *totalLabel;

@property (nonatomic,strong) UILabel *totalLab;

@property (nonatomic,strong) JCMyIncomeDetailModel *model;

@property (nonatomic,copy) void(^JCRefreshBlock)(void);

@end

NS_ASSUME_NONNULL_END
