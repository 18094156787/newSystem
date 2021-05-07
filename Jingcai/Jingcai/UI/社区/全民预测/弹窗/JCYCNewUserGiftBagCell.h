//
//  JCYCNewUserGiftBagCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityRedPacketModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCNewUserGiftBagCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) JCActivityRedPacketModel *model;

@property (nonatomic,strong) JCActivityRedPacketModel *firstLoginModel;

@end

NS_ASSUME_NONNULL_END
