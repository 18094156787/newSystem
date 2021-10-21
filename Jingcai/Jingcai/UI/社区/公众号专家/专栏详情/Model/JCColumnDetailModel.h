//
//  JCColumnDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailModel : JCWBaseBall

@property (nonatomic,copy)NSString *id;//专栏id

@property (nonatomic,copy)NSString *title;//专栏名称

@property (nonatomic,copy)NSString *image;//专栏图片

@property (nonatomic,copy)NSString *author_id;

@property (nonatomic,copy)NSString *synopsis;//专栏简介

@property (nonatomic,copy)NSString *period;//期数

@property (nonatomic,copy)NSString *ordering_information;//订购须知

@property (nonatomic,copy)NSString *subscribe;//订阅人数

@property (nonatomic,copy)NSString *user_name;

@property (nonatomic,copy)NSString *user_img;

@property (nonatomic,copy)NSString *is_subscribe;//用户是否关注,0未关注,1关注

@end

NS_ASSUME_NONNULL_END
