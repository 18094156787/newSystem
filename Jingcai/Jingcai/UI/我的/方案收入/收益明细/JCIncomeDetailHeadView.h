//
//  JCIncomeDetailHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCMyIncomeTitleModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCIncomeDetailHeadView : JCBaseView

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *moneyLab;

@property (nonatomic,strong) JCMyIncomeTitleModel *model;

@end

NS_ASSUME_NONNULL_END
