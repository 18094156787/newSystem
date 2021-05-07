//
//  JCCommunityRankInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWExpertBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCCommunityRankInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *type;//1命中率 2盈利率 3连红数

@property (nonatomic,strong) NSArray <JCWExpertBall *>*list;

@property (nonatomic,strong) NSString *type_name;

@end




NS_ASSUME_NONNULL_END
