//
//  JCNewestColumnModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCNewestColumnModel : JCWBaseBall

@property (nonatomic,copy)NSString *id;//周期id

@property (nonatomic,copy)NSString *type;//0新一期专栏暂未发布,1等待预售,2预售中,3预售截止,4已购买
@property (nonatomic,copy)NSString *period;//期数

@property (nonatomic,copy)NSString *original_price;//原价格

@property (nonatomic,copy)NSString *reality_price;//实付金额

@property (nonatomic,copy)NSString *time;//预售时间

@end

NS_ASSUME_NONNULL_END
