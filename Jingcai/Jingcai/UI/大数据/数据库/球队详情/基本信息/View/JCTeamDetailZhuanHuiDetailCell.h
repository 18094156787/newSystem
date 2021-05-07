//
//  JCTeamDetailZhuanHuiDetailCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamDetailZhuanHuiModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailZhuanHuiDetailCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *teamLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCTeamDetailZhuanHuiModel *model;


@end

NS_ASSUME_NONNULL_END
