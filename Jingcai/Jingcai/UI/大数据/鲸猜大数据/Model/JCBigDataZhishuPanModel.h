//
//  JCBigDataZhishuPanModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBigDataZhishuPanModel : JCWBaseBall

@property (nonatomic,copy) NSString *company_name;

@property (nonatomic,copy) NSString *company_id;

@property (nonatomic,copy) NSString *win;

@property (nonatomic,copy) NSString *lose;

@property (nonatomic,copy) NSString *equal;

@property (nonatomic,copy) NSString *start_win;

@property (nonatomic,copy) NSString *start_equal;

@property (nonatomic,copy) NSString *start_lose;

@property (nonatomic,copy) NSString *win_color;

@property (nonatomic,copy) NSString *equal_color;

@property (nonatomic,copy) NSString *lose_color;



@end

NS_ASSUME_NONNULL_END
