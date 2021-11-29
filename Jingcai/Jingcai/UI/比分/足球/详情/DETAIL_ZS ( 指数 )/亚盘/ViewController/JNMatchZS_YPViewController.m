//
//  JNMatchZS_YPViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_YPViewController.h"
#import "JNMatchZS_OP_TableViewCell.h"
#import "JNMatchZS_OP_HeadView.h"
#import "JNMatchZS_ZSDetailViewController.h"
#import "JNMatchDetailZSVC.h"
#import "JNMatchZS_PLInfoModel.h"
#import "JCDiXianFootView.h"
@interface JNMatchZS_YPViewController ()

@property (nonatomic, strong) JCDiXianFootView *footView;

@property (assign, nonatomic) CGFloat tableH;

@property (nonatomic, strong) NSArray * originDataArr;
@property (nonatomic, strong) NSArray * moreDataArr;
@property (nonatomic, strong) NSMutableArray * showDataArr;
@property (nonatomic, assign) NSInteger type;

@end

@implementation JNMatchZS_YPViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGFloat tableH = self.tableView.contentSize.height;
    if (self.needReturnHeightBlock) {
        self.needReturnHeightBlock(tableH);
    }
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [self getDataList];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openScoreBallAnimation) name:@"openScoreBallAnimation" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeScoreBallAnimation) name:@"closeScoreBallAnimation" object:nil];
}
- (void)openScoreBallAnimation{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        //        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(AUTO(-120));
        } else {
            make.bottom.equalTo(self.view).offset(AUTO(-120));
            // Fallback on earlier versions
        }
    }];
}
- (void)closeScoreBallAnimation{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        //        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
            // Fallback on earlier versions
        }
    }];
}
- (void)initViews {

    self.tableView.estimatedRowHeight = 100;
//    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JNMatchZS_OP_TableViewCell class] forCellReuseIdentifier:@"JNMatchZS_OP_TableViewCell"];
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        self.pageNo = 1;
        [self getDataList];
    }];
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [self getDataList];
//    }];
    
}
- (void)getDataList {
    [self loadDataWithMatchNum:self.matchNum type:@"4"];
}


- (void)loadDataWithMatchNum:(NSString *)matchNum type:(NSString *)type {
    self.matchNum = matchNum;
//    self.type = type;
    WeakSelf;
    [self.jcWindow showLoading];
    
    JCMatchService_New * service = [JCMatchService_New service];//matchNum
    [service getOPZhishuWithMatch_id:matchNum type:type Page:self.pageNo Success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                self.tableView.tableFooterView = [UIView new];
                [self.dataArray removeAllObjects];
            }
            NSArray *array = object[@"data"];
            for (NSArray *dataArray in array) {
                NSArray * dataArr = [JCWJsonTool arrayWithJson:dataArray class:[JNMatchZS_PLInfoModel class]];
                [self.dataArray addObject:dataArr];
            }
            
            [weakSelf.tableView reloadData];
            
            self.pageNo++;
            if (array.count < 100) {
                [weakSelf.tableView.mj_footer endRefreshingWithNoMoreData];
                self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(50));
                self.tableView.tableFooterView = self.footView;
            }
            
            if (weakSelf.dataArray.count==0) {
                weakSelf.tableView.mj_footer.hidden = YES;
                 [weakSelf.view showTopNoData];
            }else{
                weakSelf.tableView.mj_footer.hidden = NO;
                [weakSelf.view hideNoData];
            }

        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [weakSelf.view showTopNoData];
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
    JNMatchZS_OP_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_OP_TableViewCell"];
    cell.dataArray = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return AUTO(49);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return AUTO(35);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   JNMatchZS_OP_HeadView *headView =  [JNMatchZS_OP_HeadView new];
    headView.windLab.text = @"主队";
    headView.equalLab.text = @"指数";
    headView.loseLab.text = @"客队";
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JNMatchDetailZSVC *vc = (JNMatchDetailZSVC *)[self getViewController];
//    JNMatchZS_PLInfoModel *model = self.dataArray[indexPath.row];
    NSArray *array = self.dataArray[indexPath.row];
    if (array.count>0) {
        JNMatchZS_PLInfoModel *model = array.firstObject;
        JNMatchZS_ZSDetailViewController *deailVC = [JNMatchZS_ZSDetailViewController new];
        deailVC.match_num = self.matchNum;
        deailVC.company_id = model.company_id;
        deailVC.type = @"4";
        deailVC.company_name = model.company_name;
        [[vc getViewController].navigationController pushViewController:deailVC animated:YES];
    }
//    JNMatchZS_ZSDetailViewController *deailVC = [JNMatchZS_ZSDetailViewController new];
//    deailVC.match_num = self.matchNum;
//    deailVC.classStr = 4;
//    deailVC.company_name = model.company_name;
//    [[vc getViewController].navigationController pushViewController:deailVC animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row) {
        WeakSelf;
        dispatch_async(dispatch_get_main_queue(), ^{
            CGFloat tableH = tableView.contentSize.height;
            weakSelf.tableH = tableH;
            if (weakSelf.needReturnHeightBlock) {
                weakSelf.needReturnHeightBlock(tableH);
            }
        });
    }
}
#pragma mark - OVERRIDE
- (CGFloat)contentH {
    return self.tableView.contentSize.height;
}
- (JCDiXianFootView *)footView {
    if (!_footView) {
        _footView = [JCDiXianFootView new];
    }
    return _footView;
}
@end
