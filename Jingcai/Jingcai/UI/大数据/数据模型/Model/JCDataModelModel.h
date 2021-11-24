//
//  JCDataModelModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDataModelModel : JCWBaseBall

@property (nonatomic, assign) NSInteger big_data_price;//价格，为0时展示免费

@property (nonatomic, assign) NSInteger current_count;//订阅人数

@property (nonatomic, copy) NSString * id;//1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5机构分歧 6.指数分歧

@property (nonatomic, copy) NSString *image_url;

@property (nonatomic, copy) NSString *introduce;//说明文字

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *title;//标题

@property (nonatomic, assign) NSInteger is_subscrib;//是否在订阅期间,1是，0否

@end

NS_ASSUME_NONNULL_END
