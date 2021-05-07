//
//  JCMineFuntionCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMineCellFunctionView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMineFuntionCell : JCBaseTableViewCell_New

@property (nonatomic,strong) JCMineCellFunctionView *inviteView;

@property (nonatomic,strong) JCMineCellFunctionView *buyRecordView;

@property (nonatomic,strong) JCMineCellFunctionView *accountView;

@property (nonatomic,strong) JCMineCellFunctionView *settingView;

@property (nonatomic,strong) JCMineCellFunctionView *kefuView;

@property (nonatomic,strong) JCMineCellFunctionView *aboutView;

@property (nonatomic,strong) JCMineCellFunctionView *questionView;

@property (nonatomic,copy) void(^JCMineClick)(NSInteger index);





@end

NS_ASSUME_NONNULL_END
