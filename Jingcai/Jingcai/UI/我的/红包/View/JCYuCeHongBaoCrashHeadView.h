//
//  JCYuCeHongBaoCrashHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/5.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYuCeHongBaoCrashHeadView : JCBaseView

@property (nonatomic,strong) UILabel *moneyLab;//未提现

@property (nonatomic,strong) UILabel *totalyLab;//累计提现

@property (nonatomic,strong) UIButton *submitBtn;

@property (nonatomic,copy) void(^JCRefresh)(void);

@property (nonatomic,strong) NSString *tips;// 1只有大额红包2有大额和小额红包 3.隐藏全部提现按钮

@end

NS_ASSUME_NONNULL_END
