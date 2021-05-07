//
//  JCCommunityEventModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/26.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCCommunityEventModel : JCWBaseBall

@property (nonatomic,copy) NSString *win;

@property (nonatomic,copy) NSString *equal;

@property (nonatomic,copy) NSString *lose;

@property (nonatomic,copy) NSString *event_id;

@property (nonatomic,copy) NSString *profit;

@property (nonatomic,copy) NSString *target;

@property (nonatomic,copy) NSString *event_name;

#pragma mark//新版本接口

@property (nonatomic,copy) NSString *competition_name;

@end

NS_ASSUME_NONNULL_END
