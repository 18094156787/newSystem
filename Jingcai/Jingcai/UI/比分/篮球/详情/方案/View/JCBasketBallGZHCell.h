//
//  JCBasketBallGZHCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
typedef void(^JCDianPingUserClickBlock)(NSString * _Nullable tjUserId);
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallGZHCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) KKPaddingLabel *tagLab;

@property (nonatomic,strong) UIView *userClickView;


@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *refundLab;

@property (strong, nonatomic) UIButton *shareBtn;//分享按钮不要了2020.8.19

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *shareImgView;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UILabel *shareLab;

@property (strong, nonatomic) UILabel *likeLab;

@property (nonatomic,strong) UIView *lineView;

@property (copy, nonatomic) JCDianPingUserClickBlock userClickBlock;

@property (nonatomic,assign) BOOL isDetail;

@property (nonatomic,strong) JCWTjInfoBall *model;


@end

NS_ASSUME_NONNULL_END
