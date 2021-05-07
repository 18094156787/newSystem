//
//  JNBasketBallMatchZS_ZSDetailInfoTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchZS_PLInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNBasketBallMatchZS_ZSDetailInfoTableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *windLab;

@property (nonatomic,strong) UILabel *equalLab;

@property (nonatomic,strong) UILabel *loseLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,assign) NSInteger type;//4是让分,3是胜负,5是总分
//type  1胜负 2让分 3总分

@property (nonatomic,strong) JNMatchZS_PLInfoModel *model;


@end

NS_ASSUME_NONNULL_END
