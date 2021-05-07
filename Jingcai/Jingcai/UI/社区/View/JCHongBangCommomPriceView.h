//
//  JCHongBangCommomPriceView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDianPingBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangCommomPriceView : JCBaseView

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UIImageView *hbIconImgView;

@property (nonatomic, strong) UILabel *priceLab;

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UILabel *likeLab;

@property (nonatomic, strong) JCDianPingBall *dianPingBall;



@end

NS_ASSUME_NONNULL_END
