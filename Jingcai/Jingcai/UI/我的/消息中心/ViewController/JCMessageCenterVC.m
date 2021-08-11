//
//  JCMessageCenterVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMessageCenterVC.h"
#import "JCMessageCenterCell.h"
#import "JCMeaasgeModel.h"
#import "JCPostPlanVC.h"
#import "JCPostCheckUserInfoVC.h"
#import "JCMineIncomeWMStickyVC.h"
#import "JCPostCheckUserInfoVC.h"
#import "JCSuggestionFeedBackVC.h"
#import "JCMainTabBarController.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
#import "JCActivityKindVC.h"
#import "JCActivityGuess_SPF_VC.h"
#import "JCYCHongBaoWMVC.h"
#import "JCPostCheckFailVC.h"
#import "JCActivityGuess_SPF_More_VC.h"
@interface JCMessageCenterVC ()

@end

@implementation JCMessageCenterVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
//    self.navigationController.navigationBarHidden = NO;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息中心";
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initView];
    [self refreshData];
//    [self showNonetView];
}

- (void)initView {
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCMessageCenterCell class] forCellReuseIdentifier:@"JCMessageCenterCell"];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"意见反馈" style:1 target:self action:@selector(feedBackItemClick)];
    item.tintColor = JCBlackColor;
    self.navigationItem.rightBarButtonItem = item;
    
    WeakSelf;
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JCMessageCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCMessageCenterCell"];
    cell.selectionStyle = 0;
    cell.backgroundColor = COLOR_F0F0F0;
    JCMeaasgeModel *model = self.dataArray[indexPath.row];

    cell.model = model;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return UITableViewAutomaticDimension;
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCMeaasgeModel *model = self.dataArray[indexPath.row];

    if ([model.type intValue]==1) {
        //type=1是申请专家认证
        if (model.error.length>0&&[model.status integerValue]!=3) {
            JCPostCheckFailVC *vc = [JCPostCheckFailVC new];
            vc.fabu = [JCWUserBall currentUser].fabu;
            [self.navigationController pushViewController:vc animated:YES];
        }

    }
    if ([model.type intValue]==2) {
        //type=2是红榜方案审核
        
        if (model.error.length>0&&[model.status integerValue]!=3) {
            JCPostPlanVC *vc = [JCPostPlanVC new];
            vc.postID = model.other_id;
            vc.type = model.classfly;
            WeakSelf;
            vc.JCRefreshBlock = ^{
//                [weakSelf.tableView reloadData];
                weakSelf.pageNo = 1;
                [weakSelf refreshData];
            };
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if ([model.type intValue]==5) {
        JCMainTabBarController *tabbar =  (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
       [tabbar showMyRedPacketListVC];
    }
    if ([model.type intValue]==12||[model.type intValue]==13) {
        if ([model.status integerValue]!=3) {
            JCActivityDetailCommomVC *vc = [JCActivityDetailCommomVC new];
            vc.actID = model.other_id;
            [self.navigationController pushViewController:vc animated:YES];
        }

    }
    if ([model.type intValue]==14&&[model.status integerValue]!=3) {
        JCActivityGuessVC *vc = [JCActivityGuessVC new];
        vc.actID = model.other_id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.type intValue]==15&&[model.status integerValue]!=3) {
        JCActivityKindVC *vc = [JCActivityKindVC new];
        vc.actID = model.other_id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.type intValue]==18&&[model.status integerValue]!=3) {
        JCActivityGuess_SPF_VC *vc = [JCActivityGuess_SPF_VC new];
        vc.actID = model.other_id;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([model.type intValue]==19&&[model.status integerValue]!=3) {
        JCActivityGuess_SPF_More_VC *vc = [JCActivityGuess_SPF_More_VC new];
        vc.actID = model.other_id;
        [self.navigationController pushViewController:vc animated:YES];
    }

    if ([model.type_class intValue]==4){
        [self.navigationController pushViewController:[JCMineIncomeWMStickyVC new] animated:YES];
    }
    if ([model.type_class intValue]==8&&[model.status integerValue]!=3) {
        [self.navigationController pushViewController:[JCMineIncomeWMStickyVC new] animated:YES];
    }

    if ([model.type_class intValue]==17&&[model.status integerValue]!=3){
        JCYCHongBaoWMVC *vc = [JCYCHongBaoWMVC new];
        vc.selectIndex = 1;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


- (void)refreshData {

    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getPersonCenterMessageListWithPage:self.pageNo success:^(id  _Nullable object) {
           [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCMeaasgeModel class] json:object[@"data"][@"list"]];
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            self.pageNo++;
            [self chageImageStr:@"nodata_message" Title:@"暂时还未有任何消息哦~" BtnTitle:@""];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self chageImageStr:@"nodata_message" Title:@"暂时还未有任何消息哦~" BtnTitle:@""];
         [self endRefresh];
    }];



}

- (void)feedBackItemClick {
    [self.navigationController pushViewController:[JCSuggestionFeedBackVC new] animated:YES];
}

@end
