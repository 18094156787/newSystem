//
//  JCActivityPrizeShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityPrizeShowView.h"
#import "JCActivityPrizeTableViewCell.h"
@implementation JCActivityPrizeShowView
- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(30)+kNavigationBarHeight);
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.height.mas_equalTo(AUTO(550));
    }];
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.mas_equalTo(AUTO(55));
    }];
    
    [self.bgView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.titleLab.mas_bottom);
        make.bottom.offset(AUTO(-85));
    }];
    
    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(AUTO(-25));
        make.centerX.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
    }];
    
    [self.tableView registerClass:[JCActivityPrizeTableViewCell class] forCellReuseIdentifier:@"JCActivityPrizeTableViewCell"];
    
    WeakSelf;
    [self.sureBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    JCActivityGoodsTitleModel *titleModel = self.dataSource[section];
    return titleModel.dataArray.count;
 
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCActivityPrizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityPrizeTableViewCell"];
    cell.selectionStyle = 0;
    JCActivityGoodsTitleModel *titleModel = self.dataSource[indexPath.section];
    cell.model = titleModel.dataArray[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [UIView new];
    JCActivityGoodsTitleModel *titleModel = self.dataSource[section];
    UILabel *lab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    if ([titleModel.grade integerValue]>0) {
        lab.text = [NSString stringWithFormat:@"累积充值%@元",NonNil(titleModel.grade)];
    }else{
        lab.text = @"";
    }
    
    lab.frame = CGRectMake(AUTO(15),2, SCREEN_WIDTH-30, 30);
    [headView addSubview:lab];
    return headView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    JCActivityGoodsTitleModel *titleModel = self.dataSource[section];
    if ([titleModel.grade integerValue]>0) {
        return 30;
    }else{
        return 0.01f;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//     JCJingCaiResultMatchModel *model =self.dataArray[indexPath.row];
//    if (model.hb.length>0) {
//        return AUTO(40)+AUTO(90)*model.match.count;
//    }
//    return AUTO(20)+AUTO(90)*model.match.count;
//    return AUTO(95);
    return UITableViewAutomaticDimension;
}


- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    if (dataArray.count==0) {
        return;
    }
    if (dataArray.count<5) {
        JCActivityGoodsModel *obj = dataArray.firstObject;
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(30)+kNavigationBarHeight);
            make.left.offset(AUTO(30));
            make.right.offset(AUTO(-30));
            if ([obj.grade integerValue]>0) {
                make.height.mas_equalTo(AUTO(180)+AUTO(92)*dataArray.count);
            }else{
                make.height.mas_equalTo(AUTO(160)+AUTO(92)*dataArray.count);
            }
        }];
    }
    self.dataSource = [NSMutableArray array];
    for (int i=0; i<dataArray.count; i++) {
        JCActivityGoodsModel *obj = dataArray[i];
        if (i==0||![self.titleModel.grade isEqualToString:obj.grade]) {
            
            JCActivityGoodsTitleModel *titleModel = [JCActivityGoodsTitleModel new];
            titleModel.grade = obj.grade;
            [titleModel.dataArray addObject:obj];
            [self.dataSource addObject:titleModel];
            self.titleModel = titleModel;
        }else{
            [self.titleModel.dataArray addObject:obj];

        }
    }
//    [dataArray enumerateObjectsUsingBlock:^(JCActivityGoodsModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (<#condition#>) {
//            <#statements#>
//        }
//
//    }];

   
    [self.tableView reloadData];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:20];
    }
    return _bgView;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"奖励物品详情" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"知道了" FontSize:AUTO(16) BackGroundColor:JCBaseColor TextColor:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _sureBtn;
}

- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:1];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.estimatedRowHeight = 100;
        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
//        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}



@end
