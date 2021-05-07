//
//  JCAIPlanBuyInfoView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCAIPlanBuyInfoView : JCBaseView

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, strong) JCHongBangBall *dianPingBall;

@property (nonatomic, assign) BOOL isMine;

@end

NS_ASSUME_NONNULL_END
