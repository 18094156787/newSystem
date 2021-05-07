//
//  JCMatchTimeModel.h
//  FootBallScore
//
//  Created by 陈继伟 on 2020/3/5.
//  Copyright © 2020 --. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchTimeModel : JCWBaseBall

@property (nonatomic,copy) NSString *xq;//星期几

@property (nonatomic,copy) NSString *rq;//日期

@property (nonatomic,copy) NSString *hot; //=1为当前

@property (nonatomic,copy) NSString *time;////年-月-日

@property (nonatomic,assign) BOOL select;

@property (nonatomic,copy) NSString *sort_time;

@property (nonatomic,copy) NSString *week;

@end

NS_ASSUME_NONNULL_END
