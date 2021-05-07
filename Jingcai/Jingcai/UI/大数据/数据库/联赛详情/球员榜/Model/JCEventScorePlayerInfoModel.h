//
//  JCEventScorePlayerInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCEventScorePlayerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCEventScorePlayerInfoModel : JCWBaseBall

@property (nonatomic,assign) BOOL is_select;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSArray <JCEventScorePlayerModel *>*info;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *field;

@end

NS_ASSUME_NONNULL_END
