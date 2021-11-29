//
//  JCHistoryPayDataModelEmptyCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCHistoryPayDataModelEmptyCell.h"

@implementation JCHistoryPayDataModelEmptyCell

- (void)initViews {
    self.contentView.backgroundColor = JCClearColor;
    self.backgroundColor = JCClearColor;
    //    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    //
        JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        
        }];
    emptyView.imageStr = @"jc_dataModel_empty";
    emptyView.titleStr = @"当前暂无比赛数据~";
    emptyView.titleLabTextColor = COLOR_9F9F9F;
    emptyView.titleLabFont = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    [self.contentView addSubview:emptyView];
//        self.tableView.ly_emptyView = emptyView;
//        [self chageImageStr:@"jc_dataModel_empty" Title:@"当前暂无比赛数据~" BtnTitle:@""];
//    //

}
@end
