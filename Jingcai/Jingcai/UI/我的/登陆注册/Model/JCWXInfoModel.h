//
//  JCWXInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCWXInfoModel : NSObject

@property (nonatomic,strong) NSString *openid;

@property (nonatomic,strong) NSString *unionid;

@property (nonatomic,strong) NSString *nickname;

@property (nonatomic,strong) NSString *headimgurl;

@property (nonatomic,strong) NSString *sex;

@property (nonatomic,strong) NSString *city;

@property (nonatomic,strong) NSString *country;

@property (nonatomic,strong) NSString *province;

@end

NS_ASSUME_NONNULL_END
