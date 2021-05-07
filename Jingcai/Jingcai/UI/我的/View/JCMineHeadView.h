//
//  JCMineHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/11.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCMineHeadItemView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMineHeadView : JCBaseView

@property (nonatomic,strong) UIView *topBgView;

@property (nonatomic,strong) UIView *userInfoView;

@property (nonatomic,strong) UIView *userBackView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UIImageView *qyImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *fensiLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic,strong) UIView *itemBgView;

@property (nonatomic,strong) JCMineHeadItemView *yhqView;//优惠券

@property (nonatomic,strong) JCMineHeadItemView *gzView;//关注

@property (nonatomic,strong) JCMineHeadItemView *msgView;//消息

@property (nonatomic,strong) UILabel *moneyLab;

@property (nonatomic,strong) UILabel *moneyInfoLab;

@property (nonatomic,strong) UIImageView *moneyImageView;

@property (nonatomic,strong) UIButton *rechargeBtn;//充值

@property (nonatomic,strong) UILabel *loginLab;

@property (nonatomic,strong) UILabel *qyLab;//申请签约

@property (nonatomic, copy) void(^btnClickBlock)(NSInteger value);

@property (nonatomic, copy) void(^JCQianYueBlock)(void);

@property (nonatomic, strong) JCWUserBall * userBall;

@property (nonatomic, strong) NSString * money;//余额

@property (nonatomic, copy) NSString * headUrl;//

- (void)clearUser;

@end

NS_ASSUME_NONNULL_END
