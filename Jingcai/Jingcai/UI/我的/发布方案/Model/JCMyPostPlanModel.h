//
//  JCMyPostPlanModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/1/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMyPostPlanModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *user_id;

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *content;

@property (nonatomic,strong) NSString *status; //状态 1 通过  0 审核中 2 不通过

@property (nonatomic,strong) NSString *error; //不通过理由

@property (nonatomic,strong) NSString *status_type; //状态

@property (nonatomic,strong) NSString *type;


@end

NS_ASSUME_NONNULL_END
