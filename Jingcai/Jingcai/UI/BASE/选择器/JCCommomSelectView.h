//
//  JCCommomSelectView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCCommomSelectView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithTitle:(NSString *)title;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) UIView *bgView;

@property(nonatomic,copy) void(^JCTitleBlock)(NSString *title,NSInteger index);

- (void)show;

@end

NS_ASSUME_NONNULL_END
