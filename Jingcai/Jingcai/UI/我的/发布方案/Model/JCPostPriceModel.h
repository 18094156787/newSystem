//
//  JCPostPriceModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCPostPriceModel : NSObject

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *sf;

@property (nonatomic,strong) NSString *refund;//1是不中退款

@end

NS_ASSUME_NONNULL_END
