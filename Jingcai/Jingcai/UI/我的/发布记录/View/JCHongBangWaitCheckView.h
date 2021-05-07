//
//  JCHongBangWaitCheckView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDianPingBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangWaitCheckView : JCBaseView

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (strong, nonatomic) JCDianPingBall * dianPingBall;

@end

NS_ASSUME_NONNULL_END
