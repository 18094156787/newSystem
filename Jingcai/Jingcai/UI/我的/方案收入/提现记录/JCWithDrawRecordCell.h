//
//  JCWithDrawRecordCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWithdrawalModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCWithDrawRecordCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UILabel *moneyLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) JCWithdrawalModel *model;

@end

NS_ASSUME_NONNULL_END
