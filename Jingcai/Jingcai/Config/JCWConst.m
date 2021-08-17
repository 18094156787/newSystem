//
//  JCWConst.m
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWConst.h"

#pragma mark - 预配置项
//NSString * const JCTestApiUrl_New           = @"http://106.75.32.127:9503/";//测试
NSString * const JCTestApiUrl_New           = @"http://ios.yixinzuqiu.com/";//上架专用,会自己映射
////NSString * const JCTestApiUrl_New            @"http://pay.yixinzuqiu.com/";//正式

//NSString * const JCTestApiUrl_New           = @"http://117.50.88.188:9803/";
//NSString * const JCApiUrl           = @"http://api.yixinzuqiu.com/";
//NSString * const JCApiUrl           = @"http://apitest.yixinzuqiu.com/";
NSString * const JCApiUrl           = @"http://ios.yixinzuqiu.com/";
NSString * const JCTestApiUrl           = @"http://ios.yixinzuqiu.com/";

NSString * const JCEnvironmentUrl           = @"environmentUrl";
NSString * const JCScheme           = @"zsjc";//wxc1e405dd35db384e
//NSString * const WXAppID            = @"wxc1e405dd35db384e";//
//NSString * const WXAppSecret        = @"c6c81bd67ed97e6c0b731a4ed9e954a4";//

NSString * const WXAppID            = @"wxe99e1574a32a16f5";//
NSString * const WXAppSecret        = @"829c5cfe702814134be4a8266adb031d";//

NSString * const JPushAppKey        = @"b2735497b35299c3389a6290";//a175ef62e8b40a1d1daca145
NSString * const JPushMaterSecret   = @"869d4eba7a5a662a4e649f15";//81b810502094c1c6f2055395
NSString * const UMShareAppKey      = @"5c6fa347b465f5478e00008a";
//NSString * const JCShareUrl         = @"http://m.jingcai.com/zucai/tuijianarticle/";
NSString * const JCPrivacyUrl       = @"http://api.yixinzuqiu.com//zucai/privacypolicy";
NSString * const JCDownloadUrl      = @"https://fir.im/yt5r";

NSString * const CacheKeyMySubscribe    = @"MySubscribe";
NSString * const CacheKeyNews           = @"News";
NSString * const UserRegisterSuccess    = @"registerSuccess";

NSString * const UserRechargeSuccess    = @"rechargeSuccess";



NSString * const PageIDMySubscribe      = @"PageIDMySubscribe";
NSString * const PageIDAccountSetting   = @"PageIDAccountSetting";
NSString * const PageIDPushSetting      = @"PageIDPushSetting";
NSString * const PageIDPrivacy          = @"PageIDPrivacy";
NSString * const PageIDAbout            = @"PageIDAbout";
NSString * const PageIDContact          = @"PageIDContact";




NSString * const NotificationNameApplicationWillEnterForeground = @"applicationWillEnterForeground";

NSString * const NotificationNameUserChange = @"userChange";
NSString * const NotificationUserLogin = @"userLogin";
NSString * const NotificationUserLogout = @"userLogout";
NSString * const NotificationNameUserNotLogin = @"userNotLoginDetected";
NSString * const NotificationApplyExpertSuccess = @"applyExpertSuccess";//
NSString * const AppDidLoad = @"appDidLoad";
NSString * const WXSendAuthReqStateLogin    = @"login";
NSString * const JingcaiSuccess = @"jingcaiSuccess";
NSString * const JingcaiGuide = @"Jingcaiguide";
NSString * const JingcaiInviteNew = @"jingcaiInviteNew";
//NSString * const WXSendAuthReqStatePay      = @"pay";

NSString * const JCMerchantID = @"merchant.com.jingcai.zc";
NSString * const MyHongbaoUrl = @"http://api.yixinzuqiu.com/v1/zucai/hongbao";
NSString * const LoginLotteryUrl = @"http://api.yixinzuqiu.com/v1/zucai/loginlottery";
NSString * const PayAgreeUrl = @"http://api.yixinzuqiu.com/v1/zucai/xieyi";
NSString * const PageIDMyHongbao        = @"PageIDMyHongbao";
NSString * const PageIDMyBuyTuijian     = @"PageIDMyBuyTuijian";

//全名预测相关
NSString * const JingcaiBeginDragging     = @"JingcaiBeginDragging";
NSString * const JingcaiDidEndDecelerating     = @"JingcaiDidEndDecelerating";
NSString * const JingcaiDidEndDragging     = @"JingcaiDidEndDragging";
//鲸猜数据相关
NSString * const JingcaiAIProduceBuy    = @"JingcaiAIProduceBuy";

//bannner图地址
NSString * const DakaBannerUrl     = @"http://api.yixinzuqiu.com/static/image/dav.jpg";//大咖
NSString * const HongbangBannerUrl     = @"http://api.yixinzuqiu.com/static/image/hongbang.jpg";//红榜
NSString * const GanhuoBannerUrl     = @"http://api.yixinzuqiu.com/static/image/miji.jpg";//干货
NSString * const ConcernBannerUrl     = @"http://api.yixinzuqiu.com/static/image/gz.jpg";//关注列表

//赛程
NSString * const JCMatchConcern     = @"jcMatchConcern";//足球赛程关注
NSString * const JCBasketBallMatchConcern     = @"jcBasketBallMatchConcern";//赛程关注
NSString * const JCMatchEntetBallTip     = @"jcMatchEntetBallTip";//足球进球提醒设置改变
NSString * const jcMatchEntetBallRefresh     = @"jcMatchEntetBallRefresh";//足球进球提醒刷新页面
#pragma mark - 数据缓存
NSString * const ReceiveRedPacket = @"receiveRedPacket";////活动红包
NSString * const JCHomeCache = @"jcHomeCache";//首页数据缓存
NSString * const JCHomeBannerCache = @"jcHomeBannerCache";//首页banner数据缓存
NSString * const JCBigData_Database = @"JCBigData_Database";//大数据——资料库
NSString * const JCCommunity_Banner = @"JCCommunity_Banner";//社区-banner
NSString * const JCCommunity_GZH = @"JCCommunity_GZH";//社区-公众号
NSString * const JCCommunity_HB = @"JCCommunity_HB";//社区-红榜
NSString * const JCSearch_Home_FootBall = @"JCSearch_Home_FootBall";//搜索-首页
NSString * const JCSearch_BF_FootBall = @"JCSearch_BF_FootBall";//搜索-足球比分
NSString * const JCSearch_BF_BasketBall = @"JCSearch_BF_BasketBall";//搜索-篮球比分
NSString * const JCSearch_BigData = @"JCSearch_BigData";//搜索-大数据

NSString * const JCActivity_show_date = @"JCActivity_show_date";//活动弹窗日期
NSString * const JCActivity_data = @"JCActivity_data";//活动弹窗数据
NSString * const JCAppGuide = @"JCAppGuide";//引导页
