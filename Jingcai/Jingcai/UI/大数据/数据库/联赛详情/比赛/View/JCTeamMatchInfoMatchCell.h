//
//  JCTeamMatchInfoMatchCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoMatchCell : JCBaseTableViewCell_New


@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIView *layerView;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, strong) UILabel *planCountLab;//方案数量

@property (nonatomic, strong) UIImageView *planImgView;

@property (nonatomic, strong) UILabel *scoreLab;

@property (nonatomic, strong) UILabel *matchWeekLab;

@property (nonatomic, strong) UILabel *halfScoreLab;

@property (nonatomic, strong) UIImageView *homeImgView;

@property (nonatomic, strong) UIImageView *awayImgView;

@property (nonatomic, strong) UILabel *homeNameLab;

@property (nonatomic, strong) UILabel *awayNameLab;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIImageView *resultImgView;

@property (nonatomic,assign) BOOL isCircle;//是否显示圆角

@property (nonatomic, strong) JCTeamMatchModel *model;

@property(nonatomic,assign) BOOL showResult;//是否显示胜平负图标

@end

NS_ASSUME_NONNULL_END
