//
//  JCKindSignTipView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKindSignTipView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,copy) void(^JCCloseBlock)(void);

@end

NS_ASSUME_NONNULL_END
