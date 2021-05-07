//
//  JCAIPlanTableCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCAIPlanPriceInfoView.h"
#import "JCAIPlanBuyInfoView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCAIPlanTableCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UIImageView *refundImgView;//不中退款

@property (nonatomic,strong) UIImageView *resultImgView;//开奖结果

@property (nonatomic, strong) JCAIPlanPriceInfoView *priceView;

@property (nonatomic, strong) JCAIPlanBuyInfoView *buyInfoView;

@property (nonatomic, assign) BOOL showPriceView;

@property (nonatomic, strong) JCHongBangBall *dianPingBall;

@property (nonatomic, assign) BOOL is_zh;//主客队带zh

@property (nonatomic, assign) BOOL is_round_num;//不显示周几00,显示第几轮

@property (nonatomic, assign) BOOL isMine;

@end

NS_ASSUME_NONNULL_END
