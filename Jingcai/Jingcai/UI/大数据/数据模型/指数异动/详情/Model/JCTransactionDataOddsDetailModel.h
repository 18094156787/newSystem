//
//  JCTransactionDataOddsDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataOddsDetailModel : JCWBaseBall

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *home_winner;

@property (nonatomic, copy) NSString *draw;

@property (nonatomic, copy) NSString *away_winner;

@property (nonatomic, copy) NSString *update_time;

@end

NS_ASSUME_NONNULL_END
