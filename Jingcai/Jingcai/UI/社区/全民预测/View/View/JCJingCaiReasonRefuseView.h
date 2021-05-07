//
//  JCJingCaiReasonRefuseView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/2.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiReasonRefuseView : JCBaseView

@property (strong, nonatomic) UIImageView *topImgView;

@property (strong, nonatomic) UIView *bgView;

@property (strong, nonatomic) UILabel *titleLab;

@property (strong, nonatomic) UILabel *contentLab;

@property (strong, nonatomic) UIButton *sureBtn;

@property (nonatomic, copy) void(^JCSureBlock)(void);

@end

NS_ASSUME_NONNULL_END
