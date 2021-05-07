//
//  JCActivityOptionModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityOptionModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;//选项ID

@property (nonatomic,strong) NSString *activity_id;//活动ID

@property (nonatomic,strong) NSString *name;//选项名称

@property (nonatomic,strong) NSString *image_url;//图片url

@property (nonatomic,strong) NSString *correct;//是否正确 1是 0否

@property (nonatomic,strong) NSString *user_choice;//是否用户选择 1是 0否

@property (nonatomic,assign) NSInteger count;//被选择次数

@property (nonatomic,strong) NSString *local_choice;//本地选择 1是 0否


@end

NS_ASSUME_NONNULL_END
