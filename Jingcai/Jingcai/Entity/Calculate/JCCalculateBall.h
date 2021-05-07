//
//  JCCalculateBall.h
//  Jingcai
//
//  Created by Administrator on 2019/2/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCCalculateBall : JCWBaseBall
@property (strong, nonatomic) NSString * leagueName;
@property (strong, nonatomic) NSString * matchNum;
@property (strong, nonatomic) NSString * matchName;
@property (strong, nonatomic) NSString * homeName;
@property (strong, nonatomic) NSString * awayName;
@property (strong, nonatomic) NSString * homeLogo;
@property (strong, nonatomic) NSString * awayLogo;
@property (strong, nonatomic) NSString * win;
@property (strong, nonatomic) NSString * lose;
@property (strong, nonatomic) NSString * equal;

#pragma mark - 扩展
@property (strong, readonly, nonatomic) NSString * showTitle;
@property (strong, readonly, nonatomic) NSString * rewardRate;
@property (strong, readonly, nonatomic) NSString * winRate;
@property (strong, readonly, nonatomic) NSString * equalRate;
@property (strong, readonly, nonatomic) NSString * loseRate;
@end
NS_ASSUME_NONNULL_END
