//
//  JCYCResustShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCYCUserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCResustShowView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,copy) void(^JCCloseBlock)(void);

@property (nonatomic,copy) void(^JCSureBlock)(void);

@property (nonatomic,strong) JCYCUserInfoModel *yueceResultModel;



@end

NS_ASSUME_NONNULL_END
