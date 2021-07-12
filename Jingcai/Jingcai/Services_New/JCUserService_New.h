//
//  JCUserService_New.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "BaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCUserService_New : BaseService
//获取图形验证码
- (void)getImageCodeWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
- (void)getCheckImageCodeWithID:(NSString *)ID img_code:(NSString *)img_code Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//发送短信验证码
//0注册，1登录，2绑定手机，3忘记密码 默认为0
- (void)getSmsCodeWithTelNum:(NSString *)telNum type:(NSInteger)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//注册
//img_id 图形验证码id  img_code 4位图形验证
- (void)registerWithTel:(NSString *)tel pass:(NSString *)pass code:(NSString *)code  img_id:(NSString *)img_id img_code:(NSString *)img_code success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//密码登陆
- (void)loginWithTel:(NSString *)tel pass:(NSString *)pass success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//短信登陆
- (void)loginWithTel:(NSString *)tel code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//微信登录
- (void)wxLoginWithParam:(NSDictionary *)param success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//微信绑定手机
- (void)bindTel:(NSString *)tel code:(NSString *)code pass:(NSString *)pass oauth_id:(NSString *)oauth_id  img_id:(NSString *)img_id img_code:(NSString *)img_code success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//换绑手机-校验旧手机号
- (void)VerifyPhone:(NSString *)phone code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock ;
//获取用户信息
- (void)getMyUserInfoWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//修改密码
- (void)changePwdWithOldPass:(NSString *)oldPass newPass:(NSString *)newPass newPassT:(NSString *)newPassT success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//忘记密码
- (void)forgetPwdWithTel:(NSString *)tel pass:(NSString *)pass code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//修改用户基本信息
- (void)updateUserInfoWithType:(NSString *)type value:(NSString *)value code:(NSString *)code success:(successBlock)successBlock failure:(failureBlock)failureBlock;
////获取审核达人信息
//type 类型 1昵称 2头像 4简介
- (void)getUserCheckInfoWithType:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//退出登录
- (void)getUserLogOutWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
/*
 注销账号
 op 操作, 1确认, 2确认身份, 3确定
 mobile 手机号, op为2时必传, 其他非必传
 code 手机验证码, op为2时必传,其他非必传
 **/
- (void)disableAccountTextWithoperation:(NSString *)op mobile:(NSString *)mobile code:(NSString *)code Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//绑定银行卡
- (void)getUserBindBankCardWithBankcard_number:(NSString *)bankcard_number  Bank_name:(NSString *)bank_name Nickname:(NSString *)nickname success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取用户绑定的银行卡信息
- (void)getMyBindCardInfoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//解绑银行卡
- (void)getUserUnbundlingBankCardWithBankcard_id:(NSString *)bankcard_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//获取用户的专注列表
- (void)getMyConcernExpertkLsitWithType:(NSString *)type Page:(NSInteger)page  success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//红币消费记录
- (void)getCoinRecordWithPage:(NSInteger)page Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//红包列表-优惠券
//   type 竞猜的红包列表 type不传是全部 1是现金红包 2免单券 3是优惠券;
- (void)getUserHongbaoLsitWithType:(NSString *)type Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//单个小额提现
/*
 type 操作类型,1获取单个红包提现信息,2获取全部红包提现信息(红包id不必传),3提现单个现金红包,4提现全部现金红包(红包id不必传)
 id 提现的红包id
 ali_account 支付宝账号
 name 支付宝姓名
 **/
- (void)getHongbaoSubmitWithType:(NSString *)type hongbao_id:(NSString *)hongbao_id Email:(NSString *)email name:(NSString *)name success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//购买记录
//type 1是公众号方案,2是达人方案,3是ai方案,4是数据订阅
- (void)getMyBuyPlanListWithType:(NSString *)type WithPage:(NSInteger)page DataSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//订单详情(红榜和公众号是同一个)
/*
 zucai_order_id 订单ID 订单表的ID 不是 订单号
 all_wl 达人、AI方案、数据订阅（单场） 三种类型下 才需要传 且只有一个 方案结果 1红2 黑 5 走水 6延迟  7取消
 wl 达人、AI方案、数据订阅（单场）三种类型下 才需要传 有可能多个 多个用逗号隔开 比赛结果 1红2 黑 5 走水 6延迟  7取消
 **/
- (void)getOrderDetailWithOrder_id:(NSString *)zucai_order_id all_wl:(NSString *)all_wl wl:(NSString *)wl Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//意见反馈
- (void)getSubmitSuggestionWithContent:(NSString *)content image:(NSString *)image phone:(NSString *)phone email:(NSString  *)email success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//消息列表
- (void)getPersonCenterMessageListWithPage:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//邀请好友列表
- (void)getMyInviteFriendListWithPage_size:(NSString *)page_size success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//邀请好友-拆红包
- (void)getMyInviteFriendChaiHongbaoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
#pragma mark//方案相关
//发布记录
/*
 type  1 待审核 2已发布 3全部 默认3
 **/
- (void)getMyPostTuiJianListWithType:(NSString *)type Page:(NSInteger)page success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//方案收入顶部信息
- (void)getMyIncomeDetailTopInfoWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//方案收入-收益明细
- (void)getMyIncomeDetailLsitWithPage:(NSInteger)page  success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//方案收入-提现记录
- (void)getMyWithDrawDetailLsitWithPage:(NSInteger)page  success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//方案收入-稿酬详情
- (void)getMyIncomeGaoChouDetaillWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//方案收入-稿酬提现
- (void)getUserWithdrawalActionWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
#pragma mark//通用
//上传图片
/*
 type 类型, 1方案图片, 2其他图片
 image 表单名称
 **/
- (void)uploadAvatarWithImage:(UIImage *)image type:(NSString *)type success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//上传图片带宽高
- (void)uploadAvatarWithImage:(UIImage *)image type:(NSString *)type width:(NSString *)width height:(NSString *)height success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//版本更新
- (void)getAppUpdateWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//推送开关
- (void)openPushWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
#pragma mark//申请签约相关

//发布方案的比赛列表
//type 类型 1竞彩，2让球，3进球数
- (void)getPostPlan_MatchListWithType:(NSString *)type page:(NSInteger)page  Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//方案的比赛比赛赔率数据
//type 类型 1竞彩，2让球，3进球数
- (void)getPostPlan_MatchDetailWithMatch_id:(NSString *)match_id type:(NSString *)type Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//申请签约方案创建
/*
 classfly 类型0，1 竞足 2 让球 3进球数
 title 标题
 sf 收费 0 代表免费 单位
 is_push 是否推送 1是 0否
 push_time  推送为1时 才有例如 2020-12-19 18:30
 refund  不中返还 1是 0否
 hb 是否允许抵扣 红包抵扣 1是 0否
 match_data
 {
   "match_data": [
     {
       "match_num": 0,
       "match_id": 0,
       "spf": "string"
     }
   ]
 }
 **/
- (void)getApplyQy_PostMatchInfoWithParamDic:(NSDictionary *)param success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//敏感词检测
- (void)getPlanSensitiveWordWithTitle:(NSString *)title Citation:(NSString *)citation Content:(NSString *)content success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//申请签约
- (void)getApplyQy_PostFinalWithParamDic:(NSDictionary *)param success:(successBlock)successBlock failure:(failureBlock)failureBlock;

//查看申请签约-方案详情
- (void)getPostPlan_planDetailWithTuijian_id:(NSString *)tuijian_id Success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//查看申请签约-详情
- (void)getPostPlan_postInfoDetailWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//审核被拒-重置签约状态
- (void)changeMyCheckStatusWithsuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//h5邀请签约-稿酬详情
/*
 inviter_id 邀请人id
 config_id 达人稿酬配置ID
 **/
- (void)getInviteExpertWithGaoChouDetaillWithInviter_id:(NSString *)inviter_id Config_id:(NSString *)config_id success:(successBlock)successBlock failure:(failureBlock)failureBlock;
#pragma mark//发布方案相关
//发布方案价格
- (void)getPostPlanPriceWithSuccess:(successBlock)successBlock failure:(failureBlock)failureBlock;
//发布方案-创建/编辑
- (void)getPostMatchInfoWithPostID:(NSString *)postID Param:(NSDictionary *)param success:(successBlock)successBlock failure:(failureBlock)failureBlock;
//发布方案-查看
- (void)getMyPostMatchDetailWithTuiJianID:(NSString *)tuijian_id  success:(successBlock)successBlock failure:(failureBlock)failureBlock;
@end

NS_ASSUME_NONNULL_END
