//
//  JCMatchInfoTitleModel.h
//  FootBallScore
//
//  Created by 陈继伟 on 2020/3/20.
//  Copyright © 2020 --. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCMatchInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchInfoTitleModel : JCWBaseBall

@property (nonatomic,strong) NSString *daytime;

@property (nonatomic,strong) NSMutableArray *array;

@end

NS_ASSUME_NONNULL_END
