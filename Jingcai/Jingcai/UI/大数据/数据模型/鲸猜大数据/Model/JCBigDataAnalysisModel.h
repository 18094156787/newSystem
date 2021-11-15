//
//  JCBigDataAnalysisModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBigDataAnalysisModel : JCWBaseBall

@property (nonatomic,strong) NSString *trend;

@property (nonatomic,strong) NSString *win_score;

@property (nonatomic,strong) NSString *lose_score;

@end

NS_ASSUME_NONNULL_END
