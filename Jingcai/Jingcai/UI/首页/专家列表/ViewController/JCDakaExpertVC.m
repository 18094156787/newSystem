//
//  JCDakaExpertVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaExpertVC.h"
#import "JCDakaExpertCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCHongbangExpertCell.h"
#import "JCHongbangWMstckyVC.h"
@interface JCDakaExpertVC ()

@end

@implementation JCDakaExpertVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initViews];
    [self refreshData];
    
}
- (void)refreshData {
    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    WeakSelf;
    JCHomeService_New * service = [JCHomeService_New service];
    [service getExpertListWithType:self.type page:self.pageNo Success:^(id  _Nullable object) {
        [weakSelf endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            
            NSArray * dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCWExpertBall class]];
            //            [weakSelf.dataArray removeAllObjects];
            [weakSelf.dataArray addObjectsFromArray:dataArray];
            [weakSelf.tableView reloadData];
            
            if (dataArray.count < PAGE_LIMIT) {
                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            self.pageNo++;
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [weakSelf endRefresh];
    }];

}

- (void)initViews {
    self.view.backgroundColor = COLOR_F0F0F0;
    self.tableView.separatorStyle = 0;
    self.tableView.separatorInset = UIEdgeInsetsMake(0.0f, AUTO(15), 0.0f, AUTO(15));
    // 表格注册cell
    [self.tableView registerClass:[JCDakaExpertCell class] forCellReuseIdentifier:@"JCDakaExpertCell"];
    [self.tableView registerClass:[JCHongbangExpertCell class] forCellReuseIdentifier:@"JCHongbangExpertCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.offset(8);
        make.bottom.equalTo(self.view).mas_offset(-kBottomTabSafeAreaHeight);
    }];
    
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        
        [weakSelf refreshData];
    }];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.type integerValue]==1) {
       JCDakaExpertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCDakaExpertCell"];
         cell.contentView.backgroundColor = JCWhiteColor;
        JCWExpertBall *model =  self.dataArray[indexPath.row];
        cell.model = model;
        WeakSelf;
        cell.JCConcernBlock = ^{
            [weakSelf concernTuiJianWithModel:model];
        };
         return cell;
    }
    JCHongbangExpertCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangExpertCell"];
     cell.contentView.backgroundColor = JCWhiteColor;
     JCWExpertBall *model =  self.dataArray[indexPath.row];
     cell.model = model;
    WeakSelf;
    cell.JCConcernBlock = ^{
        [weakSelf concernTuiJianWithModel:model];
    };
     return cell;
 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.type integerValue]==1) {
        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
        JCWExpertBall *model = self.dataArray[indexPath.row];
        vc.autherID = model.id;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    
    JCHongbangWMstckyVC * userVC = [JCHongbangWMstckyVC new];
    JCWExpertBall *model = self.dataArray[indexPath.row];
    userVC.autherID = model.user_id;
    [self.navigationController pushViewController:userVC animated:YES];
    
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AUTO(85);
}




- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F6F6F6;
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==1) {
        return AUTO(10);
    }
    return 0.0001f;
}

- (void)concernTuiJianWithModel:(JCWExpertBall *)model{
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    WeakSelf;
    BOOL isAdd = NO;
    if ([model.is_subscribe isEqualToString:@"关注"]) {
        isAdd = YES;
    }
    [self.view showLoading];
    JCHomeService_New * service = [JCHomeService_New service];
    //默认是公众号
    NSString *type = @"1";
    NSString *user_ID =model.user_id;

    if ([self.type integerValue]==1) {
        //如果是红榜
        type = @"2";
        user_ID = model.id;
    }
    [service gzUserWithId:user_ID type:type success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            model.is_subscribe = isAdd?@"已关注":@"关注";
//            model.fensi = object[@"data"][@"fensi"];
            [weakSelf.tableView reloadData];

        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];


}

@end
