//
//  JCEventScoreXiaoZuModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

    @interface JCEventScoreXiaoZuModel : JCWBaseBall

@property (nonatomic,strong) NSString *position;

@property (nonatomic,strong) NSString *won;

@property (nonatomic,strong) NSString *loss;

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *goals_against;

@property (nonatomic,strong) NSString *points;

@property (nonatomic,strong) NSString *draw;

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *goals;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *team_id;

@end

NS_ASSUME_NONNULL_END
