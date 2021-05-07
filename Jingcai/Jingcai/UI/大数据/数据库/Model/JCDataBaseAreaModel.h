//
//  JCDataBaseAreaModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDataBaseAreaModel : JCWBaseBall

@property (nonatomic,copy) NSString *area_id;

@property (nonatomic,copy) NSString *area_name;

@property (nonatomic,copy) NSString *area_logo;

#pragma mark//新版接口

@property (nonatomic,copy) NSString *category_img;

@property (nonatomic,copy) NSString *category_id;

@property (nonatomic,copy) NSString *name_zh;

@end

NS_ASSUME_NONNULL_END
