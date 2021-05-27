//
//  JCWUserBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/6.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

@class JCWUserBall;
typedef void(^JCRefreshUserSuccessBlock)(void);
typedef void(^JCRefreshUserNotLoginBlock)(void);
typedef void(^JCRefreshUserFailureBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface JCWUserBall : JCWBaseBall <NSCoding>
@property (strong, nonatomic) NSString  * user_id;
@property (strong, nonatomic) NSString  * token;
@property (strong, nonatomic) NSString  * user_code;


@property (strong, nonatomic) NSString  * fabu_type;//  fabu_type  1 能发部所有 2 只能发布免费方案 3 没有发布资格
@property (strong, nonatomic) NSString  * info;//未读消息
@property (strong, nonatomic) NSString  * qy;// 是否10连红  1是 没传没有


#pragma mark - 扩展
@property (strong, nonatomic) NSString  * caiyun;
@property (strong, nonatomic) NSString  * be_overdue;
@property (strong, readonly, nonatomic) NSString * checked_user_image;
@property (assign, readonly, nonatomic) BOOL isBindTel;
@property (strong, readonly, nonatomic) NSString * secTel;//加了****的手机号
+ (void)save:(JCWUserBall *)userBall;//缓存user对象(添加通知、推送设置)
+ (void)saveWithoutAction:(JCWUserBall *)userBall;
+ (instancetype)currentUser;
+ (void)logOut;
+ (void)logOut_wechat;


#pragma mark//新版本接口

@property (strong, nonatomic) NSString  * id;

@property (strong, nonatomic) NSString  * user_name;

@property (strong, nonatomic) NSString  * nickname;

@property (strong, nonatomic) NSString  * user_img;

@property (strong, nonatomic) NSString  *fensi;

@property (strong, nonatomic) NSString  *zhiding;//是否为专家,0不是,1是

@property (strong, nonatomic) NSString  *tuijian;//是否为达人,0不是,1是

@property (strong, nonatomic) NSString  *top;// 是否签约 1已经签约

@property (strong, nonatomic) NSString  *prize;//剩余红币余额 单位分

@property (strong, nonatomic) NSString  *money;//总购买金额 单位分

@property (strong, nonatomic) NSString  *sendmoney;//总赠送余额 单位分

@property (strong, nonatomic) NSString  *ten_red;//是否是十连红 用户 1是 2

@property (strong, nonatomic) NSString  * fabu_count;//发布次数

@property (strong, nonatomic) NSString  * user_phone;

@property (strong, nonatomic) NSString  * hongbao_count;//红包数量

@property (strong, nonatomic) NSString  *unread_messages;//未读信息

@property (strong, nonatomic) NSString  *focus_on_count;//关注个数

@property (strong, nonatomic) NSString  * desc;//个人简介

@property (strong, nonatomic) NSString  *bankcard_number;//银行卡

@property (strong, nonatomic) NSString  *fabu;//是否可以发布方案 0 不能发布 1 可以发布 2被禁 3审核中 4审核被拒

@property (strong, nonatomic) NSString  *remaining_double;//本月发布单场双选付费 剩余 次数

@property (strong, nonatomic) NSString  *tuisong;//是否开启推送

@property (strong, nonatomic) NSString  *can_change_nickname;//是否可以修改昵称 1是 2审核中 3本月已修改 4禁止修改

@property (strong, nonatomic) NSString  *can_change_avatar;//是否可以修改头像 1是 2审核中 3本月已修改 4禁止修改

@property (strong, nonatomic) NSString  *can_change_introduction;//是否可以修改简介 1是 2审核中 3本月已修改 4禁止修改

@property (strong, nonatomic) NSString  *guess_activity_id;//竞猜活动弹窗id

@property (strong, nonatomic) NSString  *guess_activity_text;//竞猜活动弹窗文本



@end
NS_ASSUME_NONNULL_END
