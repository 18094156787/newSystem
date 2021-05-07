//
//  JNMatchDetailZRUserCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchLineupBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNMatchDetailZRUserCell : JCBaseTableViewCell_New

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *numLab;

@property (nonatomic, strong) UIImageView *headImgView;

@property (nonatomic, strong) UILabel *nameLab;

@property (nonatomic, strong) JNMatchLineupBall * lineupBall;

@property (nonatomic, assign) BOOL isHomeTeam;

@end

NS_ASSUME_NONNULL_END
