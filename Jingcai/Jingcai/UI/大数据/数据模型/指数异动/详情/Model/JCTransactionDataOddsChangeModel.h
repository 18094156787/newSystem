//
//  JCTransactionDataOddsChangeModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCTransactionDataChangeFlagModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataOddsChangeModel : JCWBaseBall

@property (nonatomic, strong) NSString *change_type_name;

@property (nonatomic, strong) NSString *odds_change_name;

@property (nonatomic, strong) NSArray *compare_odds_change_data;

@end

NS_ASSUME_NONNULL_END
