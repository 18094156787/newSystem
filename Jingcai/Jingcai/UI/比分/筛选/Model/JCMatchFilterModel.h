//
//  JCMatchFilterModel.h
//  FootBallScore
//
//  Created by 陈继伟 on 2020/3/6.
//  Copyright © 2020 --. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFilterModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *competition_id;

@property (nonatomic,strong) NSString *event_id;

@property (nonatomic,strong) NSString *short_name_zh;

@property (nonatomic,strong) NSString *logo;

@property (assign , nonatomic) BOOL isSelect;

@end

NS_ASSUME_NONNULL_END
