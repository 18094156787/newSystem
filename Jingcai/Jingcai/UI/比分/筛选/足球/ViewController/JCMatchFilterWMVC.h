//
//  JCMatchFilterWMVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "WMPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFilterWMVC : WMPageController

@property (nonatomic,strong) NSString *time;//塞选日期

@property (nonatomic,strong) NSString *type;//塞选类型

//筛选类别 1首页重要 等于 重要+筛选+北单 并集 2筛选-重要 3筛选-全部 4筛选-竟足 5筛选-北单 默认3
@property (nonatomic,copy) void(^JCFilterBlock)(NSArray *eventIdArray,NSString *screening);

@end

NS_ASSUME_NONNULL_END
