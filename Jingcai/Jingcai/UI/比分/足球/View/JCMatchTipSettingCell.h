//
//  JCMatchTipSettingCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchTipSettingCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UISwitch *switchBtn;

@property (nonatomic,strong) NSString *is_on;

@property (nonatomic,strong) NSString *type;//1是关注,2是声音,3是震动

@property (nonatomic,copy) void(^JCSettingBlock)(NSString *type,NSString *is_on);

@end

NS_ASSUME_NONNULL_END
