//
//  JCWithDrawRecordItemCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWithDrawRecordItemCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,assign) BOOL showAttr;//展示富文本

@property (nonatomic,strong) NSString *content;



@end

NS_ASSUME_NONNULL_END
