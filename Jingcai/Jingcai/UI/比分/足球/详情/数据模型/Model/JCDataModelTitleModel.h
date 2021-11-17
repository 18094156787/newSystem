//
//  JCDataModelTitleModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/17.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDataModelTitleModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *introduce;

@property (nonatomic,strong) NSString *current_count;//总订阅人数

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *big_data_price;//价格

@property (nonatomic,strong) NSString *image_url;//图片地址

@property (nonatomic,assign) NSInteger is_subscrib;//是否订阅，1已订阅,0未订阅

@end

NS_ASSUME_NONNULL_END
