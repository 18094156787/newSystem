//
//  JCHongbangPriceInfoView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCWTjInfoDetailBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangPriceInfoView : JCBaseView

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, strong) UILabel *oriPriceLab;//原价

@property (nonatomic, strong) UIImageView *thIconImgView;//特价标签

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, copy) void(^JCSureBtnClickBlock)(void);

@property (nonatomic, strong) JCWTjInfoDetailBall *tjInfoDetailBall;

@property (nonatomic, strong) NSString *price;

@end

NS_ASSUME_NONNULL_END
