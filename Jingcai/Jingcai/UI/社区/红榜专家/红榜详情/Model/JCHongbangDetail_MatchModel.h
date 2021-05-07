//
//  JCHongbangDetail_MatchModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCHongBangMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangDetail_MatchModel : JCWBaseBall

@property (strong, nonatomic) NSString *match_id;

@property (nonatomic, assign) NSInteger wl;

@property (strong, nonatomic) NSString *spf;

@property (strong, nonatomic) NSString *spf_result;

@property (strong, nonatomic) NSString *classfly;

@property (strong, nonatomic) NSArray *home_rate;

@property (strong, nonatomic) NSArray *away_rate;

@property (strong, nonatomic) JCHongBangMatchModel *matches;



- (BOOL)isResultWin;

- (BOOL)isResultLose;

- (BOOL)isResultWater;

- (BOOL)isYanqi;

- (BOOL)isQuXiao;

@end

NS_ASSUME_NONNULL_END
