//
//  JCBasketMatchDetailZBFormModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketMatchDetailZBFormModel : JCWBaseBall

@property (nonatomic,strong) NSString *home_name;

@property (nonatomic,strong) NSString *away_name;

//@property (nonatomic,strong) NSString *home_score;
//
//@property (nonatomic,strong) NSString *away_score;

@property (nonatomic,strong) NSArray *home_score;

@property (nonatomic,strong) NSArray *away_score;

@end

NS_ASSUME_NONNULL_END
