//
//  JNMatchSJZhanjiCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchZJBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJZhanjiCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic, strong) JNMatchZJBall * zjBall;

@end

NS_ASSUME_NONNULL_END
