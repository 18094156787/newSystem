//
//  JCWTjUserBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//
#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWTjUserBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * desc;
@property (strong, nonatomic) NSString * area_city;
@property (strong, nonatomic) NSString * area_country;
@property (strong, nonatomic) NSString * area_state;
@property (strong, nonatomic) NSString * blood_type;
@property (strong, nonatomic) NSString * nickname;
@property (strong, nonatomic) NSString * qr_code;
@property (strong, nonatomic) NSString * sex_ori;
@property (strong, nonatomic) NSDate * created_at;
@property (assign, nonatomic) NSInteger fensi;
@property (assign, nonatomic) NSInteger hong;
@property (assign, nonatomic) NSInteger hongbao;
@property (assign, nonatomic) NSInteger jifen;
@property (assign, nonatomic) NSInteger lianhong;
@property (assign, nonatomic) NSInteger my;
@property (assign, nonatomic) NSInteger new_tuijian;
@property (assign, nonatomic) NSInteger smzq;

@property (assign, nonatomic) NSInteger ten_tj_all;
@property (assign, nonatomic) NSInteger ten_tj_win;
@property (assign, nonatomic) NSInteger tj_all;
@property (assign, nonatomic) NSInteger tj_win;
@property (assign, nonatomic) NSInteger total_fee;
@property (assign, nonatomic) NSInteger tuijian;
@property (strong, nonatomic) NSDate * updated_at;
@property (strong, nonatomic) NSDate * user_birthday;
@property (strong, nonatomic) NSString * user_area;
@property (strong, nonatomic) NSString * user_email;
@property (strong, nonatomic) NSString * user_img;
@property (strong, nonatomic) NSString * user_name;
@property (strong, nonatomic) NSString * user_passwd;
@property (strong, nonatomic) NSString * user_phone;
@property (assign, nonatomic) NSInteger user_sex;
@property (assign, nonatomic) NSInteger user_status;
@property (assign, nonatomic) NSInteger zhiding;

#pragma mark - 扩展
@property (strong, readonly, nonatomic) NSString *checked_user_img;
@property (assign, readonly, nonatomic) BOOL isSubscribe; //是否已关注
@property (assign, readonly, nonatomic) BOOL has_qr_code; //是否有二维码
@property (strong, nonatomic) NSString *subscribe; //按钮的标题
@property (strong, nonatomic) NSString * information; //"足球分析师"
@property (strong, nonatomic) NSString * position; //"足球分析师"
@property (assign, readonly, nonatomic) BOOL isShowZJ; //是否显示战绩
@end

NS_ASSUME_NONNULL_END
