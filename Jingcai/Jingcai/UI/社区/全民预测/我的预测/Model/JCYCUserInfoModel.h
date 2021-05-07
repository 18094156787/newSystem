//
//  JCYCUserInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCJingCaiResultMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCUserInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *top;//是否签约 1签约

@property (nonatomic,strong) NSString *rank_count;//上榜次数 0 没有上过

@property (nonatomic,strong) NSString *lianhong;//周连红

@property (nonatomic,strong) NSString *mingzhong;//周命中

@property (nonatomic,strong) NSString *week_rank;

@property (nonatomic,strong) NSString *user_name;

@property (nonatomic,strong) NSString *user_img;

@property (nonatomic,strong) NSString *user_id;

@property (nonatomic,strong) NSString *yc_desc;

@property (nonatomic,strong) NSString *week;

@property (nonatomic,strong) NSString *future_msg;

@property (nonatomic,strong) NSArray <JCYCUserInfoModel *>*future_info;

@end

NS_ASSUME_NONNULL_END
