//
//  JCPlaneDetailInfoTipCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWTjInfoBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailInfoTipCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UILabel *resultLab;

@property (nonatomic,strong) JCWTjInfoBall *infoModel;

@property (nonatomic,strong) JCWTjInfoBall *freeDetailModel;//免费方案详情

@end

NS_ASSUME_NONNULL_END
