//
//  JCPostPlanSearchMatchHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseAlertView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanSearchMatchHeadView : JCBaseAlertView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UITextField *contentTF;

@property (nonatomic,strong) UIButton *ruleBtn;

@property (nonatomic,copy) void(^JCContentBlock)(NSString *content);

@end

NS_ASSUME_NONNULL_END
