//
//  JCWMatchTuijianBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWMatchOddsBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWMatchTuijianBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * matchtime;
@property (strong, nonatomic) NSString * name;
@property (assign, nonatomic) NSInteger sf;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * user_id;
@property (strong, nonatomic) NSString * title;
@property (assign, nonatomic) NSInteger wl;// 0未开始 1红 2黑 3赢半 4输半 5走水 6延迟 7取消
@property (strong, nonatomic) NSString * wl_desc;
@property (assign, nonatomic) NSInteger hb;
@property (strong, nonatomic) NSString * type_desc;
@property (strong, nonatomic) NSString * status;
@end
NS_ASSUME_NONNULL_END
