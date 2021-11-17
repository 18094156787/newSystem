//
//  JCKellyDataTrackModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCKellyDataModelOddsIndexModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKellyDataTrackModel : JCWBaseBall

@property (nonatomic,strong) JCKellyDataModelOddsIndexModel *last_odds;

@end

NS_ASSUME_NONNULL_END
