//
//  JCBigDataZhishuModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBigDataZhishuModel : JCWBaseBall

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *higt;

@property (nonatomic,copy) NSString *low;

@property (nonatomic,copy) NSString *average;

@property (nonatomic,copy) NSString *kl;

@property (nonatomic,copy) NSString *trend;

@property (nonatomic,copy) NSString *trend_up;

@property (nonatomic,copy) NSString *trend_same;

@property (nonatomic,copy) NSString *trend_down;

@end

NS_ASSUME_NONNULL_END
