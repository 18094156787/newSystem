//
//  JCWVerTjInfoBall.h
//  Jingcai
//
//  Created by Administrator on 2019/3/12.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWVerTjInfoBall : JCWBaseBall
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * user_id;
@property (nonatomic, strong) NSString * user_name;
@property (nonatomic, strong) NSString * user_img;
@property (nonatomic, strong) NSString * user_desc;
@property (nonatomic, strong) NSString * hb;
@property (assign, nonatomic) NSInteger sf;
@property (nonatomic, strong) NSString * matchtime;
@property (assign, nonatomic) NSInteger wl;// 0未开始 1红 2黑 3赢半 4输半 5走水 6延迟 7取消
@property (nonatomic, strong) NSString * wl_desc;
@property (nonatomic, strong) NSString * type_desc;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSArray * match_data;
@property (nonatomic, strong) NSString * lianhong;
@property (nonatomic, strong) NSString * history_hong;
@property (nonatomic, strong) NSString * near;
@property (strong, nonatomic) NSString * percent;
@end
NS_ASSUME_NONNULL_END
