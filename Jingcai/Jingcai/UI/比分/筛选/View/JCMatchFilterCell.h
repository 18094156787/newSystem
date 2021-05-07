//
//  JCMatchFilterCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFilterCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *containView;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSMutableArray *btnArray;

@property (nonatomic,copy) void(^JCSelectBlock)(void);

@end

NS_ASSUME_NONNULL_END
