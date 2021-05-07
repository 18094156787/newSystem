//
//  JCPostPlanRequestModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/31.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN



@interface JCPostPlanRequestModel : JCWBaseBall

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *titleInfo;

@property (nonatomic,strong) NSString *match_num;

@property (nonatomic,strong) NSString *spf;

@property (nonatomic,strong) NSString *is_rq;

@property (nonatomic,strong) NSString *rq;
#pragma mark //新版本接口

@property (nonatomic,strong) NSString *match_id;

@property (nonatomic,strong) NSString *week_number;


@end


NS_ASSUME_NONNULL_END
