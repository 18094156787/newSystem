//
//  JCActivityKindMyPrizeVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindMyPrizeVC.h"
#import "JCActivityPrizeTableViewCell.h"
#import "JCKindUserCompleteModel.h"
@interface JCActivityKindMyPrizeVC ()

@end

@implementation JCActivityKindMyPrizeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentHeight = 440;
    [self initViews];
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"refreshKindActivityDetail" object:nil];

}

- (void)refreshData {
    self.pageNo =1;
    [self getDataList];
}

- (void)getDataList {
    [self.jcWindow showLoading];
    JCActivityService *service = [JCActivityService service];
    [service getKindActivityDetailContentWithActID:NonNil(self.actID) type:@"3" Page:self.pageNo success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCKindUserCompleteModel class]];
            [self.dataArray addObjectsFromArray:dataArray];
            self.pageNo++;
            [self.tableView reloadData];
            
            
            
            [self chageImageStr:@"ic_empty_gift" Title:@"您还未获得任何奖励！\n快去参与活动领取奖励吧！" BtnTitle:@""];


            
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];

}

- (void)initViews {
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCActivityPrizeTableViewCell class] forCellReuseIdentifier:@"JCActivityPrizeTableViewCell"];
    

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [self refreshData];
    }];
    emptyView.contentViewOffset = -30;
    self.tableView.ly_emptyView = emptyView;

    
    
    emptyView.titleLabTextColor = UIColorFromRGB(0x9DAAB8);
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JCActivityPrizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityPrizeTableViewCell"];
    cell.selectionStyle = 0;
//    JCActivityGoodsTitleModel *titleModel = self.dataSource[indexPath.section];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.JCHeightBlock) {
        self.JCHeightBlock(self.contentH);
    }
    
}
- (UIView *)listView {
    return self.view;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
