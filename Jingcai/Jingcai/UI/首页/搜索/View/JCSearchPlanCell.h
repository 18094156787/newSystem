//
//  JCSearchPlanCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCDianPingBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCSearchPlanCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) JCDianPingBall *model;

@end

NS_ASSUME_NONNULL_END
