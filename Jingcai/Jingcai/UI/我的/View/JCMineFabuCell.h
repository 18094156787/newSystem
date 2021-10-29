//
//  JCMineFabuCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMineCellItemView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMineFabuCell : JCBaseTableViewCell_New

@property (nonatomic,strong) JCMineCellItemView *fabuView;

@property (nonatomic,strong) JCMineCellItemView *incomeView;

@property (nonatomic,strong) JCMineCellItemView *recordView;

@property (nonatomic,strong) JCMineCellItemView *ruleView;

@property (nonatomic,copy) void(^JCMineClick)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
