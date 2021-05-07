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
//                        {
//                            company_name = "竞彩网",
//                            id = "89362",
//                            current_odds =     {
//                                win = "1.80",
//                                equal = "3.45",
//                                lose = "3.55",
//                            },
//                            company_id = "666",
//                        }
@end

NS_ASSUME_NONNULL_END
