//
//  JCMyJingCaiInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/29.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMyJingCaiInfoModel : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *user_id;

@property (nonatomic,copy) NSString *tjcount;

@property (nonatomic,copy) NSString *top;

@property (nonatomic,copy) NSString *lianhong;

@property (nonatomic,copy) NSString *dc_lianhong;

@property (nonatomic,copy) NSString *histor_hong;

@property (nonatomic,copy) NSString *all_money;

@property (nonatomic,copy) NSString *is_out;//可提现余额

@property (nonatomic,copy) NSString *buy_tuijian;

@property (nonatomic,copy) NSString *gz;

@property (nonatomic,copy) NSString *my_gz;

@property (nonatomic,copy) NSString *dai_hong;

@property (nonatomic,copy) NSString *time;

@property (nonatomic,copy) NSString *status;//0是未关注 1是已关注

@property (nonatomic,copy) NSString *created_at;

@property (nonatomic,copy) NSString *user_img;

@property (nonatomic,copy) NSString *user_name;

@property (nonatomic,copy) NSString *yll;

@property (nonatomic,copy) NSString *zhong;

@property (nonatomic,copy) NSString *dc_zhong;

@property (nonatomic,copy) NSString *hb_tuijian;

@property (nonatomic,assign) BOOL isTwoForOne;//是否为二串一

@end

NS_ASSUME_NONNULL_END
