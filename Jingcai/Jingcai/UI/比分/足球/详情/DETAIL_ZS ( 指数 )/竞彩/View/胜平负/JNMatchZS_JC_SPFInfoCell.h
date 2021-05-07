//
//  JNMatchZS_JCInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchSPFBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_JC_SPFInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *windLab;

@property (nonatomic,strong) UILabel *eqalLab;

@property (nonatomic,strong) UILabel *loseLab;

@property (nonatomic,strong) JNMatchSPFBall *model;

@end

NS_ASSUME_NONNULL_END
