//
//  JCJingCaiRuleModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/10/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiRuleModel : JCWBaseBall

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *content;

@property (nonatomic,assign) float contentHeight;

@end

NS_ASSUME_NONNULL_END
