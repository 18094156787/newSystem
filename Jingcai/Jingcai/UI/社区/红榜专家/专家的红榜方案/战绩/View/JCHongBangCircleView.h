//
//  JCHongBangCircleView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangCircleView : JCBaseView

@property (nonatomic, strong) CAShapeLayer *zou_progressLayer;

@property (nonatomic, strong) CAShapeLayer *hong_progressLayer;

@property (nonatomic, strong) CAShapeLayer *hei_progressLayer;

@property (nonatomic, strong) UIColor *drawColor;

@property (nonatomic, strong) UILabel *hongLab;

@property (nonatomic, strong) UILabel *zouLab;

@property (nonatomic, strong) UILabel *heiLab;

@property (nonatomic, assign) CGFloat hongProgress;

@property (nonatomic, assign) CGFloat zouProgress;

@property (nonatomic, assign) CGFloat heiProgress;


- (void)drawProgress;

@end

NS_ASSUME_NONNULL_END
