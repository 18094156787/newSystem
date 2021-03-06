//
//  JCActivityGuess_SPF_More_CheckCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityGuess_SPF_More_MatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuess_SPF_More_CheckCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) JCActivityGuess_SPF_More_MatchModel *matchModel;

@end

NS_ASSUME_NONNULL_END
