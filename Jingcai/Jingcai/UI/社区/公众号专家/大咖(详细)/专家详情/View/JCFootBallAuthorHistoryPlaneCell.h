//
//  JCFootBallAuthorHistoryPlaneCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/9.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCFootBallAuthorHistoryPlaneCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *timeLab;//时间

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *scroeLab;//分数

@property (nonatomic,strong) UILabel *refundLab;

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UIImageView *ysImgView;

@property (strong, nonatomic) UILabel *likeLab;

@property (strong, nonatomic) UIView *lineView;

@property (nonatomic,assign) BOOL isNew;//最新方案

@property (nonatomic,assign) BOOL isTop;//顶部没有间距

@property (nonatomic,assign) BOOL is_column;//专栏标记,是专栏,则时间统一用发布时间

@property (nonatomic,strong) JCWTjInfoBall *model;
@end

NS_ASSUME_NONNULL_END
