//
//  JCUpdateBall.h
//  Jingcai
//
//  Created by Administrator on 2019/4/11.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCUpdateBall : JCWBaseBall
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * api_new;
@property (nonatomic, strong) NSString * msg;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSDate * created_at;
@property (nonatomic, strong) NSDate * updated_at;
@property (nonatomic, strong) NSString *mandatory;//是否强更
@end
NS_ASSUME_NONNULL_END
