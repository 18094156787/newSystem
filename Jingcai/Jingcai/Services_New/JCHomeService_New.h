//
//  JCHomeService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHomeService_New : BaseService
//获取banner
//type 类型 0 不显示 1主页 2足球 3篮球 4论坛 5全民竞猜 6 社区 7 新版首页 必填
- (void)getAppBannerWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//tab开关
- (void)getHomeTabWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;//
//获取首页信息
- (void)getHomeDataWithType:(NSString *)article_type page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取热门搜索配置
- (void)getHomeSearchHotWordWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//首页-搜索
- (void)getHomeSearchDataWithContent:(NSString *)content page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;


//首页红包数据弹窗判断
- (void)getHomeCommonDataWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//新人红包
- (void)getNewPeoplePrizeWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//用户首登红包
- (void)getUserFirstLgoinPrizeWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//排行榜 -- （公众号专家 和 红榜达人）
//type 社区 -- （公众号专家 和 红榜达人）
- (void)getExpertListWithType:(NSString *)type page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//用户行为-关注
//type 1红榜达人 2公众号专家 必填
- (void)gzUserWithId:(NSString *)userId type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//特别关注(关注专家发布的方案)
- (void)getConcernExpertTuiJianWithpage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;

#pragma mark 公众号推荐相关
//公众号专家详情
// type 公众号方案类型 1表示最新的 2表示历史的 3表示免费的 4表示干货 必填 当type为1，2或3时字段是相同的，当为4时字段是不同的
- (void)getGZHT_TuijianExpertDetailWithExpert_id:(NSString *)expert_id type:(NSString *)type page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//公众号推荐详情
- (void)getGZHT_TuijianDetailWithTuijian_id:(NSString *)tuijian_id orderID:(NSString *)order_id type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//社区-方案详情关联比赛
- (void)getGZHT_TuijianDetailMatchListWithTuijian_id:(NSString *)tuijian_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//公众号推荐-推荐查看人数
- (void)getPlanLookWithTuijian_id:(NSString *)tuijian_id Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//公众号详情底部热门方案推荐(只有已截止的比赛才有)
- (void)getGZHT_TuijianListWithUserid:(NSString *)userid Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
#pragma mark 红榜推荐相关
//红榜专家详情
//type 为1时表示战绩 为2时表示方案 type值不同返回字段也不同 默认值为1
- (void)getHongbang_TuijianExpertDetailWithExpert_id:(NSString *)expert_id type:(NSString *)type page:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//红榜详情
- (void)getHongbang_TuijianDetailWithTuijian_id:(NSString *)tuijian_id orderID:(NSString *)order_id type:(NSString *)type  Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//红榜详情底部的方案
- (void)getHongbangDetail_Bottom_HotTj_WithTuijian_id:(NSString *)tuijian_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//确认订单
/*
 unique 不同购买场景下的关键值(scene=1时, unique为充值金额;scene=2时, unique为专家方案id;scene=3时, 0为包月,非0为单场比赛方案id;scene=4时, unique为红榜达人方案id;scene=5时, unique为ai发布到红榜达人的方案id)
 scene 下单购买场景(1充值, 2购买专家方案, 3购买大数据订阅, 4购买红榜方案, 5购买ai方案)
 source 客户端,订单来源(1 ios app,2 android app,3 (微信h5),5 公众号单独链接支付,6 PC,7 销售,8 订阅号,9 朋友圈,10 服务号,11 非微信h5浏览器(h5))
 
 **/
- (void)getConfirmOrderWithUnique:(NSString *)unique scene:(NSString *)scene source:(NSString *)source Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//下单并支付
/*
 order_key  订单key,唯一,下单凭证,有效期10分钟
 pay_type 支付方式(1支付宝支付, 2微信支付, 3红币支付, 4苹果支付)
 hongbao_id 红包id,默认为0
 coupon_id  免费券id,默认为0
 
 **/
- (void)getPayOrderWithOrder_key:(NSString *)order_key pay_type:(NSString *)pay_type hongbao_id:(NSString *)hongbao_id coupon_id:(NSString *)coupon_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取我的可使用的红包列表
/*
 type 可使用的红包类型(1红榜方案可使用红包, 2专家方案可使用红包)
 **/
- (void)getMyHongbaoListWithType:(NSString *)type ID:(NSString *)ID Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取我可使用的免单券
//type 1红榜方案可使用免单券, 2专家方案可使用免单券
- (void)getMyFreeCouponWithType:(NSString *)type ID:(NSString *)ID Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
#pragma mark 文章相关
//文章详情
- (void)getArticleDetailWithId:(NSString *)article_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//用户行为-点赞，浏览
/*
 article_cate 文章类别 1达人方案文章 2专家文章 3信息文章 必填
 article_id 公众号方案类型 1表示最新的 2表示历史的 3表示免费的 4表示干货 必填 当type为1，2或3时字段是相同的，当为4时字段是不同的
 type 行为类别，用户行为类别 1点赞 2分享 3 浏览 必填
 **/
- (void)getArticleBrowseWithId:(NSString *)article_id article_cate:(NSString *)article_cate type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
@end

NS_ASSUME_NONNULL_END
