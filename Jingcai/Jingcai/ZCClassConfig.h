//
//  ZCClassConfig.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/6.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#ifndef ZCClassConfig_h
#define ZCClassConfig_h


#define KYMWriteUserDefaults(value, key)     [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define KYMReadUserDefaults(key) [[NSUserDefaults standardUserDefaults]objectForKey:key]
#import "JCWConst.h"
#import <Masonry.h>
#import <MJRefresh.h>
#import <UMCommon/MobClick.h>
#import "JCBaseTableViewController.h"
#import "UILabel+JCAlignment.h"
#import "UIButton+Effect.h"
#import "JCLoginWMStickVC.h"
#import "JCWJsonTool.h"
#import "JCWCacheTool.h"
#import "JCWUserBall.h"
//#import "JCPayManager.h"
#import "SDCycleScrollView.h"
//#import <BlocksKit.h>
#import <BlocksKit/UIView+BlocksKit.h>
#import "HMSegmentedControl.h"
#import "UIResponder+TPCategory.h"
#import "EMTextView.h"
//#import <ReactiveObjC.h.h>
#import "ReactiveObjC.h"
#import "JCBaseNavigationController.h"
#import "JCWUserBall.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "UIView+HGCorner.h"
#import "JCWToastTool.h"
#import "JCWStringTool.h"
#import "JCWExpertBall.h"
#import "JCWSlideBall.h"
#import "JCWNewsBall.h"
#import "JCWTjInfoBall.h"
#import "UIView+JCLoading.h"
#import "WebViewController.h"
#import "JCPageRedirectManager.h"
#import "JCInviteCodeInfoModel.h"
#import "RNNoData.h"
#import "JCJingCaiMatchModel.h"
#import <YYModel.h>
#import "UIView+Extension.h"
#import "JCActivityRedPacketModel.h"
#import "NSDate+Extensions.h"
#import "LYEmptyViewHeader.h"
#import "JNDIYemptyView.h"
#import "JCFootBallHeader.h"
#import "JCMatchDetailWMStickVC.h"
#import "NSDictionary+NilSafe.h"
#import "UIAlertController+Addtional.h"
#import <YYKit.h>
#import "KKPaddingLabel.h"
#import "JCBasketBallMatchBall.h"
#import "JCTuiJianManager.h"
#import "JCWAppTool.h"
#import "JCConfigModel.h"
#import "JCBaseTitleAlertView.h"

#pragma  mark //新接口地址
#import "JCHomeService_New.h"
#import "JCDataBaseService_New.h"
#import "JCUserService_New.h"
#import "JCMatchService_New.h"
#import "JCCommunityService_New.h"
#import "JCBasketBallMatchService_New.h"
#import "JCJingCaiService_New.h"
#import "JCPayService_New.h"
#import "JCAppService_New.h"



#import "JCMatchBall.h"
#import "JCMatchTeamBall.h"
#import "JCHongBangBall.h"
#import "JCHongBangMatchModel.h"
#import "JCHongbangDetailModel.h"
#import "JCShareModel.h"
#import "WebSocketManager.h"
#import "JCActivityService.h"
#import "JCCommomTool.h"
//内购相关
#define singleton_interface(className) \
+ (className *)shared;
// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (className *)shared \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}



#endif /* ZCClassConfig_h */
