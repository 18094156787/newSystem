//
//  JCActivityGuessMore_CompleteVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessMore_CompleteVC.h"
#import "JCActivityGuessCompleteCell.h"
#import "JCActivityDetailModel.h"
#import "JCActivityGuessCompleteHeadView.h"
#import "JCActivityGuess_SPF_CompleteMore_Cell.h"
#import "JCActivityGuessMore_HeadView.h"
@interface JCActivityGuessMore_CompleteVC ()

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCActivityGuessCompleteHeadView *headView;

@end

@implementation JCActivityGuessMore_CompleteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
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
            for (int i=0; i<self.detailModel.get_match_info_array.count; i++){
                JCActivityGuess_SPF_More_MatchModel *model = self.detailModel.get_match_info_array[i];
                if (model.join_match==1) {
                    [self.dataArray addObject:model];
                }
            }
            self.title = self.detailModel.title;
            
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
    [self.tableView registerClass:[JCActivityGuess_SPF_CompleteMore_Cell class] forCellReuseIdentifier:@"JCActivityGuess_SPF_CompleteMore_Cell"];
    
    
}


#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCActivityGuess_SPF_CompleteMore_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityGuess_SPF_CompleteMore_Cell"];
    cell.matchModel = self.dataArray[indexPath.row];
//        cell.detailModel = self.detailModel;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCActivityGuessMore_HeadView *headView = [JCActivityGuessMore_HeadView new];
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


- (JCActivityGuessCompleteHeadView *)headView {
    if (!_headView) {
        _headView = [JCActivityGuessCompleteHeadView new];
    }
    return _headView;
}

@end
