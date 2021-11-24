//
//  JCTransactionDataSimialModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataSimialModel : JCWBaseBall

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *win_rate;

@property (nonatomic, copy) NSString *draw_rate;

@property (nonatomic, copy) NSString *loss_rate;

@end

NS_ASSUME_NONNULL_END
