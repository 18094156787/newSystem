//
//  JCAIPlanMatchTableCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCAIPlanMatchTableCell : JCBaseTableViewCell_New

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UIImageView *refundImgView;

@property (nonatomic, strong) UIImageView *statusImgView;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) BOOL is_zh;//主客队带zh

@property (nonatomic, assign) BOOL is_round_num;//不显示周几00,显示第几轮

@property (nonatomic, strong) JCHongBangBall *dianPingBall;

@property (nonatomic, strong) JCHongBangMatchModel *model;

@property (nonatomic, strong) NSDictionary *matchDic;



@end

NS_ASSUME_NONNULL_END
