//
//  JCHistoryPayDataModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCHistoryPayRateDataModel.h"
#import "JCHistoryPayBigRateDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayDataModel : JCWBaseBall

@property (nonatomic,strong) JCHistoryPayRateDataModel *begin_odds;

@property (nonatomic,strong) JCHistoryPayRateDataModel *begin_count;

@property (nonatomic,strong) JCHistoryPayRateDataModel *begin_rate;

@property (nonatomic,strong) JCHistoryPayBigRateDataModel *begin_big_rate;

@property (nonatomic,strong) JCHistoryPayRateDataModel *last_odds;

@property (nonatomic,strong) JCHistoryPayRateDataModel *last_count;

@property (nonatomic,strong) JCHistoryPayRateDataModel *last_rate;

@property (nonatomic,strong) JCHistoryPayBigRateDataModel *last_big_rate;


@end

NS_ASSUME_NONNULL_END
