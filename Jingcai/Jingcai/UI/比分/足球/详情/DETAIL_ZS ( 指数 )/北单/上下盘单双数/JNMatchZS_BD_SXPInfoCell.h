//
//  JNMatchZS_BD_SXPInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchSXPBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_BD_SXPInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *sdLab;//上单

@property (nonatomic,strong) UILabel *ssLab;//上双

@property (nonatomic,strong) UILabel *xdLab;//下单

@property (nonatomic,strong) UILabel *xsLab;//下双

@property (nonatomic,strong) JNMatchSXPBall *model;

@end

NS_ASSUME_NONNULL_END
