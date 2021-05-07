//
//  JCMatchSelectModel.h
//  FootBallScore
//
//  Created by 陈继伟 on 2020/3/6.
//  Copyright © 2020 --. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCMatchFilterModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchSelectModel : JCWBaseBall

@property (nonatomic,strong) NSString *initials;

@property (nonatomic,strong) NSArray *event;

@property (nonatomic,strong) NSArray *list;

@end

NS_ASSUME_NONNULL_END
