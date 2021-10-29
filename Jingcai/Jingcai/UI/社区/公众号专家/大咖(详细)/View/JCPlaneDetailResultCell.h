//
//  JCPlaneDetailResultCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCDakaColumnAssociatedView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailResultCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCDakaColumnAssociatedView *columnView;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;

@property (nonatomic,copy) void(^JCBlock)(void);

@end

NS_ASSUME_NONNULL_END
