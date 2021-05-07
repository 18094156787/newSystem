//
//  JNMatchZS_ZSDetailInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JNMatchZS_PLModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_ZSDetailInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) JNMatchZS_PLModel *model;

@end

NS_ASSUME_NONNULL_END
