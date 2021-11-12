//
//  JCPlanDetailMZ_Cell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCDaShangView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlanDetailMZ_Cell : JCBaseTableViewCell_New

@property (nonatomic,strong) JCDaShangView *dsView;//打赏

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;

@end

NS_ASSUME_NONNULL_END
