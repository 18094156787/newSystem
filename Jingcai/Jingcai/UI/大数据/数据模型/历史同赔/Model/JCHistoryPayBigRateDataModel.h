//
//  JCHistoryPayBigRateDataModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayBigRateDataModel : JCWBaseBall

@property (nonatomic,strong) NSString *rate;

@property (nonatomic,strong) NSString *result;

@property (nonatomic,strong) NSArray *spf;

@property (nonatomic,strong) NSString *spf_desc;

@end

NS_ASSUME_NONNULL_END
