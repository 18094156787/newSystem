//
//  JCActivityGuess_SPF_CompleteMore_Cell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityOptionModel.h"
#import "JCActivityDetailModel.h"
#import "JCActivityGuess_SPF_More_MatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuess_SPF_CompleteMore_Cell : JCBaseTableViewCell_New

@property (nonatomic, strong) UIImageView *timeBgView;

@property (nonatomic,strong) UILabel *teamLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *chooseLab;

@property (nonatomic,strong) JCActivityOptionModel *selectOptionModel;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCActivityGuess_SPF_More_MatchModel *matchModel;


@end

NS_ASSUME_NONNULL_END
