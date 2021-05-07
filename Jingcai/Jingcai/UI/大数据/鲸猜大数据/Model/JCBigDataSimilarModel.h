//
//  JCBigDataSimilarModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBigDataSimilarModel : JCWBaseBall

@property (nonatomic,strong) NSString *win;

@property (nonatomic,strong) NSString *draw;

@property (nonatomic,strong) NSString *lose;

@property (nonatomic,strong) NSString *win_percent;

@property (nonatomic,strong) NSString *draw_percent;

@property (nonatomic,strong) NSString *lose_percent;

@property (nonatomic,strong) NSString *match_count;

@property (nonatomic,strong) NSString *rq;

@property (nonatomic,strong) NSString *jqs;

@end

NS_ASSUME_NONNULL_END
