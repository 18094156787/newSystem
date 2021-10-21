//
//  JCColumnDetailIntroduceVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailIntroduceVC.h"
#import "JCColumnDetailIntroduceHeadView.h"
#import "JCColumnDetailYushowHotCell.h"
#import "JCColumnDetailYushowStatusCell.h"
#import "JCColumnDetailTitleHeadView.h"
#import "JCColumnDetailZhanjiChartCell.h"
#import "JCColumnRuleCell.h"
#import "JCColumnInstructionsView.h"
#import "JCColumnDetailModel.h"
@interface JCColumnDetailIntroduceVC ()

@property (nonatomic,strong) JCColumnDetailIntroduceHeadView *headView;

@property (nonatomic,strong) JCColumnDetailModel *detailModel;

@property (nonatomic,assign) float cellHeight;

@end

@implementation JCColumnDetailIntroduceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}

- (void)refreshData {

    [self.jcWindow showLoading];

    
    JCColumnService *service = [JCColumnService new];
    [service getColumnInfoWithID:NonNil(self.column_id) success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self endRefresh];
            self.detailModel = (JCColumnDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCColumnDetailModel class]];
            if (self.JCBlock) {
                self.JCBlock(self.detailModel);
            }
//            if (self.pageNo==1) {
//                [self.dataArray removeAllObjects];
//            }
//            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"best_new_plans"] class:[JCWTjInfoBall class]];
//
//            [self.dataArray addObjectsFromArray:array];
//            if (array.count < PAGE_LIMIT) {
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
//            [self.tableView reloadData];
//            self.pageNo++;



        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];
}
- (void)initViews {
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 32);
    self.headView.titleArray = @[@"",@"",@"",@""];
    self.tableView.tableHeaderView = self.headView;
    
    UIView *footView = [UIView new];
    footView.backgroundColor = JCClearColor;
    footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50+kBottomTabSafeAreaHeight);
    self.tableView.tableFooterView = footView;
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    // 表格注册cell
    [self.tableView registerClass:[JCColumnDetailYushowHotCell class] forCellReuseIdentifier:@"JCColumnDetailYushowHotCell"];
    [self.tableView registerClass:[JCColumnDetailYushowStatusCell class] forCellReuseIdentifier:@"JCColumnDetailYushowStatusCell"];
    [self.tableView registerClass:[JCColumnDetailZhanjiChartCell class] forCellReuseIdentifier:@"JCColumnDetailZhanjiChartCell"];
    [self.tableView registerClass:[JCColumnRuleCell class] forCellReuseIdentifier:@"JCColumnRuleCell"];
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(AUTO(-76)-kBottomTabSafeAreaHeight);
    }];
    

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

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCColumnDetailYushowHotCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnDetailYushowHotCell"];
        WeakSelf;
        cell.JCBlock = ^{
            JCColumnInstructionsView *view = [JCColumnInstructionsView new];
            view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            view.string = @"<p>分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片片</p>";
            [weakSelf.jcWindow addSubview:view];
            [view show];
        };
        return cell;
    }
    if (indexPath.section==1) {
        JCColumnDetailYushowStatusCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnDetailYushowStatusCell"];
        WeakSelf;
        cell.JCBlock = ^{
            JCColumnInstructionsView *view = [JCColumnInstructionsView new];
            view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [weakSelf.jcWindow addSubview:view];
            [view show];
        };
        return cell;
    }
    if (indexPath.section==2) {
        JCColumnDetailZhanjiChartCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnDetailZhanjiChartCell"];
        return cell;
    }
    
    if (indexPath.section==3) {
        JCColumnRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnRuleCell"];
        cell.string = @"<p>分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片分享到朋友圈的内容，抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示抓取活动规则的前40个字进行展示。<br/>填写活动的规则和内容。不要放图片片</p>";
        WeakSelf;
//        cell.detailModel = self.detailModel;
        cell.JCRefreshBlock = ^(float height) {
            weakSelf.cellHeight = height+20;
            [weakSelf.tableView reloadData];
        };
        return cell;
    }
    

    


    
//    JCWTjInfoBall *model = self.dataArray[indexPath.section];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//    cell.model = model;
    return cell;

    
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section>1&&section<4) {
        JCColumnDetailTitleHeadView *headView = [JCColumnDetailTitleHeadView new];
        if (section==2) {
            headView.titleLab.text = @"往期战绩";
        }
        if (section==3) {
            headView.titleLab.text = @"订购规则";
        }
        return headView;
    }
    
    UIView *view = [UIView new];
    view.backgroundColor = JCWhiteColor;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section>1&&section<4) {
        return AUTO(40);
    }
    return AUTO(8);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section==0) {
        return 0.01f;
    }
    return AUTO(8);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

//    JCMyBuyColumnDetailVC *vc = [JCMyBuyColumnDetailVC new];
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==3) {
        return self.cellHeight;
    }
    return UITableViewAutomaticDimension;
}

- (JCColumnDetailIntroduceHeadView *)headView {
    if (!_headView) {
        _headView = [JCColumnDetailIntroduceHeadView new];
    }
    return _headView;
}


@end
