//
//  JCDataBaseMatchModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDataBaseMatchModel : JCWBaseBall

@property (nonatomic,copy) NSString *event_id;

@property (nonatomic,copy) NSString *event_logo;

//@property (nonatomic,copy) NSString *short_name_zh;

@property (nonatomic,copy) NSString *event_name;

#pragma mark//新版接口

@property (nonatomic,copy) NSString *competition_id;

@property (nonatomic,copy) NSString *short_name_zh;

@property (nonatomic,copy) NSString *logo;

@property (nonatomic,copy) NSString *competition_logo;

@property (nonatomic,copy) NSString *competition_name;

@property (nonatomic,copy) NSString *country_id;

@property (nonatomic,copy) NSString *category_id;

@property (nonatomic,copy) NSString *name_zh;

@property (nonatomic,copy) NSString *name_en;


@end

NS_ASSUME_NONNULL_END
