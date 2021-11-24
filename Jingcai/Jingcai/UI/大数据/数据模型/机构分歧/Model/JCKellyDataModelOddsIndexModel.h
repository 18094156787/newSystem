//
//  JCKellyDataModelOddsIndexModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelOddsIndexModel : JCWBaseBall

@property (nonatomic,strong) NSString *loss_ratio;//指数

@property (nonatomic,strong) NSArray *odds;

@property (nonatomic,strong) NSArray *odds_rate;

@property (nonatomic,strong) NSArray *kelly_index;//机构分歧

@property (nonatomic,strong) NSArray *kelly_variance;//凯利方差

@end

NS_ASSUME_NONNULL_END
