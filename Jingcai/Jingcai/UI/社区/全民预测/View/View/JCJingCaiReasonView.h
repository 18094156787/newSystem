//
//  JCJingCaiReasonView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/11/29.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "EMTextView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCJingCaiReasonView : JCBaseView

@property (strong, nonatomic) UIImageView *topImgView;

@property (strong, nonatomic) UIImageView *bottomImgView;

@property (strong, nonatomic) UIView *bgView;

@property (strong, nonatomic) UILabel *titleLab;

@property (strong, nonatomic) UIButton *sureBtn;

@property (strong, nonatomic) EMTextView *contentTV;

@property (nonatomic, copy) void(^JCReasonBlock)(NSString *reason);

@end

NS_ASSUME_NONNULL_END
