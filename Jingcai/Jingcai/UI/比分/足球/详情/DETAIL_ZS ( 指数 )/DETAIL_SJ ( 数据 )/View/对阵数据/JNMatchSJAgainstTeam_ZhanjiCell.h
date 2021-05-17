//
//  JNMatchSJAgainstTeam_ZhanjiCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "SCPieChart.h"
#import "JCBigDataAnalysisModel.h"
#import "JCBigDataMonthProduceModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstTeam_ZhanjiCell : JCBaseTableViewCell_New

@property (nonatomic,strong,nullable) SCPieChart *chartView;

@property (nonatomic,strong) UILabel *teamNameLab;

@property (nonatomic, strong) UILabel *windLab;

@property (nonatomic, strong) UILabel *eqalLab;

@property (nonatomic, strong) UILabel *loseLab;

@property (nonatomic,strong) UIView *circleBgView;

@property (nonatomic,strong) UILabel *zs_infoLab;

//@property (nonatomic,strong) UILabel *zjCountLab;//战绩数量

@property (nonatomic,strong) UILabel *zsCountLab;//走势数量

@property (nonatomic,strong) JCBigDataAnalysisModel *model;//球队分析

@property (nonatomic,strong) JCBigDataMonthProduceModel *productModel;

@end

NS_ASSUME_NONNULL_END
