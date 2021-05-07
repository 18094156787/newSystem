//
//  JCDakaPlanDetailAutherHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/11.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCFootBall_GZH_AuthorErCodeView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDakaPlanDetailAutherHeadView : JCBaseView

@property (nonatomic, strong) UIView *clickInfoView;

@property (nonatomic, strong) UIButton *backBtn;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIImageView *backImgView;

@property (nonatomic,strong) UIView *headImgbgView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *tagLab;

@property (nonatomic,strong) UILabel *daiHongLab;//（已带红10人）

//@property (nonatomic,strong) YYLabel *infoLab;

@property (nonatomic,strong) UIButton *erCodeBtn;//二维码

@property (nonatomic,strong) UIButton *concernBtn;//关注按钮

@property (nonatomic,strong) UIView *infoView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *refundLab;//不中返还或者不中补单

@property (nonatomic,strong) UILabel *ysLab;//预售

@property (nonatomic,strong) UIView *orderDetailView;

@property (nonatomic,strong) UILabel *orderDetailLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic,strong) JCWTjInfoBall *infoModel;



@property (nonatomic,copy) void(^JCOrderDetailBlock)(void);




@property (nonatomic,strong)  JCFootBall_GZH_AuthorErCodeView *codeView;

@property (nonatomic,strong) JCWExpertBall *expertDetailModel;//专家详情

@property (nonatomic,copy) void(^ShowAllBlock)(float height);

@property (nonatomic,copy) void(^JCPushBlock)(void);

@property (nonatomic,assign) BOOL isAdd;//是否是新增关注，yes表示新增关注,no表示取消关注

@property (nonatomic,assign) BOOL isHongbang;//默认no大咖,yes是红榜,用来区分一些显示的字段

@property (nonatomic,assign) BOOL isMine;//yes表示个人的信息页面

@end

NS_ASSUME_NONNULL_END
