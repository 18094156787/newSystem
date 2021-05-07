//
//  JCParticipateJingCaSuccessCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCJingCaiResultMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCParticipateJingCaSuccessCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *masterNameLab;

@property (nonatomic,strong) UILabel *customerNameLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UILabel *predicateLab;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCJingCaiResultInfoMatchModel *mathInfoModel;

@end

NS_ASSUME_NONNULL_END
