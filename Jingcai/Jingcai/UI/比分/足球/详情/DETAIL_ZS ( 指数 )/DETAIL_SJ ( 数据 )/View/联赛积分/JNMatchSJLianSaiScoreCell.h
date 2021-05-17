//
//  JNMatchSJLianSaiScoreCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchTableBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJLianSaiScoreCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *quanChangLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UILabel *winLab;

@property (nonatomic,strong) UILabel *equalLab;

@property (nonatomic,strong) UILabel *loselLab;

@property (nonatomic,strong) UILabel *delLab;

@property (nonatomic,strong) UILabel *shiLab;

@property (nonatomic,strong) UILabel *scorelLab;

@property (nonatomic,strong) UILabel *rankLab;

@property (nonatomic,strong) UILabel *rateLab;

@property (nonatomic,strong) JNMatchTableBall *tableBall;

@end

NS_ASSUME_NONNULL_END
