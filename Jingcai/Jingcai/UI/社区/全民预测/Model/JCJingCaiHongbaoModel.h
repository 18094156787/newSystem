//
//  JCJingCaiHongbaoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/11/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
@class JCJingCaiHongbaoInfoModel;
NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiHongbaoModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *classfly;//1是红榜,2是公众号

@property (nonatomic,assign) NSInteger type;//type  1 大额现金  2小额现金 3红币 4优惠券 5免单券

@property (nonatomic,strong) NSString *cjCount;//剩余抽奖次数

@property (nonatomic,strong) JCJingCaiHongbaoInfoModel *content;

@property (nonatomic,strong) JCJingCaiHongbaoInfoModel *get_content;

@end

@interface JCJingCaiHongbaoInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *classfly;//1是红榜,2是公众号

@property (nonatomic,strong) NSString *goto_type;//1公众号,2红榜

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *wx_name;

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSString *tx_time;//提现时间

@property (nonatomic,assign) NSInteger use;// 1 未使用 2 使用  3提现中 4 提现失败

@property (nonatomic,strong) NSString *use_type;

@property (nonatomic,strong) NSString *status;//过期情况 1 正常  2过期

@property (nonatomic,strong) NSString *scope;

@property (nonatomic,strong) NSString *day;

@property (nonatomic,strong) NSString *condition;//使用条件

#pragma mark//新版本接口

@property (nonatomic,assign) NSInteger draw;//1未领取 2已领取


@property (nonatomic,assign) NSInteger type;//1是大额 2小额

@property (nonatomic,strong) NSString *desc;

@end

NS_ASSUME_NONNULL_END
