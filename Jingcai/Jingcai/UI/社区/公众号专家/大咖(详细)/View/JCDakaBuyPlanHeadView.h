//
//  JCDakaBuyPlanHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCWTjInfoBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDakaBuyPlanHeadView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCWTjInfoBall *payInfoModel;

@end

NS_ASSUME_NONNULL_END
