//
//  JCWMatchOPBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWMatchOddsBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWMatchOPBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * company_id;
@property (strong, nonatomic) NSString * company_name;
@property (strong, nonatomic) JCWMatchOddsBall * current_odds;

@end

NS_ASSUME_NONNULL_END
