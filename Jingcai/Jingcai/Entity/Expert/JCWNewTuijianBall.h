//
//  JCWNewTuijianBall.h
//  Jingcai
//
//  Created by Administrator on 2019/2/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWPayInfoBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWNewTuijianBall : JCWBaseBall
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * user_id;
@property (nonatomic, strong) NSString * user_name;
@property (nonatomic, strong) NSString * user_img;
@property (nonatomic, strong) NSString * hb;
@property (nonatomic, strong) NSString * matchtime;
@property (nonatomic, strong) NSString * subscribe;
@property (nonatomic, assign) CGFloat zyll;
@property (nonatomic, strong) NSString * wl_desc;
@property (nonatomic, strong) NSString * hong;
@property (nonatomic, assign) NSInteger lianhong;
@property (nonatomic, assign) NSInteger ten_tj_all;
@property (nonatomic, assign) NSInteger ten_tj_win;
@property (nonatomic, strong) NSString * type_desc;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, assign) NSInteger sf;

//是否要展示info
@property (nonatomic, readonly, assign) BOOL isShow_win;
@property (nonatomic, readonly, assign) BOOL isShow_zyll;
@property (nonatomic, readonly, assign) BOOL isShow_lianhong;
//展示的info
@property (nonatomic, readonly, strong) NSString * info_hong;
@property (nonatomic, readonly, strong) NSString * info_win;
@property (nonatomic, readonly, strong) NSString * info_zyll;
@property (nonatomic, readonly, strong) NSString * info_lianhong;

@property (nonatomic, readonly, assign) BOOL isSubscribe;//是否关注
- (JCWPayInfoBall *)parseToPayInfoBall;
@end
NS_ASSUME_NONNULL_END
