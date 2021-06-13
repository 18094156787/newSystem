//
//  JCActivityKindUserVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindUserVC.h"
#import "JCKindCompleteUserCell.h"
#import "JCKindCompleteUserHeadView.h"
#import "JCKindMoreFootView.h"
#import "JCKindUserCompleteModel.h"
#import "JCActivityKindUserShowView.h"
@interface JCActivityKindUserVC ()

@property (nonatomic,strong) JCKindCompleteUserHeadView *headView;

@property (nonatomic,strong) JCKindMoreFootView *footView;

@property (nonatomic,strong) NSMutableArray *showDataArray;

@property (nonatomic,strong) JCActivityKindUserShowView *userShowView;

@property (nonatomic,assign) NSInteger showPage;

@end

@implementation JCActivityKindUserVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentHeight = 440;
    self.showPage = 1;
    [self initViews];
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"refreshKindActivityDetail" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"refreshKindActivityDetail_After" object:nil];
    
//    self.tableView.panGestureRecognizer.delegate = self;

}

- (void)refreshData {
    self.pageNo =1;
    [self getDataList];
}

- (void)getDataList {
    [self.jcWindow showLoading];
    JCActivityService *service = [JCActivityService service];
    [service getKindActivityDetailContentWithActID:NonNil(self.actID) type:@"1" Page:self.pageNo page_size:@"5" success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCKindUserCompleteModel class]];
            [self.dataArray addObjectsFromArray:dataArray];
//            [self.dataArray addObject:dataArray.firstObject];
//            [self.dataArray addObjectsFromArray:dataArray];
//            self.pageNo++;
            [self.tableView reloadData];
            
            
            
            [self chageImageStr:@"ic_empty_user" Title:@"暂无达成目标用户！" BtnTitle:@""];
            self.tableView.ly_emptyView.titleLabTextColor = UIColorFromRGB(0x9DAAB8);

//            if (dataArray.count<5) {
//                [self.footView showNoMore];
//            }else {
//                [self.footView showMore];
//            }
            if (self.dataArray.count>=5) {


                [self.footView showMore];
            }else{
                [self.footView showNoMore];
            }
            if ((self.dataArray.count>0)) {
                self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 48);
                self.tableView.tableFooterView = self.footView;
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
    [service getKindActivityDetailContentWithActID:NonNil(self.actID) type:@"1" Page:self.showPage page_size:@"10" success:^(id  _Nullable object) {
        [self.userShowView.tableView.mj_footer endRefreshing];
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.showPage==1) {
                [self.showDataArray removeAllObjects];
            }
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCKindUserCompleteModel class]];
            if (dataArray.count < 10) {
                [self.userShowView.tableView.mj_footer endRefreshingWithNoMoreData];

            }

            [self.showDataArray addObjectsFromArray:dataArray];
            
            if (self.showPage==1) {
                self.userShowView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                self.userShowView.dataArray = self.showDataArray;
                [self.jcWindow addSubview:self.userShowView];
                [self.userShowView show];
            }else{
                self.userShowView.dataArray = self.showDataArray;
            }
            self.showPage++;



        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.userShowView.tableView.mj_footer endRefreshing];
        [self.jcWindow endLoading];
    }];

}
- (void)initViews {

    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    WeakSelf;
    self.footView.JCBlock = ^{
        if (weakSelf.showDataArray.count==0) {
            [weakSelf getShowViewDataList];
        }else {
            weakSelf.userShowView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            weakSelf.userShowView.dataArray = weakSelf.showDataArray;
            [weakSelf.jcWindow addSubview:weakSelf.userShowView];
            [weakSelf.userShowView show];
        }
        
    };
    
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCKindCompleteUserCell class] forCellReuseIdentifier:@"JCKindCompleteUserCell"];
    
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [self refreshData];
    }];
    emptyView.contentViewOffset = -30;
    self.tableView.ly_emptyView = emptyView;
//    self.tableView.userInteractionEnabled = NO;
//    self.tableView.contentSize = CGSizeMake(SCREEN_WIDTH, 5000);
    self.tableView.bounces = NO;

    self.userShowView.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{

        [self getShowViewDataList];
    }];
   
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCKindCompleteUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCKindCompleteUserCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 56;
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
    self.tableView.scrollEnabled = YES;
}

- (UIView *)listView {
    return self.view;
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
    if ([detailModel.finish_num integerValue]>0) {
        self.headView.content = detailModel.finish_num;
        self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 48);
        self.tableView.tableHeaderView = self.headView;
    }
}

- (JCKindCompleteUserHeadView *)headView {
    if (!_headView) {
        _headView = [JCKindCompleteUserHeadView new];
    }
    return _headView;
}

- (JCKindMoreFootView *)footView {
    if (!_footView) {
        _footView = [JCKindMoreFootView new];
    }
    return _footView;
}
- (NSMutableArray *)showDataArray {
    if (!_showDataArray) {
        _showDataArray = [NSMutableArray array];
    }
    return _showDataArray;
}

- (JCActivityKindUserShowView *)userShowView {
    if (!_userShowView) {
        _userShowView = [JCActivityKindUserShowView new];
    }
    return _userShowView;
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
