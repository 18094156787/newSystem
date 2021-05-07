//
//  JNMatchDetailZRPlayerItemView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JNMatchLineupBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchDetailZRPlayerItemView : JCBaseView

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UIImageView *numberImageView;

@property (nonatomic,strong) UIView *numberBgView;

@property (nonatomic,strong) UILabel *numberLab;

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,assign) BOOL isHomeTeam;

@property (nonatomic,strong) JNMatchLineupBall * lineupBall;

@end

NS_ASSUME_NONNULL_END
