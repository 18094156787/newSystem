//
//  JCHongbangDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCShareModel.h"
#import "JCWTjInfoDetailBall.h"
#import "JCHongbangDetail_MatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangDetailModel : JCWBaseBall

@property (strong, nonatomic) JCShareModel *wechat_share;

@property (strong, nonatomic) JCWTjInfoDetailBall *talent_plan;

@property (strong, nonatomic) NSArray <JCHongbangDetail_MatchModel *>*match_info;


@property (strong, nonatomic) NSArray <JCWExpertBall *>*tuijian_pay;//购买人数

@property (strong, nonatomic) NSString *tuijian_pay_num;//购买人数



@end

NS_ASSUME_NONNULL_END
