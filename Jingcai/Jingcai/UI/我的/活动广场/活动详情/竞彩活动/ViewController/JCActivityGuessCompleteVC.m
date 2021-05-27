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
@interface JCActivityGuessCompleteVC ()

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCActivityGuessCompleteHeadView *headView;

@property (nonatomic,strong) NSArray *dataSource;

@end

@implementation JCActivityGuessCompleteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubViews];
    [self refreshData];
}


- (void)refreshData {
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
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(300));
    self.tableView.tableHeaderView = self.headView;
    
    [self.tableView registerClass:[JCActivityGuessCompleteCell class] forCellReuseIdentifier:@"JCActivityGuessCompleteCell"];
}


#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCActivityGuessCompleteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityGuessCompleteCell"];
    cell.detailModel = self.detailModel;
    cell.dataSource = self.dataSource;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.detailModel.activity_option.count<=10) {
        NSInteger count = ceil(self.detailModel.activity_option.count/2.0f);
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

- (JCActivityGuessCompleteHeadView *)headView {
    if (!_headView) {
        _headView = [JCActivityGuessCompleteHeadView new];
    }
    return _headView;
}

@end
