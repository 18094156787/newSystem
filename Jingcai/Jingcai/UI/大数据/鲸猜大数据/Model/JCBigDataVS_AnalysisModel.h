//
//  JCBigDataVS_AnalysisModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCBigDataAnalysisMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBigDataVS_AnalysisModel : JCWBaseBall

@property (nonatomic,strong) NSString *win;

@property (nonatomic,strong) NSString *draw;

@property (nonatomic,strong) NSString *lose;

@property (nonatomic,strong) NSString *win_score;

@property (nonatomic,strong) NSString *lose_score;

@property (nonatomic,strong) NSArray <JCBigDataAnalysisMatchModel *>*match;

@property (nonatomic,strong) NSString *home_name;

@property (nonatomic,strong) NSString *away_name;

@end

NS_ASSUME_NONNULL_END
