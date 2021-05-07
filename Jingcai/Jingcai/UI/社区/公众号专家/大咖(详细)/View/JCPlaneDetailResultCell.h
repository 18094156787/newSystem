//
//  JCPlaneDetailResultCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailResultCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;

@end

NS_ASSUME_NONNULL_END
