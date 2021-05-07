//
//  JCWMySubscribeBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/13.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWMySubscribeBall : JCWBaseBall <NSCoding>
@property (strong, nonatomic) NSString * user_img;
@property (strong, nonatomic) NSString * ten_tj_all;
@property (strong, nonatomic) NSString * ten_tj_win;
@property (strong, nonatomic) NSString * user_id;
@property (assign, nonatomic) NSInteger tuijian_new;
@property (strong, nonatomic) NSString * user_name;

//角标
@property (strong, nonatomic) NSString * badge_tuijian_new;

@property (assign, nonatomic) NSInteger is_gzh;//1是跳转公众号 0是跳红榜
@end

NS_ASSUME_NONNULL_END
