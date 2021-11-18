//
//  JCHistoryPayMatchDataModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCTipMatchInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHistoryPayMatchDataModel : JCWBaseBall

@property (nonatomic,strong)  NSArray *begin_similar_match;

@property (nonatomic,strong)  NSArray *last_similar_match;

@end

NS_ASSUME_NONNULL_END
