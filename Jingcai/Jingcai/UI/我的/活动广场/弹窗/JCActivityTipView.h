//
//  JCActivityTipView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/23.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityTipView : JCBaseView

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic,copy) void(^JCSureBlock)(void);

@property (nonatomic,copy) void(^JCCancelBlock)(void);

@end

NS_ASSUME_NONNULL_END
