//
//  JCKellyDataModelPayInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataModelPayInfoModel : JCWBaseBall

@property (nonatomic, assign) NSInteger big_data_day;//包月天数

@property (nonatomic, assign) NSInteger big_data_price;//实付价格

@property (nonatomic, assign) NSInteger current_count;//订阅人数

@property (nonatomic, copy) NSString *free_day;//免费体验天数,默认7天

@property (nonatomic, assign) long old_big_data_price;//旧价格

@property (nonatomic, assign) NSInteger server_time;//服务器时间

@property (nonatomic, assign) NSInteger show_status;//状态，1展示免费体验按钮，2展示剩余订阅天数和立即续费按钮，3展示立即订阅按钮 4数据模型下架

@property (nonatomic, assign) NSInteger model_status;//数据模型状态(status=2会用到),1免费体验中，2付费购买，显示立即续费,3下架 4免费（价格为0）

@property (nonatomic, strong) NSArray<NSString *> *user_img;

@property (nonatomic, assign) NSInteger distance_day;

@end

NS_ASSUME_NONNULL_END
