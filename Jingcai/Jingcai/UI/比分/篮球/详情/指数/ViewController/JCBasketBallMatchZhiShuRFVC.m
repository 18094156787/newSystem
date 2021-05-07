//
//  JCBasketBallMatchZhiShuRFVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchZhiShuRFVC.h"
#import "JNMatchZS_OP_TableViewCell.h"
#import "JNMatchZS_OP_HeadView.h"
#import "JCWMatchPLBall.h"
#import "JNBasketBallMatchZS_DetailVC.h"
#import "JNMatchDetailZSVC.h"
#import "JNMatchZS_PLInfoModel.h"
#import "JCDiXianFootView.h"
@interface JCBasketBallMatchZhiShuRFVC ()

@property (assign, nonatomic) CGFloat tableH;

@property (nonatomic, strong) NSString * matchNum;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) JCDiXianFootView *footView;

@end

@implementation JCBasketBallMatchZhiShuRFVC

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
    [self getDataList];//3574634
}

- (void)initViews {

    self.tableView.estimatedRowHeight = 100;
//    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JNMatchZS_OP_TableViewCell class] forCellReuseIdentifier:@"JNMatchZS_OP_TableViewCell"];
    WeakSelf;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getDataList];
    }];
}

- (void)getDataList {
    [self loadDataWithMatchNum:self.matchBall.id type:@"4"];
}

- (void)loadDataWithMatchNum:(NSString *)matchNum type:(NSString *)type {
    self.matchNum = matchNum;
    WeakSelf;
    [self.jcWindow showLoading];
    JCBasketBallMatchService_New * service = [JCBasketBallMatchService_New service];
    [service getMatchBiFenWithMatchNum:matchNum type:type Page:self.pageNo success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *array = object[@"data"];
            for (NSArray *dataArray in array) {
                NSArray * dataArr = [JCWJsonTool arrayWithJson:dataArray class:[JNMatchZS_PLInfoModel class]];
                [self.dataArray addObject:dataArr];
            }
            
            [weakSelf.tableView reloadData];
            
            self.pageNo++;
            if (array.count < PAGE_LIMIT) {
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
        [self.jcWindow endLoading];
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
    cell.isBasketBall = YES;
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
     headView.windLab.text = @"客胜";
     headView.equalLab.text = @"指数";
     headView.loseLab.text = @"主胜";
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
    UIViewController *vc = [self getViewController];
    NSArray *array = self.dataArray[indexPath.row];
    if (array.count>0) {
        JNMatchZS_PLInfoModel *model = array.firstObject;
        JNBasketBallMatchZS_DetailVC *deailVC = [JNBasketBallMatchZS_DetailVC new];
        deailVC.match_num = self.matchBall.id;
        deailVC.company_id = model.company_id;
        deailVC.type = @"4";
        deailVC.company_name = model.company_name;
        [vc.navigationController pushViewController:deailVC animated:YES];
    }
    
    
//    UIViewController *vc = [self getViewController];
//    JNMatchZS_PLInfoModel *model = self.dataArray[indexPath.row];
//    JNBasketBallMatchZS_DetailVC *deailVC = [JNBasketBallMatchZS_DetailVC new];
//    deailVC.type = 2;
//    deailVC.match_num = self.matchNum;
//    deailVC.company_name = model.company_name;
//    [vc.navigationController pushViewController:deailVC animated:YES];

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
