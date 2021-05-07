//
//  JCYuCeHongBaoViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYuCeHongBaoViewController.h"
#import "JCYuCeCashHongBaoViewCell.h"
#import "JCJingCaiHongbaoModel.h"
#import "JCYuCeHongBaoViewCell.h"
#import "JCJingCaiHongbaoModel.h"
#import "JCMainTabBarController.h"
#import "JCYuCeHongBaoWithDrawVC.h"
#import "JCYuCeHongBaoSmallPriceWithDrawVC.h"
#import "JCYuCeHongBaoCrashHeadView.h"
#import "JCYuCeHongBaoHeadView.h"
#import "JCYHQHongBaoViewCell.h"
@interface JCYuCeHongBaoViewController ()

@property (nonatomic,strong) JCYuCeHongBaoCrashHeadView *crashHeadView;

@property (nonatomic,strong) JCYuCeHongBaoHeadView *headView;

@end

@implementation JCYuCeHongBaoViewController



- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = JCWhiteColor;
    [self initViews];
    [self refreshData];
}


- (void)refreshData {

    if (self.dataArray.count==0) {
        [self.view showLoading];
    }
    JCUserService_New *service = [JCUserService_New service];
    [service getUserHongbaoLsitWithType:self.type Page:self.pageNo success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if (self.pageNo==1) {
                [self.dataArray removeAllObjects];
                if ([self.type intValue]==2||[self.type intValue]==3) {
                    NSString *money = object[@"data"][@"totalCount"];
                    NSNumber *number = @([money floatValue]);
                    self.headView.moneyLab.text = [NSString stringWithFormat:@"%@",number];
                    self.headView.countLab.text = [NSString stringWithFormat:@"%@次",object[@"data"][@"numCount"]];
                }
                if ([self.type intValue]==1) {
                    NSString *money = object[@"data"][@"notWithdraw"];
                    NSNumber *money_number = @([money floatValue]);
                    self.crashHeadView.moneyLab.text = [NSString stringWithFormat:@"%@",money_number];
                    NSString *total = object[@"data"][@"withdraw"];
                    NSNumber *total_number = @([total floatValue]);
                    self.crashHeadView.totalyLab.text = [NSString stringWithFormat:@"%@",total_number];
                    self.crashHeadView.submitBtn.hidden = [money floatValue]==0?YES:NO;
                }
            }
            
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCJingCaiHongbaoInfoModel class] json:object[@"data"][@"list"]];

            [self.dataArray addObjectsFromArray:array];
            if (array.count < PAGE_LIMIT) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
            }
            
            [self.tableView reloadData];
            self.pageNo++;
            [self chageImageStr:@"nodata_hongbao" Title:@"您还没有获得任何红包优惠券哦~" BtnTitle:@""];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
        [self chageImageStr:@"nodata_hongbao" Title:@"您还没有获得任何红包优惠券哦~" BtnTitle:@""];
    }];

}

- (void)initViews {
    
    self.tableView.backgroundColor = JCWhiteColor;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCYuCeCashHongBaoViewCell class] forCellReuseIdentifier:@"JCYuCeCashHongBaoViewCell"];
    [self.tableView registerClass:[JCYuCeHongBaoViewCell class] forCellReuseIdentifier:@"JCYuCeHongBaoViewCell"];
    [self.tableView registerClass:[JCYHQHongBaoViewCell class] forCellReuseIdentifier:@"JCYHQHongBaoViewCell"];
    
    
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
    WeakSelf;
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.ly_emptyView = emptyView;

    
    self.tableView.ly_emptyView.contentViewOffset = -50;


    
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        weakSelf.pageNo = 1;
        
        [weakSelf refreshData];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    
}

#pragma mark <UITableViewDelegate>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    if ([self.type integerValue]==1) {
        JCYuCeCashHongBaoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYuCeCashHongBaoViewCell"];
        JCJingCaiHongbaoInfoModel *model = self.dataArray[indexPath.row];
        cell.model = model;
        WeakSelf;
        cell.JCWithDrawBlock = ^{
            if (model.type==1) {
                //大额
                JCYuCeHongBaoWithDrawVC *vc = [JCYuCeHongBaoWithDrawVC new];
                vc.model = model;
                [weakSelf.navigationController pushViewController:vc animated:YES];
                
            }
            if (model.type==2) {
                //小额
                JCYuCeHongBaoSmallPriceWithDrawVC *vc = [JCYuCeHongBaoSmallPriceWithDrawVC new];
                vc.model =  weakSelf.dataArray[indexPath.row];
                WeakSelf;
                vc.JCBlock = ^{
                    weakSelf.pageNo = 1;
                    [weakSelf refreshData];
                };
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }

        };
        return cell;
    }
    

    
    
    if ([self.type intValue]==2) {
        JCYuCeHongBaoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYuCeHongBaoViewCell"];
        JCJingCaiHongbaoInfoModel *aModel = self.dataArray[indexPath.row];
        cell.model = aModel;
        WeakSelf;
        cell.JCYCBlock = ^{
            JCMainTabBarController *tabVC = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
            if ([aModel.goto_type integerValue]==1) {
                [tabVC showGZHVC];
            }
            if ([aModel.goto_type integerValue]==2) {
                
                [tabVC showHBVC];
            }
            
            [weakSelf.navigationController popViewControllerAnimated:YES];

        };
        return cell;
    }
    JCYHQHongBaoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYHQHongBaoViewCell"];
    if ([self.type intValue]==3) {
        JCJingCaiHongbaoInfoModel *aModel = self.dataArray[indexPath.row];
        cell.yhqModel = aModel;
        WeakSelf;
        cell.JCYCBlock = ^{
            
            JCMainTabBarController *tabVC = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
            if ([aModel.goto_type integerValue]==1) {
                [tabVC showGZHVC];
            }
            if ([aModel.goto_type integerValue]==2) {
                
                [tabVC showHBVC];
            }
            
            [weakSelf.navigationController popViewControllerAnimated:YES];

        };

    }


    return cell;

}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *backView= [UIView new];
    return backView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.dataArray.count==0) {
        return 0.001f;
    }
    if ([self.type intValue]==1) {
        return AUTO(72);
    }
    return AUTO(52);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.dataArray.count==0) {
        return [UIView new];
    }
    
    if ([self.type intValue]==1) {
        WeakSelf;
        self.crashHeadView.JCRefresh = ^{
            [weakSelf refreshData];
        };
        return self.crashHeadView;
    }
    self.headView.type = [self.type integerValue];
    return self.headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


}
- (JCYuCeHongBaoCrashHeadView *)crashHeadView {
    if (!_crashHeadView) {
        _crashHeadView = [JCYuCeHongBaoCrashHeadView new];
    }
    return _crashHeadView;
}

- (JCYuCeHongBaoHeadView *)headView {
    if(!_headView){
        _headView = [JCYuCeHongBaoHeadView new];
    }
    return _headView;
}

@end
