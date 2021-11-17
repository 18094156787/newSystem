//
//  JCMyBuyAICell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCAIPlanPriceInfoView.h"
#import "JCAIPlanBuyInfoView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyBuyAICell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UIImageView *refundImgView;//不中退款

@property (nonatomic,strong) UIImageView *resultImgView;//开奖结果

@property (nonatomic,strong) UIView *timeView;

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic,strong) UIView *priceView;

@property (nonatomic,strong) UILabel *payPriceLab;

@property (nonatomic,strong) UILabel *orderDetailLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UIImageView *indicateImgView;

//@property (nonatomic, strong) JCAIPlanPriceInfoView *priceView;

@property (nonatomic, strong) JCAIPlanBuyInfoView *buyInfoView;

@property (nonatomic, assign) BOOL showPriceView;

@property (nonatomic, strong) JCHongBangBall *dianPingBall;

@property (nonatomic, assign) BOOL is_zh;//主客队带zh

@property (nonatomic, assign) BOOL is_round_num;//不显示周几00,显示第几轮

@property (nonatomic, assign) BOOL isMine;

@property (nonatomic,copy) void(^JCBlock)(void);

@end

NS_ASSUME_NONNULL_END
