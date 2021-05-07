//
//  JCWMyBuyBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/15.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWMyBuyBall : JCWBaseBall <NSCoding>
@property (strong, nonatomic) NSString * matchtime;
@property (strong, nonatomic) NSString * status;
@property (assign, nonatomic) NSInteger wl;// 0未开始 1红 2黑 3赢半 4输半 5走水 6延迟 7取消
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * wl_desc;
@property (strong, nonatomic) NSString * type_desc;
@property (strong, nonatomic) NSString * sf;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * user_id;
@property (strong, nonatomic) NSString * hb;
@property (strong, nonatomic) NSString * title;

//@property (assign, nonatomic) BOOL isAward;
- (BOOL)isOnGoing;
- (BOOL)isResultHong;
- (BOOL)isResultHei;
@end

NS_ASSUME_NONNULL_END
