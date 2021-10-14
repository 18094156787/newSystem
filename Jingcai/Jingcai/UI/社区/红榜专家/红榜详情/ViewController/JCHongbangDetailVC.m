//
//  JCHongbangDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangDetailVC.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCHongbangDetailContentCell.h"
#import "JCHongbangExpertHeadView.h"
#import "JCWTjInfoDetailBall.h"
#import "JCHongbangInfoTopCell.h"
#import "JCHongbangMatchInfoCell.h"
#import "JCHongbangCommomCell.h"
#import "JCHongbangDetailCommentCell.h"
#import "JCHongbangDetailOtherCell.h"
#import "JCHongbangWMstckyVC.h"
#import "JCHongbangDetailCitationCell.h"
#import "JCTuiJianManager.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCHongBangOrderDetailVC.h"
#import "JCHongBangDetail_youkeCell.h"
#import "JCFanganSaleOut_BuyCell.h"
@interface JCHongbangDetailVC ()

@property (nonatomic,strong) JCHongbangExpertHeadView *headView;

@property (nonatomic, strong) UIImageView * resImageView;//开奖结果

@property (nonatomic, strong) JCWExpertBall *expertDetailModel;

@property (nonatomic, strong) JCWTjInfoDetailBall *tjInfoDetailBall;

@property (nonatomic, strong) NSArray *matchDataArray;

@property (nonatomic, strong) NSArray *tuiJianArray;//热门推荐方案列表

@property (nonatomic, assign) BOOL hideMatchRate;

@property (nonatomic, assign) BOOL is_saleOut;

@end

@implementation JCHongbangDetailVC

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];
    self.view.backgroundColor = JCWhiteColor;
    // Do any additional setup after loading the view.
    [self initViews];
//
    if (self.detailModel.talent_plan.status==8) {
        self.is_saleOut = YES;
    }
    [self loadDataInfo];
    [self refreshData];
//    [self dataInfoWithdataDic:self.dataDic];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTableView) name:NotificationUserLogin object:nil];
   
}

- (void)loadDataInfo {
    if (!self.detailModel) {
        return;
    }


    self.matchDataArray = self.detailModel.match_info;
    self.tjInfoDetailBall = self.detailModel.talent_plan;

    [self.tableView reloadData];
     self.tableView.hidden = NO;
}

- (void)refreshData {
    JCHomeService_New *service = [JCHomeService_New service];
    [service getHongbangDetail_Bottom_HotTj_WithTuijian_id:self.detailModel.talent_plan.id Success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {

            self.tuiJianArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCHongBangBall class]];
//            [self.tuiJianArray addObjectsFromArray:array];

            [self.tableView reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];

}

- (void)initViews {
    
    self.tableView.hidden = YES;
    [self.view bringSubviewToFront:self.tableView];
    
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 80;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.backgroundColor = JCClearColor;
    
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
    }];
    
    // 表格注册cell
    [self.tableView registerClass:[JCHongbangDetailCitationCell class] forCellReuseIdentifier:@"JCHongbangDetailCitationCell"];
    [self.tableView registerClass:[JCHongbangDetailContentCell class] forCellReuseIdentifier:@"JCHongbangDetailContentCell"];
        [self.tableView registerClass:[JCHongbangMatchInfoCell class] forCellReuseIdentifier:@"JCHongbangMatchInfoCell"];
    
    [self.tableView registerClass:[JCHongbangInfoTopCell class] forCellReuseIdentifier:@"JCHongbangInfoTopCell"];
    [self.tableView registerClass:[JCHongbangDetailCommentCell class] forCellReuseIdentifier:@"JCHongbangDetailCommentCell"];
        [self.tableView registerClass:[JCHongbangDetailOtherCell class] forCellReuseIdentifier:@"JCHongbangDetailOtherCell"];
    [self.tableView registerClass:[JCHongbangCommomCell class] forCellReuseIdentifier:@"JCHongbangCommomCell"];

    
    
    [self.tableView registerClass:[JCHongBangDetail_youkeCell class] forCellReuseIdentifier:@"JCHongBangDetail_youkeCell"];
    
    [self.tableView registerClass:[JCFanganSaleOut_BuyCell class] forCellReuseIdentifier:@"JCFanganSaleOut_BuyCell"];
    
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.is_saleOut) {
        if (section==0) {
            return 0;
        }
        if (section==1) {
            return 2;
        }
    }
    if (section==0) {
        return self.matchDataArray.count;
    }
    if (section==1&&self.detailModel) {
        return 2;
    }
    if (section==2) {
        return self.tuiJianArray.count;
    }

    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.is_saleOut) {

        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==0) {
        if (self.tjInfoDetailBall.classfly>1) {
//            return AUTO(170);
          return  UITableViewAutomaticDimension;
        }
//        if (self.hideMatchRate) {
//            return AUTO(120);
//        }
//        return AUTO(210);
        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
        if (self.tjInfoDetailBall.citation.length==0) {
                return 0;
            }
        }


    }
    
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    if (self.is_saleOut&&indexPath.section==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        return cell;
    }
 
    if (self.is_saleOut&&indexPath.section==1) {
        if (indexPath.row==0) {
            JCHongbangDetailCitationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangDetailCitationCell"];
            cell.tjInfoDetailBall = self.tjInfoDetailBall;
            return cell;
        }
        JCFanganSaleOut_BuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCFanganSaleOut_BuyCell"];
        return cell;
        
    }


    if (indexPath.section==0) {
        if (self.tjInfoDetailBall.classfly>1) {
            //非竞足
            JCHongbangDetailOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangDetailOtherCell"];
            if (!self.tjInfoDetailBall.is_ai) {
                cell.hideMatchRate = self.hideMatchRate;
            }
            cell.matchModel = self.matchDataArray[indexPath.row];
            cell.tjInfoDetailBall = self.tjInfoDetailBall;
            
            return cell;
        }
        //竞足
        JCHongbangDetailCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangDetailCommentCell"];//JCHongbangMatchInfoCel
        cell.hideMatchRate = self.hideMatchRate;
        cell.matchModel = self.matchDataArray[indexPath.row];//JCHongbangDetailCommentCell
        cell.tjInfoDetailBall = self.tjInfoDetailBall;
        return cell;
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            JCHongbangDetailCitationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangDetailCitationCell"];
            cell.tjInfoDetailBall = self.tjInfoDetailBall;
            return cell;
        }
        
        //未登录的用户,查看付费的已开奖的,需要显示游客模式
//        NSLog(@"token=%ld",[JCWUserBall currentUser].token.length);
        NSLog(@"sf=%@",self.tjInfoDetailBall.sf);
        NSLog(@"all_wl=%@",self.tjInfoDetailBall.sf);
        if ([JCWUserBall currentUser].token.length==0&&[self.tjInfoDetailBall.sf floatValue]>0&&[self.tjInfoDetailBall.all_wl integerValue]>0&&!self.tjInfoDetailBall.is_ai) {
            JCHongBangDetail_youkeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongBangDetail_youkeCell"];
            cell.tjInfoDetailBall = self.tjInfoDetailBall;
            WeakSelf;
            cell.JCLoginBlock = ^{
                [weakSelf presentLogin];
            };
            return cell;
        }

        JCHongbangDetailContentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangDetailContentCell"];
           cell.tjInfoDetailBall = self.tjInfoDetailBall;
           return cell;
    }
    
        JCHongbangCommomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangCommomCell"];
        cell.dianPingBall = self.tuiJianArray[indexPath.row];
        WeakSelf;
        cell.matchClickBlock = ^(NSString *matchNum) {
            JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
            detailVC.matchNum = matchNum;
            [weakSelf.navigationController pushViewController:detailVC animated:YES];
        };
        cell.userClickBlock = ^(NSString * _Nullable tjUserId) {
            JCHongbangWMstckyVC * userVC = [JCHongbangWMstckyVC new];
            userVC.autherID = tjUserId;
            [weakSelf.navigationController pushViewController:userVC animated:YES];
        };
        return cell;
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        UIView *view = [UIView new];
        view.backgroundColor = COLOR_F0F0F0;
        return view;
    }
    if (section==2&&self.tuiJianArray.count>0) {
        UIView *view = [UIView new];
        UILabel *titleLab = [UILabel initWithTitle:@"热门推荐" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        titleLab.frame = CGRectMake(AUTO(15), 10, SCREEN_WIDTH, 30);
        [view addSubview:titleLab];
        return view;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
        return AUTO(4);
    }
    if (section==2&&self.tuiJianArray.count>0) {
        return 50;
    }
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = COLOR_F0F0F0;
   
    if (section==0) {
//        view.backgroundColor = JCBaseColor;
        return view;
    }
//    if (section==0&&self.matchDataArray.count>0) {
//
//        return view;
//    }
    if (section==1&&self.tuiJianArray.count>0) {

        return view;
    }
    
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
//    if (section==0&&self.matchDataArray.count>0) {
//
//        if (self.tjInfoDetailBall.is_ai) {
//            return 0;
//        }
//
//        return AUTO(4);
//    }
    if (section==0) {
        if (self.tjInfoDetailBall.is_ai) {
            return 0.01;
        }

        return 4;
        
//        return 0.01;
    }
    
//    &&(self.tjInfoDetailBall.citation.length>0||self.tjInfoDetailBall.content.length>0)

    if (section==1&&self.tuiJianArray.count>0) {
        return AUTO(4);
    }
    return 0.001f;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
        JCHongbangDetail_MatchModel *model = self.matchDataArray[indexPath.row];
        detailVC.matchNum = model.match_id;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    if (indexPath.section==2) {
            JCHongBangBall * dianPingBall = self.tuiJianArray[indexPath.row];

        // 支付的处理
        [JCTuiJianManager getTuiJianDetailWithTuiJianID:dianPingBall.base_info.tuijian_id orderID:@"" type:@"" WithViewController:self is_push:YES success:^{
            
        }];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
 
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
            
    //        [cell setSeparatorInset:UIEdgeInsetsZero];
            if (indexPath.section==0||indexPath.section==1||indexPath.section==2) {
    //            self.tableView.separatorInset = UIEdgeInsetsZero;
    //             [cell setSeparatorInset:UIEdgeInsetsZero];
                  [cell setSeparatorInset: UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0)];
            }
            else{
    //             [cell setSeparatorInset: UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0)];
                 [cell setSeparatorInset:UIEdgeInsetsZero];
    //            self.tableView.separatorInset = UIEdgeInsetsMake(0, SCREEN_WIDTH, 0, 0);
            }
        }
}

- (void)refreshTableView {
    [self.tableView reloadData];
    if (self.tjInfoDetailBall.wl>0) {
        [self showResult];
    }
    
}

- (void)showResult {
    if (self.matchDataArray.count==0) {
        return;
    }

    

    
//     [self.tableView addSubview:self.resImageView];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    if (self.tjInfoDetailBall.is_ai) {
//        indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    }
//     CGRect rect = [self.tableView rectForRowAtIndexPath:indexPath];//+self.matchDataArray.count*30
//    self.resImageView.frame = CGRectMake(SCREEN_WIDTH-60-AUTO(15), rect.origin.y+50, 60, 60);
//    if (self.tjInfoDetailBall.is_ai) {
//         self.resImageView.frame = CGRectMake(SCREEN_WIDTH-60-AUTO(15), rect.origin.y, 60, 60);
//    }
//    if (self.tjInfoDetailBall.isResultWin) {
//         self.resImageView.hidden = NO;
//         self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hong"];
//         return ;
//     }
//     if (self.tjInfoDetailBall.isResultLose) {
//         self.resImageView.hidden = NO;
//         self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hei"];
//         return ;
//     }
//     if (self.tjInfoDetailBall.isResultWater) {
//         self.resImageView.hidden = NO;
//         self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_zou"];
//         return ;
//     }
//        self.resImageView.frame = CGRectMake(SCREEN_WIDTH-110-AUTO(15), rect.origin.y+ rect.size.height-20, 110, 110);
//
//     self.resImageView.hidden = YES;
//
}


- (JCHongbangExpertHeadView *)headView {
    if (!_headView) {
        _headView = [JCHongbangExpertHeadView new];
    }
    return _headView;
}

- (UIImageView *)resImageView {
    if (!_resImageView) {
        _resImageView = [UIImageView new];
//        _resImageView.contentMode= UIViewContentModeCenter;
    }
    return _resImageView;
}

- (BOOL)hideMatchRate {
//    self.tjInfoDetailBall.sf = @"";
    if (![JCWUserBall currentUser]&&[self.tjInfoDetailBall.sf integerValue]>0) {
        return YES;
    }
    return NO;
}
@end
