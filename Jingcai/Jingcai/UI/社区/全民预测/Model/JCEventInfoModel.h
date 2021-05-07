//
//  JCEventInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCEventInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *short_name_zh;

@property (nonatomic,strong) NSString *initials;

@property (nonatomic,strong) NSString *event_id;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *competition_id;

@property (nonatomic,strong) NSString *competition_name;

@property (nonatomic,strong) NSString *name_zh;

@property (nonatomic,strong) NSString *short_name_zht;

@property (nonatomic,strong) NSString *logo;

@end

NS_ASSUME_NONNULL_END
