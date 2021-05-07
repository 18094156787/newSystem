//
//  JCYCRankModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYCRankModel : JCWBaseBall

@property (nonatomic,strong) NSString *top;//是否签约 1签约

@property (nonatomic,strong) NSString *history_hong;

@property (nonatomic,strong) NSString *lianhong;

@property (nonatomic,strong) NSString *mingzhong;

@property (nonatomic,strong) NSString *user_img;

@property (nonatomic,strong) NSString *user_name;

@property (nonatomic,strong) NSString *user_id;

@property (nonatomic,strong) NSString *tuijian_count;

@property (nonatomic,assign) NSInteger jump;//0不跳转 1是跳转

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *histroy_hong;

@property (nonatomic,strong) NSString *use;

@property (nonatomic,strong) NSString *code;

@property (nonatomic,strong) NSString *guess_user_infor_top;//是否签约 1已经签约

@property (nonatomic,strong) NSString *guess_user_infor_top_rank;//上榜次数

@property (nonatomic,strong) NSString *guess_user_infor_tuijian_count;//发布的篇数

@property (nonatomic,strong) NSString *guess_user_infor_histroy_hong;//历史最高连红数

@end

NS_ASSUME_NONNULL_END
