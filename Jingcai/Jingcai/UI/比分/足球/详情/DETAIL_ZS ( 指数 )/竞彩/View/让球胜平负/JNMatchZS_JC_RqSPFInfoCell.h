//
//  JNMatchZS_JC_RqSPFInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchSPFBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_JC_RqSPFInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *rballLab;//让球数

@property (nonatomic,strong) UILabel *rwindLab;

@property (nonatomic,strong) UILabel *reqalLab;

@property (nonatomic,strong) UILabel *rloseLab;

@property (nonatomic,strong) JNMatchSPFBall *model;


@end

NS_ASSUME_NONNULL_END
