//
//  JCKellyDataDetailSampleModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCKellyDataModelOddsIndexModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataDetailSampleModel : JCWBaseBall

@property (nonatomic,strong) NSString *odds_company_id;//公司id

@property (nonatomic,strong) NSString *odds_company_name;//公司名

@property (nonatomic,strong) JCKellyDataModelOddsIndexModel *begin_odds;

@property (nonatomic,strong) JCKellyDataModelOddsIndexModel *last_odds;

@end

NS_ASSUME_NONNULL_END
