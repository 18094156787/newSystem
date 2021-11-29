//
//  JCHistoryPayDataModeVSModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayDataModeVSModel : JCWBaseBall

@property (nonatomic,assign) NSInteger won_rate;

@property (nonatomic,assign) NSInteger draw_rate;

@property (nonatomic,assign) NSInteger loss_rate;

@property (nonatomic,assign) NSInteger won;

@property (nonatomic,assign) NSInteger draw;

@property (nonatomic,assign) NSInteger loss;

@property (nonatomic,assign) NSInteger count;
@end

NS_ASSUME_NONNULL_END
