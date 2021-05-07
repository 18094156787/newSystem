//
//  JCActivityDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCActivityGoodsModel.h"
#import "JCActivityOptionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityDetailModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;//

@property (nonatomic,strong) NSString *title;//活动标题

@property (nonatomic,strong) NSString *type;//活动类型 1跳转已有的活动 2福利活动 3充值活动 4竞猜活动

@property (nonatomic,strong) NSString *scope;//活动用户范围 0全部用户 1普通用户 2红榜达人

@property (nonatomic,strong) NSString *top;//活动置顶 1置顶 0未置顶

@property (nonatomic,strong) NSString *houtai_id;//活动创建人

@property (nonatomic,strong) NSString *pay_total;//实际付款金额

@property (nonatomic,strong) NSString *pay_times;//订单数

@property (nonatomic,strong) NSString *start_time;//活动开始时间

@property (nonatomic,strong) NSString *end_time;//活动结束时间

@property (nonatomic,strong) NSString *top_image_url;//活动内部顶部底图地址

@property (nonatomic,strong) NSString *top_image_url_width;//活动内部顶部底图宽度

@property (nonatomic,strong) NSString *top_image_url_height;//活动内部顶部底图高度

@property (nonatomic,strong) NSString *background_color;//活动内部背景底色色值

@property (nonatomic,strong) NSString *rule;//活动规则

@property (nonatomic,strong) NSString *activity_cycle;//活动周期 1每天 2每周 3每月 4整个活动周期

@property (nonatomic,strong) NSString *receive_cycle;//奖励领取周期 1每天 2每周 3每月 4整个活动周期

@property (nonatomic,strong) NSString *url;//活动跳转url

@property (nonatomic,strong) NSString *show;//上架状态 1已上架 2未上架

@property (nonatomic,strong) NSString *pay_type;//充值金额计算方式 1 每累计充值金额 2累计充值金额 3账户首充 4周期首充

@property (nonatomic,strong) NSString *option;//用户可选个数

@property (nonatomic,strong) NSString *option_correct;//用户需猜对个数

@property (nonatomic,strong) NSString *prize;//是否已开奖 1未开奖 2已开奖 3已发奖

@property (nonatomic,strong) NSString *status;//状态 1正常 2已删除

@property (nonatomic,strong) NSString *created_at;//创建时间

@property (nonatomic,strong) NSString *updated_at;//更新时间

@property (nonatomic,strong) NSString *is_participate;//是否参加了 1是 2否

@property (nonatomic,strong) NSString *count;//活动奖励总量

@property (nonatomic,strong) NSString *quantity_received;//已领取数量

@property (nonatomic,strong) NSString *remaining_quantity;//剩余总量

@property (nonatomic,strong) NSString *cumulative_recharge;//累计充值金额

@property (nonatomic,strong) NSString *active_state;//活动状态 1未开始 2进行中 3已结结束

@property (nonatomic,strong) NSString * text_prompt;//文字提示

@property (nonatomic,strong) NSString *text_can_click;//获取文字是否可以点击 1是 2否

@property (nonatomic,assign) NSInteger is_guess;//是否猜中 1是 2否

@property (strong, nonatomic) JCShareModel *wechat_share;

@property (strong, nonatomic)  NSArray <JCActivityGoodsModel *> *goods_info;

@property (strong, nonatomic)  NSArray <JCActivityOptionModel *> *activity_option;//竞猜活动选项


@end

NS_ASSUME_NONNULL_END
