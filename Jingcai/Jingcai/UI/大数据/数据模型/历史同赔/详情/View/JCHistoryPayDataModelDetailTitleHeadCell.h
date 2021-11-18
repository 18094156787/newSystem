//
//  JCHistoryPayDataModelDetailTitleHeadCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTipMatchInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayDataModelDetailTitleHeadCell : JCBaseTableViewCell_New

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UIView *teamView;

@property (nonatomic, strong) UILabel *scoreLab;

@property (nonatomic, strong) UILabel *homeTeamLab;

@property (nonatomic, strong) UILabel *awayTeamLab;

@property (nonatomic, strong) UILabel *resultLab;

@property (nonatomic, strong) JCTipMatchInfoModel *model;

@end

NS_ASSUME_NONNULL_END
