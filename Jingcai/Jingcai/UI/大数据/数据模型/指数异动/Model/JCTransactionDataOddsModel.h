//
//  JCTransactionDataOddsModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCTransactionDataChangeFlagModel.h"
#import "JCTransactionDataChangeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataOddsModel : JCWBaseBall

@property (nonatomic, strong)JCTransactionDataChangeModel *changeArr;

@property (nonatomic, strong) NSArray *immediateArr;

@end

NS_ASSUME_NONNULL_END
