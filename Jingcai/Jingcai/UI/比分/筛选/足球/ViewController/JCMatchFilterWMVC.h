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


@property (nonatomic,strong) NSString *type;//type 0赛程 1进行中 2完场 不传默认0


@property (nonatomic,copy) void(^JCFilterBlock)(NSArray *eventIdArray,NSString *screening);

@end

NS_ASSUME_NONNULL_END
