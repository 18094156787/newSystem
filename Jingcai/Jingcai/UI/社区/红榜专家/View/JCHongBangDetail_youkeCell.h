//
//  JCHongBangDetail_youkeCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWTjInfoDetailBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangDetail_youkeCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic, strong) UIImageView * allView;

@property (nonatomic,strong) UIView *bugUserView;//已购买用户

@property (nonatomic,strong) UILabel *countLab;//购买人数

@property (nonatomic,strong) UILabel *freeLab;//免费

@property (nonatomic,strong) UIView *priceInfoView;//价格信息

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *priceLab;//价格

@property (nonatomic,strong) UILabel *refundLab;//不中返还

@property (nonatomic,strong) UILabel *payPriceLab;//实付价格

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIButton *seeBtn;

@property (nonatomic,strong) JCWTjInfoDetailBall *tjInfoDetailBall;

@property (nonatomic,copy) void(^JCLoginBlock)(void);

@end

NS_ASSUME_NONNULL_END
