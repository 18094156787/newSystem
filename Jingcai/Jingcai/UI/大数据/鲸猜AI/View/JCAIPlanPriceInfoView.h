//
//  JCAIPlanPriceInfoView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCAIPlanPriceInfoView : JCBaseView

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UIImageView *hbIconImgView;

@property (nonatomic, strong) UILabel *priceLab;

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UILabel *likeLab;

@property (strong, nonatomic) UILabel *buyStatusLab;//购买状态

@property (nonatomic, assign) BOOL isMine;//是自己购买的,在以购方案中使用

@property (nonatomic, assign) BOOL hideSee;//隐藏浏览人数

@property (nonatomic, strong) JCHongBangBall *dianPingBall;

@end

NS_ASSUME_NONNULL_END
