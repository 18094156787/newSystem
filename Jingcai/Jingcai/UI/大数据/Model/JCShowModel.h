//
//  JCShowModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCShowModel : JCWBaseBall

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *is_show_big_data;//是否展示大数据

@property (nonatomic,strong) NSString *is_show_whale_ai;//是否展示鲸猜ai

@property (nonatomic,strong) NSString *is_show_database;//是否展示数据库

@end

NS_ASSUME_NONNULL_END
