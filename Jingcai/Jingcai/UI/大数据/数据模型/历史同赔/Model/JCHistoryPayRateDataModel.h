//
//  JCHistoryPayRateDataModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayRateDataModel : JCWBaseBall

@property (nonatomic,strong) NSString *won;

@property (nonatomic,strong) NSString *draw;

@property (nonatomic,strong) NSString *loss;

@property (nonatomic,strong) NSString *total;

@end

NS_ASSUME_NONNULL_END
