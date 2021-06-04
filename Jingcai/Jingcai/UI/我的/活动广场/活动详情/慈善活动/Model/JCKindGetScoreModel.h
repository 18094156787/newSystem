//
//  JCKindGetScoreModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKindGetScoreModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,assign) NSInteger type;

@property (nonatomic,strong) NSString *score;

@property (nonatomic,strong) NSString *user_name;

@property (nonatomic,strong) NSString *created_at;

@end

NS_ASSUME_NONNULL_END
