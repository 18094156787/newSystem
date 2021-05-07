//
//  JCPostPlanRequest_integerModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanRequest_integerModel : JCWBaseBall

@property (nonatomic,assign) int match_num;

@property (nonatomic,assign) int match_id;

@property (nonatomic,copy) NSString *spf;

@end

NS_ASSUME_NONNULL_END
