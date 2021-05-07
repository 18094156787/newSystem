//
//  JCHongBangBall.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCHongBangMatchModel.h"
#import "JCHongBangTjModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangBall : JCWBaseBall

@property (strong, nonatomic) JCHongBangTjModel *base_info;

@property (strong, nonatomic) NSArray <JCHongBangMatchModel *>*zucai_tuijian_match;


@end

NS_ASSUME_NONNULL_END
