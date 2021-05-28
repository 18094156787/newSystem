//
//  JCActivityKindCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "HMSegmentedControl.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityKindCell : JCBaseTableViewCell_New

@property (nonatomic,strong) HMSegmentedControl *segment;

@end

NS_ASSUME_NONNULL_END
