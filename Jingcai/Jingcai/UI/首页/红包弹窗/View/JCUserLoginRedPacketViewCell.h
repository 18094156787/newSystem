//
//  JCUserLoginRedPacketViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCActivityRedPacketModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCUserLoginRedPacketViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) JCActivityRedPacketModel *model;//首登

@property (nonatomic,strong) JCActivityRedPacketModel *pp_Model;//新人红包

@end

NS_ASSUME_NONNULL_END
