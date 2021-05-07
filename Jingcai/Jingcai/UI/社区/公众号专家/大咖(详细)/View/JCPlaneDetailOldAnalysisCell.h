//
//  JCPlaneDetailOldAnalysisCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/6.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailOldAnalysisCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;

@end

NS_ASSUME_NONNULL_END
