//
//  JCWNewsBall.h
//  Jingcai
//
//  Created by Rain on 2018/12/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCImageModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface JCWNewsBall : JCWBaseBall <NSCoding>
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * title;//标题
@property (strong, nonatomic) NSString * name;//作者
@property (strong, nonatomic) NSString * pageviews;//浏览量
@property (strong, nonatomic) NSString * desc;
@property (strong, nonatomic) NSString * time;//标题
@property (assign, nonatomic) NSInteger is_top;//是否置顶

#pragma mark//新版本接口

@property (strong, nonatomic) NSString *zucai_information_id;

@property (strong, nonatomic) NSString *created_at;

@property (strong, nonatomic) JCImageModel * image;//图片
@end
NS_ASSUME_NONNULL_END
