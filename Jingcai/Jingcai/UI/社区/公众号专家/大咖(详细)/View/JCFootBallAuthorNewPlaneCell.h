//
//  JCFootBallAuthorNewPlaneCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/9.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCFootBallAuthorNewPlaneCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *timeLab;//时间

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;//副标题

@property (nonatomic,strong) UILabel *refundLab;

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UILabel *likeLab;

@property (strong, nonatomic) UIImageView *ysImgView;

@property (nonatomic,strong) NSString *type;//1最新2历史 3是免费4是干货

@property (nonatomic,strong) JCWTjInfoBall *model;



@end

NS_ASSUME_NONNULL_END
