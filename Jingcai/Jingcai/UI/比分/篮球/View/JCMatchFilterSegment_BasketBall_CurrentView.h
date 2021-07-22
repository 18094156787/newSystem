//
//  JCMatchFilterSegment_BasketBall_CurrentView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFilterSegment_BasketBall_CurrentView : JCBaseView

@property (nonatomic,strong) UIImageView *backImgView;

@property (nonatomic,strong) UIButton *currentBtn;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,copy) void(^JCBlock)(void);

@end

NS_ASSUME_NONNULL_END
