//
//  JCYCTopUserInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCYCUserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCTopUserInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *red_num;//连红

@property (nonatomic,strong) NSString *hit_num;//命中场次

@property (nonatomic,strong) NSString *top_num;//上榜次数

@property (nonatomic,strong) JCYCUserInfoModel *user_info;

@property (nonatomic,strong) NSString *top;

@end

NS_ASSUME_NONNULL_END
