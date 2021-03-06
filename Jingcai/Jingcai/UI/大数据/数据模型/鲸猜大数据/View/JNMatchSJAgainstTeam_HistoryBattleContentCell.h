//
//  JNMatchSJAgainstTeam_HistoryBattleContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataAnalysisMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstTeam_HistoryBattleContentCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *labelOne;

@property (nonatomic,strong) UILabel *labelTwo;

@property (nonatomic,strong) UILabel *labelThree;

@property (nonatomic,strong) UILabel *labelFour;

@property (nonatomic,strong) UILabel *labelFive;

@property (nonatomic,strong) UILabel *labelSix;

@property (nonatomic,strong) UIView *lineOne;

@property (nonatomic,strong) UIView *lineTwo;

@property (nonatomic,strong) UIView *lineThree;

@property (nonatomic,assign) NSInteger row;

@property (nonatomic,strong) JCBigDataAnalysisMatchModel *model;

@end

NS_ASSUME_NONNULL_END
