//
//  JCInviteCodeInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/15.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCInviteCodeInfoModel : JCWBaseBall

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *user_id;

@property (nonatomic,copy) NSString *jifen;

@property (nonatomic,copy) NSString *lianqd;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *code;

@property (nonatomic,copy) NSString *status;

@property (nonatomic,copy) NSString *count;

@property (nonatomic,copy) NSString *count_prize;

@property (nonatomic,copy) NSString *url;

@property (nonatomic,copy) NSString *friend_url;

@property (nonatomic,copy) NSString *information;

@property (nonatomic,copy) NSString *position;

@property (nonatomic,copy) NSString *desc;

#pragma mark 扩展

@property (nonatomic,copy) NSString *user_img;

@property (nonatomic,copy) NSString *user_name;

@property (nonatomic,copy) NSString *user_phone;

@property (nonatomic,copy) NSString *time;

@property (nonatomic,copy) NSString *created_at;
@end

NS_ASSUME_NONNULL_END
