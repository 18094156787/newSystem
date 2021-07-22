//
//  JCActivityGuess_SPF_More_CheckView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCActivityDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGuess_SPF_More_CheckView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIView *titleLab;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) UIButton *cancelBtn;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,copy) void(^JCSureBlock)(void);

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
