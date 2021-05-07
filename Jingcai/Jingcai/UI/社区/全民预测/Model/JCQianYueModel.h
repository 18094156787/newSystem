//
//  JCQianYueModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCQianYueModel : JCWBaseBall

@property (nonatomic,copy) NSString *qy;// 1 签约弹窗

@property (nonatomic,copy) NSString *wx;

#pragma mark//新版本接口

@property (nonatomic,copy) NSString *is_sign;// 1 签约弹窗

@property (nonatomic,copy) NSString *wechat;//
@end

NS_ASSUME_NONNULL_END
