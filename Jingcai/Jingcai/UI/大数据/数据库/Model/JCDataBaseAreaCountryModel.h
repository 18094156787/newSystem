//
//  JCDataBaseAreaCountryModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCDataBaseMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDataBaseAreaCountryModel : JCWBaseBall

@property (nonatomic,copy) NSString *country_name;

@property (nonatomic,strong) NSArray *event;

@property (nonatomic,assign) BOOL is_show;//折叠与展开

#pragma mark //新版本接口

@property (nonatomic,copy) NSString *country_logo;

@property (nonatomic,copy) NSString *country_id;

@property (nonatomic,copy) NSString *category_id;

@property (nonatomic,copy) NSString *name_zh;

@property (nonatomic,copy) NSString *name_en;

@property (nonatomic,strong) NSArray *competition_info;

@end

NS_ASSUME_NONNULL_END
