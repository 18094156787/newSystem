//
//  JCEventScoreLianSaiInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCEventScorePromotionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCEventScoreLianSaiInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *position;

@property (nonatomic,strong) NSString *team_logo;

@property (nonatomic,strong) NSString *team_name;

@property (nonatomic,strong) NSString *team_id;

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *won;

@property (nonatomic,strong) NSString *draw;

@property (nonatomic,strong) NSString *loss;

@property (nonatomic,strong) NSString *goals;

@property (nonatomic,strong) NSString *goals_against;

@property (nonatomic,strong) NSString *points;

@property (nonatomic,strong) NSString *promotion_name;

@property (nonatomic,strong) NSString *promotion_color;

@property (nonatomic,strong) NSString *group;

@property (nonatomic,strong) JCEventScorePromotionModel *promotion;

@end

NS_ASSUME_NONNULL_END
