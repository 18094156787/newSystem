//
//  JCTransactionDataModelVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelVC.h"
#import "JCTransactionDataModelTitleView.h"
#import "JCTransactionDataModelLockedCell.h"
#import "JCTransactionDataModelCell.h"
#import "JCTransactionDataModelDetailVC.h"
#import "JCTransactionDataModelLockedView.h"
#import "JCKellyDataModelModel.h"
#import "JCTransactionDataModel.h"
@interface JCTransactionDataModelVC ()

@property (nonatomic,strong) NSArray *newstArray;

@property (nonatomic,strong) NSMutableArray *historyArray;

@end

@implementation JCTransactionDataModelVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
}


- (void)refreshData {
    self.pageNo = 1;
    [self getNewsDataList];
    [self getHistoryDataList];
}

- (void)getNewsDataList {

//    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getTransactionDataModeListWithType:self.type order_by:@"2" Page:1 PageSize:@"200" success:^(id  _Nullable object) {
        [self endRefresh];

        if ([JCWJsonTool isSuccessResponse:object]) {

            self.newstArray = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCTransactionDataModel class]];
//             [self.newstArray addObjectsFromArray:array];
//            if (array.count <PAGE_LIMIT) {
//                [self.tableView.mj_footer endRefreshingWithNoMoreData];
//            }
            [self.tableView reloadData];

//            [self chageImageStr:@"jc_dataModel_empty" Title:@"" BtnTitle:@""];
//
//            if (array.count <PAGE_LIMIT&&self.dataArray.count>0) {
//                  self.tableView.tableFooterView = self.noMore_footView;
//                  self.tableView.mj_footer.hidden = YES;
//              }else{
//                  self.tableView.tableFooterView = [UIView new];
//                  self.tableView.mj_footer.hidden = NO;
//              }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"jc_dataModel_empty" Title:@"" BtnTitle:@""];
    }];


}

- (void)getHistoryDataList {

    [self.jcWindow showLoading];
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getTransactionDataModeListWithType:self.type order_by:@"1" Page:self.pageNo PageSize:@"10" success:^(id  _Nullable object) {
        [self endRefresh];

        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.historyArray removeAllObjects];
            }
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCTransactionDataModel class]];
             [self.historyArray addObjectsFromArray:array];
            if (array.count <PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            self.pageNo++;
            [self.tableView reloadData];

//            [self chageImageStr:@"jc_dataModel_empty" Title:@"" BtnTitle:@""];
//
//            if (array.count <PAGE_LIMIT&&self.dataArray.count>0) {
//                  self.tableView.tableFooterView = self.noMore_footView;
//                  self.tableView.mj_footer.hidden = YES;
//              }else{
//                  self.tableView.tableFooterView = [UIView new];
//                  self.tableView.mj_footer.hidden = NO;
//              }

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"jc_dataModel_empty" Title:@"当前暂无比赛数据~" BtnTitle:@""];
    }];



}

- (void)initViews {
//    JCJingCaiAIBigDataMatchTitleView *titleView = [[JCJingCaiAIBigDataMatchTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AUTO(45))];
//    titleView.backgroundColor = JCWhiteColor;
//    titleView.titleLab.text = @"比赛列表";
//    titleView.iconView.hidden = NO;
//    self.tableView.tableHeaderView = titleView;
//
//    titleView.JCBlcok = ^{
//        [weakSelf.navigationController pushViewController:[JCJingCaiAIBigDataHomeVC new] animated:YES];
//    };
    
    
    WeakSelf;
    self.tableView.estimatedRowHeight = 300;
    self.tableView.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    // 表格注册cell
    [self.tableView registerClass:[JCTransactionDataModelLockedCell class] forCellReuseIdentifier:@"JCTransactionDataModelLockedCell"];
    [self.tableView registerClass:[JCTransactionDataModelCell class] forCellReuseIdentifier:@"JCTransactionDataModelCell"];
    
//    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(48));
//    self.tableView.tableHeaderView = self.headView;
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];

    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    emptyView.contentViewOffset = 0;
    self.tableView.ly_emptyView = emptyView;
//    [self showNoDataViewImageStr:@"empty_img_follow_expert" Title:@"暂时没有比赛" BtnTitle:@"" Btnwidth:0 HiddenBtn:YES];
    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        if (weakSelf.JCRefreshBlock) {
            weakSelf.JCRefreshBlock();
        }
        [weakSelf refreshData];
    }];

    
    MJRefreshBackNormalFooter *mj_foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf getHistoryDataList];
    }];
    self.tableView.mj_footer = mj_foot;
    [mj_foot setTitle:@"" forState:MJRefreshStateNoMoreData];

 

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        if (self.buyInfoModel.show_status==2) {
            return self.newstArray.count;
        }
        return 0;
        
    }
    return self.historyArray.count;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return UITableViewAutomaticDimension;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    JCTransactionDataModelTitleView *headView = [JCTransactionDataModelTitleView new];
    headView.detailView.hidden = YES;
    if (section==0) {
        if (self.newstArray.count==0) {
            return [UIView new];
        }
        NSString *string = [NSString stringWithFormat:@"最新推荐（%ld场)",self.newstArray.count];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:string];
        NSRange range = [string rangeOfString:[NSString stringWithFormat:@"%ld",self.newstArray.count]];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
            headView.titleLab.attributedText = attr;
        }
        
    }else{
        headView.titleLab.text = @"历史异动赛事";
    }
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        if (self.newstArray.count==0) {
            return 0.01f;
        }
    }
    return AUTO(40);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    JCTransactionDataModelCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCTransactionDataModelCell"];
    if (indexPath.section==0) {
        cell.model = self.newstArray[indexPath.row];
    }
    if (indexPath.section==1) {
        cell.model = self.historyArray[indexPath.row];
    }
//    JCMatchInfoModel *model = self.dataArray[indexPath.section];
//    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0) {
        if (self.newstArray.count>0&&self.buyInfoModel.show_status!=2&&self.buyInfoModel.show_status!=4) {
            return AUTO(55);
        }

    }
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section==0) {
        if (self.buyInfoModel&&self.newstArray.count>0&&self.buyInfoModel.show_status!=2&&self.buyInfoModel.show_status!=4) {
            JCTransactionDataModelLockedView *lockView = [JCTransactionDataModelLockedView new];
            WeakSelf;
            lockView.JCOpenBlock = ^{
                //未开通,前往开通
                if (weakSelf.JCOpenBlock) {
                    weakSelf.JCOpenBlock();
                }
            };

            return lockView;
        }

    }
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    JCTransactionDataModelDetailVC *vc = [JCTransactionDataModelDetailVC new];
    vc.model_id = self.model_id;
    if (indexPath.section==0) {
        JCTransactionDataModel *model = self.newstArray[indexPath.row];
        vc.match_id = [NSString stringWithFormat:@"%ld",model.match_id];
        vc.type = [NSString stringWithFormat:@"%ld",model.type];
    }
    if (indexPath.section==1) {
        JCTransactionDataModel *model = self.historyArray[indexPath.row];
        vc.match_id = [NSString stringWithFormat:@"%ld",model.match_id];
        vc.type = [NSString stringWithFormat:@"%ld",model.type];
    }
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)setBuyInfoModel:(JCKellyDataModelPayInfoModel *)buyInfoModel {
    _buyInfoModel = buyInfoModel;
    if (buyInfoModel) {
        [self.tableView reloadData];
    }
    
}

- (NSMutableArray *)historyArray {
    if (!_historyArray) {
        _historyArray = [NSMutableArray new];
    }
    return _historyArray;
}

@end
