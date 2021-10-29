//
//  JCPresellColumnModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
//预售专栏
@interface JCPresellColumnModel : JCWBaseBall

@property (nonatomic,copy)NSString *period;//期数

@property (nonatomic,copy)NSString *period_foreshow;//周期预告

@end

NS_ASSUME_NONNULL_END
