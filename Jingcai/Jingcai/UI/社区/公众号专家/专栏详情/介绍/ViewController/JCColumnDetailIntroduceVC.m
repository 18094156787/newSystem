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
#import "JCColunmHorseModel.h"
#import "JCPresellColumnModel.h"
#import "JCNewestColumnModel.h"
@interface JCColumnDetailIntroduceVC ()

@property (nonatomic,strong) JCColumnDetailIntroduceHeadView *headView;

@property (nonatomic,strong) JCColumnDetailModel *detailModel;

@property (nonatomic,strong) NSArray *hourseArray;//走马灯

@property (nonatomic,assign) float cellHeight;

@end

@implementation JCColumnDetailIntroduceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_F0F0F0;
    // Do any additional setup after loading the view.
    [self initViews];
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:JCRefreshBuyColumn object:nil];
}

- (void)refreshData {
    [self.jcWindow showLoading];
    JCColumnService *service = [JCColumnService new];
    [service getColumnInfoWithID:NonNil(self.column_id) success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.detailModel = (JCColumnDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCColumnDetailModel class]];
            self.hourseArray = [JCWJsonTool arrayWithJson:object[@"data"][@"customers"] class:[JCColunmHorseModel class]];
            if (self.hourseArray.count>0) {
                self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
                self.headView.titleArray = self.hourseArray;
                self.tableView.tableHeaderView = self.headView;
            }
            [self.tableView reloadData];
            if (self.JCBlock) {
                self.JCBlock(self.detailModel);
            }
            if ([self.detailModel.newest_period.type integerValue]==4) {
                [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.top.offset(0);
                    make.left.right.equalTo(self.view);
                    make.bottom.offset(-kBottomTabSafeAreaHeight);
                }];
            }

        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];
}

- (void)initViews {
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
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
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
    if (section==0) {
        if (!self.detailModel.presell_period) {
            return 0;
        }
    }
    if (section==2) {
        if (self.detailModel.last_hit_rate.count==0) {
            return 0;
        }
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCColumnDetailYushowHotCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnDetailYushowHotCell"];
        WeakSelf;
        cell.JCBlock = ^{
            JCColumnInstructionsView *view = [JCColumnInstructionsView new];
            view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            view.period_foreshow =  weakSelf.detailModel.presell_period.period_foreshow;
            [weakSelf.jcWindow addSubview:view];
            [view show];
        };
        cell.presellColumnModel = self.detailModel.presell_period;
        return cell;
    }
    if (indexPath.section==1) {
        if ([self.detailModel.last_period.type integerValue]==3&&self.detailModel.last_period.combat.wl_list.count==0) {
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
            return cell;
        }
        JCColumnDetailYushowStatusCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnDetailYushowStatusCell"];
        WeakSelf;
        cell.JCBlock = ^{
            JCColumnInstructionsView *view = [JCColumnInstructionsView new];
            view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            view.period_foreshow =  weakSelf.detailModel.last_period.period_foreshow;
            [weakSelf.jcWindow addSubview:view];
            [view show];
        };
        cell.model = self.detailModel.last_period;
        return cell;
    }
    if (indexPath.section==2) {
        JCColumnDetailZhanjiChartCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnDetailZhanjiChartCell"];
        cell.dataSource = self.detailModel.last_hit_rate;
        return cell;
    }
    
    if (indexPath.section==3) {
        JCColumnRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCColumnRuleCell"];
        cell.string = self.detailModel.ordering_information;
        WeakSelf;
//        cell.detailModel = self.detailModel;
        cell.JCRefreshBlock = ^(float height) {
            weakSelf.cellHeight = height+40;
            [weakSelf.tableView reloadData];
        };
        return cell;
    }
    

    

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;

    
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section>1&&section<4) {
        JCColumnDetailTitleHeadView *headView = [JCColumnDetailTitleHeadView new];
        if (section==2) {
            if(self.detailModel.last_hit_rate.count>0){
                headView.titleLab.text = @"往期战绩";
                return headView;
            }
        }
        if (section==3) {
            headView.titleLab.text = @"订购规则";
            return headView;
        }
       
    }
    
    UIView *view = [UIView new];
    view.backgroundColor = JCWhiteColor;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (!self.detailModel.presell_period&&!self.detailModel.last_period&&self.detailModel.last_hit_rate.count==0) {
        if (section!=3) {
            return 0.01f;
        }
        
    }
    if (section>1&&section<4) {
        if (section==2) {
            if(self.detailModel.last_hit_rate.count==0){
                return 0.01f;
            }
        }
        
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
    if (!self.detailModel.presell_period&&!self.detailModel.last_period&&self.detailModel.last_hit_rate.count==0) {
        return 0.01f;
    }
    if (section==0) {
        return 0.01f;
    }
    if (section==2) {
        if(self.detailModel.last_hit_rate.count==0){
            return 0.01f;
        }
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
    if (indexPath.section==1) {
        
            if ([self.detailModel.last_period.type integerValue]==3&&self.detailModel.last_period.combat.wl_list.count==0) {
                return 0.01f;
            }
    }
    if (indexPath.section==3) {
        return self.cellHeight;
    }
    return UITableViewAutomaticDimension;
}


- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}


- (JCColumnDetailIntroduceHeadView *)headView {
    if (!_headView) {
        _headView = [JCColumnDetailIntroduceHeadView new];
    }
    return _headView;
}


@end
