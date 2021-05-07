//
//  JCMyBuyDakaViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/16.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMyBuyDakaViewCell : JCBaseTableViewCell_New


@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UIView *userClickView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *refundLab;//不中返还

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UILabel *likeLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UIImageView*ysImgView;

@property (nonatomic,strong) JCWTjInfoBall *model;

@end

NS_ASSUME_NONNULL_END
