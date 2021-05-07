//
//  JCBasketBallMatchTongJiUserModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCBasketBallMatchTongJiTeamModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchTongJiUserModel : JCWBaseBall

@property (nonatomic,strong) NSString * player_qyh;//

@property (nonatomic,strong) NSString * player_zw;//

@property (nonatomic,strong) JCBasketBallMatchTongJiTeamModel * play_info;//

@end

NS_ASSUME_NONNULL_END
