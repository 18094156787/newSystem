//
//  JCTeamDetailHonorShowView1.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailHonorShowView : JCBaseView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)  UIView *bgView;

@property(nonatomic,strong) UILabel *titleLab;

@property(nonatomic,strong) UIButton *closeBtn;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
