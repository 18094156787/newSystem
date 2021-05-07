//
//  JCMatchGoalDistributionInfoCirCleView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "SCPieChart.h"
#import "JCLiveDistributionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchGoalDistributionInfoCirCleView : JCBaseView

@property (nonatomic,strong,nullable) SCPieChart *chartView;

@property (nonatomic,strong) JCLiveDistributionModel *attackModel;

@property (nonatomic,strong) JCLiveDistributionModel *dangerModel;

@property (nonatomic,strong) JCLiveDistributionModel *possessionModel;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *leftLab;

@property (nonatomic,strong) UILabel *rightLab;

@property (nonatomic,strong) UIView *rightLine;

@property (nonatomic,strong) UIView *bottomLine;



@end

NS_ASSUME_NONNULL_END
