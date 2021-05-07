//
//  JNMatchZS_ZSDetailInfoTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchZS_PLInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_ZSDetailInfoTableViewCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *windLab;

@property (nonatomic,strong) UILabel *equalLab;

@property (nonatomic,strong) UILabel *loseLab;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) JNMatchZS_PLInfoModel *model;

@end

NS_ASSUME_NONNULL_END
