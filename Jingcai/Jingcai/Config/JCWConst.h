//
//  JCWConst.h
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 预配置项
UIKIT_EXTERN NSString * const JCTestApiUrl_New;


UIKIT_EXTERN NSString * const JCApiUrl;             // 正式服接口统一地址
UIKIT_EXTERN NSString * const JCTestApiUrl;             // 测试服接口统一地址
UIKIT_EXTERN NSString * const JCEnvironmentUrl;
UIKIT_EXTERN NSString * const JCScheme;             // Scheme
UIKIT_EXTERN NSString * const WXAppID;
UIKIT_EXTERN NSString * const WXAppSecret;
UIKIT_EXTERN NSString * const JPushAppKey;          //极光推送的APPKEY
UIKIT_EXTERN NSString * const JPushMaterSecret;     //极光推送的MASTERSECRET
UIKIT_EXTERN NSString * const UMShareAppKey;        //友盟分享
//UIKIT_EXTERN NSString * const JCShareUrl;           //分享
UIKIT_EXTERN NSString * const JCPrivacyUrl;         //隐私政策协议
UIKIT_EXTERN NSString * const JCDownloadUrl;        //下载地址

#pragma mark - 列表的缓存
UIKIT_EXTERN NSString * const CacheKeyMySubscribe;  //我的关注
UIKIT_EXTERN NSString * const CacheKeyNews;         //资讯列表
UIKIT_EXTERN NSString * const UserRegisterSuccess; //用户注册成功


#pragma mark - 页面ID
UIKIT_EXTERN NSString * const PageIDMySubscribe;    // 我的关注
UIKIT_EXTERN NSString * const PageIDAccountSetting; // 账户设置
UIKIT_EXTERN NSString * const PageIDPushSetting;    // 推送设置
UIKIT_EXTERN NSString * const PageIDPrivacy;    // 隐私政策
UIKIT_EXTERN NSString * const PageIDAbout;          // 关于我们
UIKIT_EXTERN NSString * const PageIDContact;        // 联系客服

#pragma mark - 通知名
UIKIT_EXTERN NSString * const NotificationNameUserChange;//登录/退出
UIKIT_EXTERN NSString * const NotificationUserLogin;//用户登录
UIKIT_EXTERN NSString * const NotificationUserLogout;//用户登录
UIKIT_EXTERN NSString * const NotificationApplyExpertSuccess;//申请专家认证
UIKIT_EXTERN NSString * const JingcaiGuide;//竞猜引导
UIKIT_EXTERN NSString * const JingcaiInviteNew;//拉新抽奖

UIKIT_EXTERN NSString * const NotificationNameUserNotLogin;//
UIKIT_EXTERN NSString * const UserRechargeSuccess;//充值成功
UIKIT_EXTERN NSString * const JingcaiSuccess;//预测成功
UIKIT_EXTERN NSString * const AppDidLoad;//app首次安装


UIKIT_EXTERN NSString * const NotificationNameApplicationWillEnterForeground;//app进入前台

//全名预测相关
UIKIT_EXTERN NSString * const JingcaiBeginDragging;
UIKIT_EXTERN NSString * const JingcaiDidEndDecelerating;
UIKIT_EXTERN NSString * const JingcaiDidEndDragging;


//赛程
UIKIT_EXTERN NSString * const JCMatchConcern;
UIKIT_EXTERN NSString * const JCBasketBallMatchConcern;
UIKIT_EXTERN NSString * const JCMatchEntetBallTip;//足球进球提醒设置改变
UIKIT_EXTERN NSString * const jcMatchEntetBallRefresh;//足球进球提醒刷新页面

//公众号专栏
UIKIT_EXTERN NSString * const JCRefreshBuyColumn;


#pragma mark - 用于友盟分享和微信登录区分的字段
UIKIT_EXTERN NSString * const WXSendAuthReqStateLogin;
//UIKIT_EXTERN NSString * const WXSendAuthReqStatePay;

UIKIT_EXTERN NSString * const JCMerchantID;                // MerchantID
UIKIT_EXTERN NSString * const MyHongbaoUrl;         // 我的红包URL
UIKIT_EXTERN NSString * const LoginLotteryUrl;
UIKIT_EXTERN NSString * const PayAgreeUrl;
UIKIT_EXTERN NSString * const PageIDMyHongbao;      // 我的红包
UIKIT_EXTERN NSString * const PageIDMyBuyTuijian;   // 已购方案


//鲸猜数据相关
UIKIT_EXTERN NSString * const JingcaiAIProduceBuy;// 鲸猜方案购买

//banner默认图

UIKIT_EXTERN NSString * const DakaBannerUrl;//大咖
UIKIT_EXTERN NSString * const HongbangBannerUrl;//红榜
UIKIT_EXTERN NSString * const GanhuoBannerUrl;//干货
UIKIT_EXTERN NSString * const ConcernBannerUrl;//关注列表

#pragma mark - 数据缓存
UIKIT_EXTERN NSString * const ReceiveRedPacket;//活动红包
UIKIT_EXTERN NSString * const JCHomeCache;//首页缓存
UIKIT_EXTERN NSString * const JCHomeBannerCache;//首页banner缓存
UIKIT_EXTERN NSString * const JCBigData_Database;//大数据——资料库


UIKIT_EXTERN NSString * const JCCommunity_Banner;//社区-banner
UIKIT_EXTERN NSString * const JCCommunity_GZH;//社区-公众号
UIKIT_EXTERN NSString * const JCCommunity_HB;//社区-红榜

UIKIT_EXTERN NSString * const JCSearch_Home_FootBall;//搜索-首页
UIKIT_EXTERN NSString * const JCSearch_BF_FootBall;//搜索-足球比分
UIKIT_EXTERN NSString * const JCSearch_BF_BasketBall;//搜索-篮球比分
UIKIT_EXTERN NSString * const JCSearch_BigData;//社区-大数据

UIKIT_EXTERN NSString * const JCAppGuide;//引导页


//活动
UIKIT_EXTERN NSString * const JCActivity_show_date;//活动弹窗日期
UIKIT_EXTERN NSString * const JCActivity_data;//活动弹窗数据




