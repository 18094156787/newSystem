//
//  JCHongBangCheckFailureView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDianPingBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangCheckFailureView : JCBaseView

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *reasonLab;

@property (nonatomic, strong) UILabel *editLab;

@property (nonatomic, strong) UIView *editView;

@property (nonatomic, strong) UIImageView *editIconView;

@property (strong, nonatomic) JCDianPingBall * dianPingBall;

@end

NS_ASSUME_NONNULL_END
