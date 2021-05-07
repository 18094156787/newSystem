//
//  JCTitleBannerModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/20.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTitleBannerModel : JCWBaseBall

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSString *content;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *user_name;

@property (nonatomic,strong) NSString *nickname;

@end

NS_ASSUME_NONNULL_END
