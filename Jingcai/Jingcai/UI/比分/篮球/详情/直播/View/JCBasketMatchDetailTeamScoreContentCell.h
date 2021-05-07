//
//  JCBasketMatchDetailTeamScoreContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBasketMatchDetailZBFormModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketMatchDetailTeamScoreContentCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *teamLab;

@property (nonatomic,strong) UILabel *sectionOneLab;//让球数

@property (nonatomic,strong) UILabel *sectionTwoLab;

@property (nonatomic,strong) UILabel *sectionThreeLab;

@property (nonatomic,strong) UILabel *sectionFourLab;

@property (nonatomic,strong) UILabel *sectionOTLab;//加时

@property (nonatomic,strong) UILabel *scoreLab;//总分

@property (nonatomic, strong) NSMutableArray *viewArray;

@property (nonatomic, strong) JCBasketMatchDetailZBFormModel *homeFormModel;

@property (nonatomic, strong) JCBasketMatchDetailZBFormModel *awayFormModel;

@end

NS_ASSUME_NONNULL_END
