//
//  JCActivityGuessResultShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuessResultShowView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
