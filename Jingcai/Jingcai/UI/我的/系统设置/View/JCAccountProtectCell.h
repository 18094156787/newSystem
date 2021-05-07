//
//  JCAccountProtectCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/3.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCAccountProtectCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UIButton *settingBtn;

@end

NS_ASSUME_NONNULL_END
