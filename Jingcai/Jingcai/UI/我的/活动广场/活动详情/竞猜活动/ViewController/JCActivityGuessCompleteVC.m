//
//  JCActivityGuessCompleteVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessCompleteVC.h"
#import "JCActivityGuessCompleteCell.h"
#import "JCActivityDetailModel.h"
#import "JCActivityGuessCompleteHeadView.h"
#import "JCActivityGuess_SPF_CompleteCell.h"
@interface JCActivityGuessCompleteVC ()

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCActivityGuessCompleteHeadView *headView;

@property (nonatomic,strong) NSArray *dataSource;

@end

@implementation JCActivityGuessCompleteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initSubViews];
    [self refreshData];
}


- (void)refreshData {
    if (self.is_more_spf) {
        //竞猜胜平负 多场不需要该接口
        return;
    }
    [self.view showLoading];
    JCActivityService *service = [JCActivityService service];
    [service getActivityDetailWithActID:NonNil(self.actID) success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.detailModel = (JCActivityDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCActivityDetailModel class]];
            self.title = self.detailModel.title;
            NSMutableArray *array = [NSMutableArray array];
            for (JCActivityOptionModel *model in self.detailModel.activity_option) {
                if ([model.user_choice integerValue]==1) {
                    [array addObject:model];
                    self.selectOptionModel = model;
                }
            }
            self.dataSource = [NSArray arrayWithArray:array];
            [self.tableView reloadData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

- (void)initSubViews {
    self.tableView.estimatedRowHeight = 100;
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(300));
    self.tableView.tableHeaderView = self.headView;
    
    [self.tableView registerClass:[JCActivityGuessCompleteCell class] forCellReuseIdentifier:@"JCActivityGuessCompleteCell"];
    [self.tableView registerClass:[JCActivityGuess_SPF_CompleteCell class] forCellReuseIdentifier:@"JCActivityGuess_SPF_CompleteCell"];
    
    
}


#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.is_more_spf) {
        return self.matchArray.count;
    }
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.is_spf) {
        JCActivityGuess_SPF_CompleteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityGuess_SPF_CompleteCell"];
        cell.selectOptionModel = self.selectOptionModel;
        cell.detailModel = self.detailModel;
        return cell;
    }
    if (self.is_more_spf) {
        JCActivityGuess_SPF_CompleteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityGuess_SPF_CompleteCell"];
        cell.matchModel = self.matchArray[indexPath.row];
//        cell.detailModel = self.detailModel;
        return cell;
    }
    
    JCActivityGuessCompleteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityGuessCompleteCell"];
//    cell.detailModel = self.detailModel;
    cell.dataSource = self.dataSource;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.is_spf) {
        return UITableViewAutomaticDimension;
    }
    if (self.is_more_spf) {
        return UITableViewAutomaticDimension;
    }
    
    if (self.dataSource.count<=10) {
        NSInteger count = ceil(self.dataSource.count/2.0f);
        return 62*count+65;
    }
//        return 378;
    return 410;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [UIView new];
    headView.backgroundColor = COLOR_F0F0F0;
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)setMatchArray:(NSArray *)matchArray {
    _matchArray = matchArray;
    [self.tableView reloadData];
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    [self.tableView reloadData];
}

- (JCActivityGuessCompleteHeadView *)headView {
    if (!_headView) {
        _headView = [JCActivityGuessCompleteHeadView new];
    }
    return _headView;
}

@end
