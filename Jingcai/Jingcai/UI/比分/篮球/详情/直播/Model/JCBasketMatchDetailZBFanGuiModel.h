//
//  JCBasketMatchDetailZBFanGuiModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketMatchDetailZBFanGuiModel : JCWBaseBall

@property (nonatomic,strong) NSString *home_zt;

@property (nonatomic,strong) NSString *away_zt;

@property (nonatomic,strong) NSString *home_fg;

@property (nonatomic,strong) NSString *away_fg;

#pragma mark //新版本接口

@property (nonatomic,strong) NSString *home_fgcs;

@property (nonatomic,strong) NSString *away_fgcs;

@property (nonatomic,strong) NSString *home_syzt;

@property (nonatomic,strong) NSString *away_syzt;

@end

NS_ASSUME_NONNULL_END
