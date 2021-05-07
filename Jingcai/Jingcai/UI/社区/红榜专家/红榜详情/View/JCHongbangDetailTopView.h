//
//  JCHongbangDetailTopView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCWTjInfoDetailBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangDetailTopView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIView *userView;

@property (nonatomic,strong) UIView *infoView;

@property (nonatomic,strong) UIImageView *backImgView;

@property (nonatomic,strong) UIView *headImgbgView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UIImageView *qyImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UILabel *daiHongLab;//（已带红10人）

@property (nonatomic,strong) UIButton *concernBtn;//关注按钮

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *refundLab;//不中返还

@property (nonatomic,strong) UIView *orderDetailView;

@property (nonatomic,strong) UILabel *orderDetailLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic, strong) UIImageView * resImageView;//开奖结果

@property (nonatomic,strong) UILabel *typeLab;

@property (nonatomic,strong) JCWExpertBall *expertDetailModel;//专家详情

@property (nonatomic,strong) JCWTjInfoDetailBall *tjInfoDetailBall;

@property (nonatomic,copy) void(^ShowAllBlock)(float height);

@property (nonatomic,assign) BOOL isAdd;//是否是新增关注，yes表示新增关注,no表示取消关注

@property (nonatomic,assign) BOOL showResult;//是否展示开奖结果图标

@property (nonatomic,copy) void(^JCOrderDetailBlock)(void);

@property (nonatomic,copy) void(^JCPushBlock)(void);



@end

NS_ASSUME_NONNULL_END
