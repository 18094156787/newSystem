//
//  JCBasketBallMatchTongJiDataHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchTongJiDataHeadView : JCBaseView

@property (nonatomic,strong) UIView *homeLineView;

@property (nonatomic,strong) UIView *awayLineView;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic,strong) JCBasketBallMatchBall *matchBall;

@end

NS_ASSUME_NONNULL_END
