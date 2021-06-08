//
//  JNMatchZS_BDViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_BDViewController.h"
#import "JCDataBaseTitleHeadView.h"
#import "JNMatchSPFBall.h"
#import "JNMatchBFBall.h"
#import "JNMatchBQCBall.h"
#import "JNMatchJQBall.h"

#import "JNMatchZS_JC_RqSPF_TableViewCell.h"
#import "JNMatchZS_BD_SXPTableViewCell.h"
#import "JNMatchZS_JC_BF_BD_TableViewCell.h"
#import "JNMatchZS_JC_ZJQ_TableViewCell.h"
#import "JNMatchZS_JC_BCSPF_TableViewCell.h"
#import "JNMatchSXPBall.h"
#import "JNMatchZS_BD_SPFFootView.h"
#import "JCDiXianFootView.h"
@interface JNMatchZS_BDViewController ()

@property (assign, nonatomic) CGFloat tableH;

@property (nonatomic, strong) NSArray * spfTotalArr;//完整的胜平负
@property (nonatomic, strong) NSMutableArray * spfArr;//胜平负
@property (nonatomic, strong) NSArray * rqspfArr;//让球胜平负
@property (nonatomic, strong) NSArray * bfArr;//比分
@property (nonatomic, strong) NSArray * bqcArr;////半场胜平负
@property (nonatomic, strong) NSArray * jqArr;//进球
@property (nonatomic, strong) NSArray * sxpArr;//上下盘单双数

@property (nonatomic, assign) BOOL isShowAll;//

@property (nonatomic, strong) JCDiXianFootView *footView;

@property (nonatomic, strong) NSString * matchNum;

@property (nonatomic, assign) NSInteger type;

@end

@implementation JNMatchZS_BDViewController

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
    self.view.backgroundColor= COLOR_F4F6F9;
    [self initViews];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openScoreBallAnimation) name:@"openScoreBallAnimation" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeScoreBallAnimation) name:@"closeScoreBallAnimation" object:nil];
}

- (void)openScoreBallAnimation{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        //        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(AUTO(-120)-34);
        } else {
            make.bottom.equalTo(self.view).offset(AUTO(-120)-34);
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
    [self.tableView registerClass:[JNMatchZS_JC_RqSPF_TableViewCell class] forCellReuseIdentifier:@"JNMatchZS_JC_RqSPF_TableViewCell"];
    [self.tableView registerClass:[JNMatchZS_BD_SXPTableViewCell class] forCellReuseIdentifier:@"JNMatchZS_BD_SXPTableViewCell"];
    [self.tableView registerClass:[JNMatchZS_JC_BF_BD_TableViewCell class] forCellReuseIdentifier:@"JNMatchZS_JC_BF_BD_TableViewCell"];
    [self.tableView registerClass:[JNMatchZS_JC_ZJQ_TableViewCell class] forCellReuseIdentifier:@"JNMatchZS_JC_ZJQ_TableViewCell"];
    [self.tableView registerClass:[JNMatchZS_JC_BCSPF_TableViewCell class] forCellReuseIdentifier:@"JNMatchZS_JC_BCSPF_TableViewCell"];
    self.tableView.mj_header = [JCFootBallHeader headerWithRefreshingBlock:^{
        [self loadDataWithMatchNum:self.matchNum type:self.type];
    }];
    

}

- (void)loadDataWithMatchNum:(NSString *)matchNum type:(NSInteger)type {
    self.matchNum = matchNum;
    self.type = type;
    [self.jcWindow showLoading];
    WeakSelf;
    JCMatchService_New * service = [JCMatchService_New service];
//    matchNum = @"3373011";
    [service getBDZhishuWithMatch_id:matchNum success:^(id  _Nullable object) {
        [self endRefresh];
        
        if ([JCWJsonTool isSuccessResponse:object]) {
            weakSelf.isShowAll = NO;
            weakSelf.spfTotalArr = [JCWJsonTool arrayWithJson:object[@"data"][@"odds_spf"] class:[JNMatchSPFBall class]];
            weakSelf.spfArr = [NSMutableArray array];
            if (weakSelf.spfTotalArr.count>5) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    for (int i=0; i<weakSelf.spfTotalArr.count; i++) {
//                        JNMatchSPFBall *obj = weakSelf.spfTotalArr[i];
//                        [weakSelf.spfArr addObject:obj];
//                        if (i==4) {
//                            break;
//                        }
//                        [self.tableView reloadData];
//                    }
//                });
                for (int i=0; i<weakSelf.spfTotalArr.count; i++) {
                    JNMatchSPFBall *obj = weakSelf.spfTotalArr[i];
                    [weakSelf.spfArr addObject:obj];
                    if (i==4) {
                        break;
                    }
                   
//                    [self.tableView reloadData];
                }
                

            }else{
                weakSelf.spfArr = [NSMutableArray arrayWithArray:weakSelf.spfTotalArr];
            }
            
            weakSelf.bfArr = [JCWJsonTool arrayWithJson:object[@"data"][@"odds_bf"] class:[JNMatchBFBall class]];
            weakSelf.bqcArr = [JCWJsonTool arrayWithJson:object[@"data"][@"odds_bqc"] class:[JNMatchBQCBall class]];
            weakSelf.sxpArr = [JCWJsonTool arrayWithJson:object[@"data"][@"odds_sxp"] class:[JNMatchSXPBall class]];
            weakSelf.jqArr = [JCWJsonTool arrayWithJson:object[@"data"][@"odds_jq"] class:[JNMatchJQBall class]];
            [weakSelf.tableView reloadData];
            
            if (weakSelf.spfArr.count > 0 || weakSelf.sxpArr.count > 0 || weakSelf.bfArr.count > 0 || weakSelf.bqcArr.count > 0 || weakSelf.jqArr.count > 0 ) {
                [weakSelf.tableView hideNoData];
                self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
                self.tableView.tableFooterView = self.footView;
            }else{
                 [self.tableView showTopNoData];
            }
        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&self.spfArr.count>0) {
        JNMatchZS_JC_RqSPF_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_JC_RqSPF_TableViewCell"];
        cell.dataArray = self.spfArr;
        return cell;
    }
    if (indexPath.section==1&&self.bfArr.count>0) {
        JNMatchZS_JC_BF_BD_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_JC_BF_BD_TableViewCell"];
        cell.dataArray = self.bfArr;
        return cell;
    }
    if (indexPath.section==2&&self.sxpArr.count>0) {
        JNMatchZS_BD_SXPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_BD_SXPTableViewCell"];
        cell.dataArray = self.sxpArr;
        return cell;
    }

    
    if (indexPath.section==3&&self.jqArr.count>0) {
        JNMatchZS_JC_ZJQ_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_JC_ZJQ_TableViewCell"];
        cell.dataArray = self.jqArr;
        return cell;
    }
    if (indexPath.section==4&&self.bqcArr.count>0) {
        JNMatchZS_JC_BCSPF_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchZS_JC_BCSPF_TableViewCell"];
        cell.dataArray = self.bqcArr;
        return cell;
    }
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&self.spfArr.count>0) {
        return AUTO(20)+AUTO(20)*self.spfArr.count+AUTO(10);
    }
    if (indexPath.section==1&&self.bfArr.count>0) {
        return AUTO(20)+AUTO(44)*5+10;
    }
    if (indexPath.section==2&&self.sxpArr.count>0) {
        return AUTO(20)+AUTO(32)*self.sxpArr.count+15;
    }

    if (indexPath.section==3&&self.jqArr.count>0) {
        return AUTO(20)+AUTO(25)*2+10;
    }
    if (indexPath.section==4&&self.bqcArr.count>0) {
        return AUTO(20)+AUTO(25)*2+10;
    }
    
    return 0.0001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0&&self.spfArr.count>0) {
        return AUTO(40);
    }
    if (section==1&&self.bfArr.count>0) {
        return AUTO(40);
    }
    if (section==2&&self.sxpArr.count>0) {
        return AUTO(40);
    }
    if (section==3&&self.jqArr.count>0) {
        return AUTO(40);
    }
    if (section==4&&self.bqcArr.count>0) {
        return AUTO(40);
    }
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JCDataBaseTitleHeadView *headView = [JCDataBaseTitleHeadView new];
    headView.lineView.hidden = YES;
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    if (section==0&&self.spfArr.count>0) {
        headView.titleLab.text = @"胜平负";
        return headView;
        
    }
    if (section==1&&self.bfArr.count>0) {
        headView.titleLab.text = @"比分";
        return headView;
    }
    if (section==2&&self.sxpArr.count>0) {
        headView.titleLab.text = @"上下盘单双数";
        return headView;
    }

    if (section==3&&self.jqArr.count>0) {
        headView.titleLab.text = @"总进球";
        return headView;
    }
    if (section==4&&self.bqcArr.count>0) {
        headView.titleLab.text = @"半全场胜平负";
        return headView;
    }

    
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0) {
        if (self.spfTotalArr.count>5) {
            return AUTO(40);
        }else if(self.spfTotalArr.count>0&&self.spfTotalArr.count<=5){
            return AUTO(8);
        }else{
            return 0.001f;
        }
        
     }
    if (section==1&&self.bfArr.count>0) {
        return AUTO(8);
    }
     if (section==2&&self.sxpArr.count>0) {
        return AUTO(8);
     }

     if (section==3&&self.jqArr.count>0) {
         return AUTO(8);
     }
     if (section==4&&self.bqcArr.count>0) {
        return AUTO(8);
     }

    
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section==0&&self.spfTotalArr.count>5) {
        JNMatchZS_BD_SPFFootView *footView = [JNMatchZS_BD_SPFFootView new];
        WeakSelf;
        [footView bk_whenTapped:^{
            weakSelf.isShowAll =!weakSelf.isShowAll;
            if (weakSelf.isShowAll) {
                weakSelf.spfArr = [NSMutableArray arrayWithArray:weakSelf.spfTotalArr];
            }else{
                weakSelf.spfArr = [NSMutableArray array];
                [weakSelf.spfTotalArr enumerateObjectsUsingBlock:^(JNMatchSPFBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [weakSelf.spfArr addObject:obj];
                    if (idx==4) {
                        *stop = YES;
                    }
                }];
            }
            [weakSelf.tableView reloadData];
        }];
        footView.isShowAll = self.isShowAll;
        return footView;
    }
    UIView *backView= [UIView new];
    backView.backgroundColor = COLOR_F4F6F9;
    return backView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
