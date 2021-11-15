//
//  JCJingCaiAIBigDataMatchTitleView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiAIBigDataMatchTitleView : JCBaseView

@property (nonatomic,strong) UIView *iconView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *tipLab;

@property (nonatomic,copy) void(^JCBlcok)(void);

@end

NS_ASSUME_NONNULL_END
