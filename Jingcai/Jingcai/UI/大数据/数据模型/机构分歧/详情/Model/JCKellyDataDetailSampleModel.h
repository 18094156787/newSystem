//
//  JCKellyDataDetailSampleModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCKellyDataModelOddsIndexModel.h"
#import "JCKellyDataTrackModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataDetailSampleModel : JCWBaseBall

@property (nonatomic,strong) NSString *odds_company_id;//公司id

@property (nonatomic,strong) NSString *odds_company_name;//公司名

@property (nonatomic,strong) JCKellyDataModelOddsIndexModel *begin_odds;

@property (nonatomic,strong) JCKellyDataModelOddsIndexModel *last_odds;

@property (nonatomic,strong) JCKellyDataTrackModel *kelly;

@property (nonatomic,assign) NSInteger type;//数据类型（倒序排列，最后一条不管是什么类型都是初指）：2已跑48小时，3已跑24小时，4已跑12小时，5已跑6小时，6已跑3小时，7已跑1小时，8已跑30分钟，9已跑20分钟，10已跑10分钟

@property (nonatomic,strong) NSString *type_str;

@end

NS_ASSUME_NONNULL_END
