//
//  JCMyBuyHongbangCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCHongBangCommomPriceView.h"
#import "JCHongBangWaitCheckView.h"
#import "JCHongBangCheckFailureView.h"
#import "JCPostImageModel.h"
#import "JCAIPlanPriceInfoView.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^JCDianPingMatchClickBlock)(NSString * _Nullable matchNum);
typedef void(^JCDianPingUserClickBlock)(NSString * _Nullable tjUserId);

@interface JCMyBuyHongbangCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UIView *userInfoBgView;

@property (nonatomic,strong) UIView *userClickView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nearLab;//近几中几

@property (nonatomic,strong) UILabel *hongLab;//连红

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *yllLab;//盈利率

@property (nonatomic,strong) UILabel *yllInfoLab;//盈利率信息

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *refundImgView;//不中退款

@property (nonatomic,strong) UIImageView *resultImgView;//开奖结果

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic,strong) UIView *timeView;

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic,strong) UIView *priceView;

@property (nonatomic,strong) UILabel *payPriceLab;

@property (nonatomic,strong) UILabel *orderDetailLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

@property (nonatomic, strong) JCAIPlanPriceInfoView *priceInfoView;

@property (assign, nonatomic) BOOL hideUserView;

@property (assign, nonatomic) BOOL hideImage;

@property (assign, nonatomic) BOOL showImage;

@property (strong, nonatomic) JCHongBangBall * dianPingBall;

@property (copy, nonatomic) JCDianPingMatchClickBlock matchClickBlock;

@property (copy, nonatomic) JCDianPingUserClickBlock userClickBlock;

@property (nonatomic, assign) BOOL isMine;//是自己购买的,在以购方案中使用

@property (nonatomic, copy) void(^JCLikeBlock)(void);

@property (nonatomic, copy) void(^JCShareBlock)(void);

@property (nonatomic, copy) void(^JCEditBlock)(JCHongBangBall *model);

@property (nonatomic,copy) void(^JCBlock)(void);

@property (nonatomic, assign) BOOL is_zh;//主客队带zh

@property (nonatomic, assign) BOOL is_round_num;//不显示周几00,显示第几轮

@end

NS_ASSUME_NONNULL_END
