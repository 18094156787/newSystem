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
#import "JCKindMoreFootView.h"
#import "JCActivityKindMyPrizeShowView.h"
@interface JCActivityKindMyPrizeVC ()

@property (nonatomic,strong) JCKindMoreFootView *footView;

@property (nonatomic,strong) NSMutableArray *showDataArray;

@property (nonatomic,strong) JCActivityKindMyPrizeShowView *prizeShowView;

@property (nonatomic,assign) NSInteger showPage;


@end

@implementation JCActivityKindMyPrizeVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentHeight = 440;
    self.showPage = 1;
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
    [service getKindActivityDetailContentWithActID:NonNil(self.actID) type:@"3" Page:self.pageNo page_size:@"3" success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCActivityGoodsModel class]];
            [self.dataArray addObjectsFromArray:dataArray];
            self.pageNo++;
            [self.tableView reloadData];
            
            
            
            [self chageImageStr:@"ic_empty_gift" Title:@"您还未获得任何奖励！\n快去参与活动领取奖励吧！" BtnTitle:@""];
            self.tableView.ly_emptyView.titleLabTextColor = UIColorFromRGB(0x9DAAB8);
            
            if (self.dataArray.count>=3) {
                self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 48);
                self.tableView.tableFooterView = self.footView;
                [self.footView showMore];
            }else{
                [self.footView showNoMore];
            }
            


            
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];


}

- (void)getShowViewDataList {
    [self.jcWindow showLoading];
    JCActivityService *service = [JCActivityService service];
    [service getKindActivityDetailContentWithActID:NonNil(self.actID) type:@"3" Page:self.showPage page_size:@"10" success:^(id  _Nullable object) {
        [self.prizeShowView.tableView.mj_footer endRefreshing];
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            
                if (self.pageNo==1) {
                    [self.showDataArray removeAllObjects];
                }
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCActivityGoodsModel class]];
            if (dataArray.count < 10) {
                [self.prizeShowView.tableView.mj_footer endRefreshingWithNoMoreData];

            }

            [self.showDataArray addObjectsFromArray:dataArray];
            
            if (self.showPage==1) {
                self.prizeShowView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                self.prizeShowView.dataArray = self.showDataArray;
                [self.jcWindow addSubview:self.prizeShowView];
                [self.prizeShowView show];
            }else{
                self.prizeShowView.dataArray = self.showDataArray;
            }
            self.showPage++;



        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.prizeShowView.tableView.mj_footer endRefreshing];
        [self.jcWindow endLoading];
    }];

}

- (void)initViews {
    self.tableView.bounces = NO;
    self.tableView.separatorStyle = 0;
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCActivityPrizeTableViewCell class] forCellReuseIdentifier:@"JCActivityPrizeTableViewCell"];
    


    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = -30;
    self.tableView.ly_emptyView = emptyView;

    self.footView.JCBlock = ^{
        if (weakSelf.showDataArray.count==0) {
            [weakSelf getShowViewDataList];
        }else {
            weakSelf.prizeShowView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            weakSelf.prizeShowView.dataArray = weakSelf.showDataArray;
            [weakSelf.jcWindow addSubview:weakSelf.prizeShowView];
            [weakSelf.prizeShowView show];
        }
        
    };
    
    self.prizeShowView.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{

        [self getShowViewDataList];
    }];
                                            
    
//    emptyView.titleLabTextColor = UIColorFromRGB(0x9DAAB8);
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArray.count;
    
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
    return 20;
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

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//    CGFloat height = scrollView.frame.size.height;
//        CGFloat contentOffsetY = scrollView.contentOffset.y;
//        CGFloat bottomOffset = scrollView.contentSize.height - contentOffsetY;
//
//    
//        NSLog(@"整体高度%.5f--偏移量%.5f",bottomOffset,height);
//        if (bottomOffset-1 <= height)
//        {
//            //在最底部
////            self.currentIsInBottom = YES;
//            scrollView.scrollEnabled = NO;
//        }
//        else
//        {
//            if (scrollView.contentOffset.y==0) {
//                scrollView.scrollEnabled = NO;
//            }else {
//                scrollView.scrollEnabled = YES;
//            }
//            
////            self.currentIsInBottom = NO;
//        }
//
//
//}

- (JCKindMoreFootView *)footView {
    if (!_footView) {
        _footView = [JCKindMoreFootView new];
    }
    return _footView;
}

- (JCActivityKindMyPrizeShowView *)prizeShowView {
    if (!_prizeShowView) {
        _prizeShowView = [JCActivityKindMyPrizeShowView new];
    }
    return _prizeShowView;
}
- (NSMutableArray *)showDataArray {
    if (!_showDataArray) {
        _showDataArray = [NSMutableArray array];
    }
    return _showDataArray;
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
