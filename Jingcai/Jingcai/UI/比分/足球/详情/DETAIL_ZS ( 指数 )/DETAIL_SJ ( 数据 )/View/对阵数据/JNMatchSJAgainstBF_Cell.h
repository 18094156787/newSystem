//
//  JNMatchSJAgainstBF_Cell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataMonthProduceModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstBF_Cell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeTeamLab;

@property (nonatomic,strong) UILabel *awayTeamLab;

@property (nonatomic,strong) UIImageView *leftLineImgView;

@property (nonatomic,strong) UIImageView *rightLineImgView;

@property (nonatomic,strong) JCBigDataMonthProduceModel *model;

@end

NS_ASSUME_NONNULL_END
