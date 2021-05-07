//
//  JCWActivityMatchBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/12.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCWActivityMatchBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * home_name;
@property (assign, nonatomic) NSInteger win_number;
@property (assign, nonatomic) NSInteger draw_number;
@property (strong, nonatomic) NSString * lose_pl;
@property (strong, nonatomic) NSDate * created_at;
@property (strong, nonatomic) NSString * start_time;
@property (assign, nonatomic) NSInteger lose_number;
@property (strong, nonatomic) NSString * number;
@property (strong, nonatomic) NSDate * updated_at;
@property (strong, nonatomic) NSString * win_pl;
@property (strong, nonatomic) NSString * draw_pl;
@property (strong, nonatomic) NSString * away_name;
@property (strong, nonatomic) NSString * result;
@property (assign, nonatomic) NSInteger status;

#pragma mark - 扩展
//范围；[0, 100]，四舍五入
@property (assign, nonatomic) NSInteger winPercent;
@property (assign, nonatomic) NSInteger drawPercent;
@property (assign, nonatomic) NSInteger losePercent;

@property (assign, nonatomic) NSInteger selResult;
@end

NS_ASSUME_NONNULL_END
