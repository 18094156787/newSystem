//
//  JCHongbangBuyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangBuyVC.h"
#import "JCHongbangInfoTopCell.h"
#import "JCBuyPlanLock_HB_Cell.h"
#import "JCBuyPlanPayWayCell.h"
#import "JCPayMethodManager.h"
#import "JCWMyHongbaoBall.h"
#import "CountDown.h"
#import "JCWVerTjInfoMatchBall.h"
#import "JCHongbangMatchInfoCell.h"
#import "JCCommentCell.h"
#import "JCHongbangWMstckyVC.h"
#import "JCHHongbaoModel.h"

#import "JCHongbaoShowView.h"
#import "RBApplePayManager.h"
#import "WXPaymentBall.h"
#import "WXApiManager.h"
#import "JCHongbangDetailWMstckyVC.h"
#import "JCPayFreeView.h"
#import "JCChargeVC.h"
#import "JCHongbangDetailCommentCell.h"
#import "JCHongbangDetailOtherCell.h"
#import "JCHongbangCommomCell.h"
#import "JCFootBallBuyPlanEndBuyCell.h"
#import "JCHongbangOrderVC.h"
#import "JCTuiJianManager.h"
#import "JCMatchDetailWMStickVC.h"
#import "JCHongbangOrderWMstckyVC.h"
#import "JCFanganSaleOut_BuyCell.h"

@interface JCHongbangBuyVC ()

@property (nonatomic,strong) UIView *buyUserView;

@property (nonatomic,strong) UILabel *buyCountLab;

@property (nonatomic,strong) NSMutableArray *payWayArray;

@property (strong, nonatomic)  CountDown *countDown;

@property (nonatomic, strong) JCWTjInfoDetailBall *tjInfoDetailBall;//方案详情

@property (nonatomic, strong) JCWExpertBall * tjUserBall;//专家详情

@property (nonatomic, strong) NSArray *matchDataArray;

@property (nonatomic, strong) NSArray *tuiJianArray;

@property (nonatomic,strong) JCWMyHongbaoBall *useHbModel;//当前选中的红包

@property (nonatomic, strong) JCHHongbaoModel *hongbaoModel;

@property (nonatomic, strong) NSArray *hongbaoArray;

@property (nonatomic,strong) JCHongbaoShowView *hbPickerView;

@property (nonatomic,strong) JCPayWayBall *selPayWay;

@property (nonatomic,strong) JCWMyHongbaoBall *mdModel;//免单券

@property (nonatomic,assign) BOOL match_end;//比较已结束,不可购买

@property (nonatomic,strong) NSDictionary *object;

@property (nonatomic,assign) double time_distance;

@property (nonatomic,assign) BOOL is_saleOut;//已下架

@end

@implementation JCHongbangBuyVC

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.countDown destoryTimer];
}

- (void)viewDidLoad {
    self.style = 1;
    [super viewDidLoad];

    if (self.detailModel.talent_plan.status==8) {
        //
        self.is_saleOut = YES;
    }
    [self initViews];
    [self loadDataInfo];
//    [self refreshData];
}

- (void)loadDataInfo {
    if (!self.detailModel) {
        return;
    }

    self.tjInfoDetailBall = self.detailModel.talent_plan;
    self.matchDataArray = self.detailModel.match_info;
    self.time_distance = self.tjInfoDetailBall.end_time-self.tjInfoDetailBall.now_time;
   [self getNowTimeWithString:self.time_distance];//截止时间
   [self showBuyUserView];
    [self.tableView reloadData];
     self.tableView.hidden = NO;
   
   WeakSelf;
   self.countDown = [[CountDown alloc] init];
   ///每秒回调一次
   [self.countDown countDownWithPER_SECBlock:^{
       NSLog(@"6");
       [weakSelf updateTimeInVisibleCells];
   }];
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
    self.view.backgroundColor = COLOR_F4F6F9;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.separatorStyle = 0;
    self.tableView.separatorColor = COLOR_DDDDDD;
    self.tableView.backgroundColor = COLOR_F4F6F9;
    [self.tableView registerClass:[JCBuyPlanLock_HB_Cell class] forCellReuseIdentifier:@"JCBuyPlanLock_HB_Cell"];
    [self.tableView registerClass:[JCFootBallBuyPlanEndBuyCell class] forCellReuseIdentifier:@"JCFootBallBuyPlanEndBuyCell"];
    [self.tableView registerClass:[JCBuyPlanPayWayCell class] forCellReuseIdentifier:@"JCBuyPlanPayWayCell"];
    [self.tableView registerClass:[JCHongbangInfoTopCell class] forCellReuseIdentifier:@"JCHongbangInfoTopCell"];
    [self.tableView registerClass:[JCHongbangMatchInfoCell class] forCellReuseIdentifier:@"JCHongbangMatchInfoCell"];
    [self.tableView registerClass:[JCHongbangDetailCommentCell class] forCellReuseIdentifier:@"JCHongbangDetailCommentCell"];
    [self.tableView registerClass:[JCHongbangDetailOtherCell class] forCellReuseIdentifier:@"JCHongbangDetailOtherCell"];

    [self.tableView registerClass:[JCHongbangCommomCell class] forCellReuseIdentifier:@"JCHongbangCommomCell"];
    
    [self.tableView registerClass:[JCFanganSaleOut_BuyCell class] forCellReuseIdentifier:@"JCFanganSaleOut_BuyCell"];
    

    self.buyUserView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(50));
    [self.buyUserView addSubview:self.buyCountLab];
    [self.buyCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.buyUserView);
    }];
    
//    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view).offset(-76);
//    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section==0) {
        if (self.is_saleOut) {
            return 0;
        }
        return self.matchDataArray.count;
    }
    if (section==1) {
        return 1;
    }

    return self.tuiJianArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        
//        if (self.tjInfoDetailBall.classfly>1) {
//            return AUTO(130);
//        }
        return AUTO(120);
//        return UITableViewAutomaticDimension;
    }
    if (indexPath.section==1) {
        return UITableViewAutomaticDimension;
    }

    return UITableViewAutomaticDimension;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    

    if (indexPath.section==0) {
        if (self.tjInfoDetailBall.classfly>1) {
            JCHongbangDetailOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangDetailOtherCell"];
            cell.hideMatchRate = YES;
            cell.matchModel = self.matchDataArray[indexPath.row];
            cell.tjInfoDetailBall = self.tjInfoDetailBall;
            return cell;
        }
        JCHongbangDetailCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCHongbangDetailCommentCell"];//JCHongbangMatchInfoCell
        cell.hideMatchRate = YES;
        cell.matchModel = self.matchDataArray[indexPath.row];//JCHongbangDetailCommentCell
        cell.tjInfoDetailBall = self.tjInfoDetailBall;
        
        return cell;
    }
    if (indexPath.section==1) {
        if (self.is_saleOut) {
            JCFanganSaleOut_BuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCFanganSaleOut_BuyCell"];
            cell.tjInfoDetailBall = self.tjInfoDetailBall;
            return cell;
                }
        JCBuyPlanLock_HB_Cell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCBuyPlanLock_HB_Cell"];
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

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    if (section==0||section==1) {
        UIView *view = [UIView new];
        view.backgroundColor = COLOR_F0F0F0;
        return view;
    }
    
    
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section==0&&!self.is_saleOut) {
        
        return AUTO(4);
    }
    if (section==1&&self.tuiJianArray.count>0) {
        return AUTO(4);
    }
    return 0.001f;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section==0) {
        UIView *view = [UIView new];
        view.backgroundColor = COLOR_F0F0F0;
        return view;
    }
    if (section==2&&self.tuiJianArray.count>0) {
        UIView *view = [UIView new];
        view.backgroundColor = JCWhiteColor;
        UILabel *titleLab = [UILabel initWithTitle:@"热门推荐" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
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

#pragma 设置线条画满
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
 
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
//        [cell setSeparatorInset:UIEdgeInsetsZero];
        if (indexPath.section==0||indexPath.section==1) {
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
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
}


#pragma mark --



- (void)sureBtnClick {
    
//    JCHongbangOrderVC *vc = [JCHongbangOrderVC new];
//    vc.expertID = self.tjInfoDetailBall.id;
//    [self.navigationController pushViewController:vc animated:YES];
    
    JCHongbangOrderWMstckyVC *vc = [JCHongbangOrderWMstckyVC new];
//    vc.tjInfoId = self.tjInfoDetailBall.id;
//    vc.dataDic= self.dataDic;
    vc.detailModel = self.detailModel;
    [self.navigationController pushViewController:vc animated:YES];


}


-(void)updateTimeInVisibleCells{
    if (self.is_saleOut) {
        [self.countDown destoryTimer];
    }
    NSArray  *cells = self.tableView.visibleCells; //取出屏幕可见ceLl
    for (UITableViewCell *cell in cells) {
        if ([cell isKindOfClass:[JCBuyPlanLock_HB_Cell class]]) {
            JCBuyPlanLock_HB_Cell *timeCell = (JCBuyPlanLock_HB_Cell *)cell;
            if (self.time_distance<=0) {
                timeCell.timeLab.text = @"00:00:00";
//                return;
            }
            NSDictionary *dic = [self getNowTimeWithString:self.time_distance];
            
            NSString *hours = dic[@"hours"];
            NSString *minutes = dic[@"minutes"];
            NSString *second = dic[@"seconds"];
            timeCell.timeLab.text = [NSString stringWithFormat:@"%@:%@:%@",hours,minutes,second];
            if ([hours intValue]==0&&[minutes intValue]==0&&[second intValue]==0) {
                timeCell.titleLab.text = @"售卖已截止，文章无法购买";
            }
            if (self.time_distance>0) {
                self.time_distance--;
            }else{
                if (self.JCMatchStatusBlock) {
                    self.JCMatchStatusBlock(YES);
                }
                timeCell.timeLab.text = @"00:00:00";
            }

            
        }

    }
}

-(NSDictionary *)getNowTimeWithString:(int)aTimeString {
    

    int  timeInterval = aTimeString;
//    [aTimeString intValue];
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    if (hours<10) {
        hoursStr = [NSString stringWithFormat:@"%02d",hours+days*24];
    }else{
        hoursStr = [NSString stringWithFormat:@"%d",hours+days*24];
    }
   //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"%02d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"%02d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (days<=0&hours<=0&&minutes<=0&&seconds<=0) {
        hoursStr = @"00";
        minutesStr = @"00";
        secondsStr = @"00";
        self.match_end = YES;

//        return @"活动已经结束！";
         [self.countDown destoryTimer];
    }
    if (timeInterval==0) {
        self.match_end = YES;
    }

    if (days) {
        
    }
    return @{@"hours":hoursStr,@"minutes":minutesStr,@"seconds":secondsStr};
}

- (void)showBuyUserView {
    NSArray *userArray = self.tjInfoDetailBall.user;
//        userArray = [[userArray reverseObjectEnumerator] allObjects];
            for (int i=0; i<userArray.count; i++) {
                JCWExpertBall *model = userArray[i];

                  UIImageView *imgView = [UIImageView new];
                  [imgView hg_setAllCornerWithCornerRadius:AUTO(16)];
                imgView.frame = CGRectMake(AUTO(15)+AUTO(15)*i, AUTO(4), AUTO(32), AUTO(32));
                imgView.image = JCIMAGE(@"userImg_default");
                [imgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    //              [self.buyBgView addSubview:imgView];
                [self.buyUserView addSubview:imgView];
                [imgView bringSubviewToFront:self.buyUserView];
          }
    if (userArray.count>0) {
        NSString *title = [NSString stringWithFormat:@"%ld人购买",userArray.count];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:[NSString stringWithFormat:@"%ld",userArray.count]];
        [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
        [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)]} range:range];
        self.buyCountLab.attributedText = attr;
        if (!self.is_saleOut) {
            self.tableView.tableFooterView= self.buyUserView;
        }
       
    }else{
        self.buyCountLab.text = @"";
    }
}

- (NSMutableArray *)payWayArray {
    if (!_payWayArray) {
        _payWayArray = [NSMutableArray array];
        
        JCPayWayBall * hongbaoBall = [[JCPayWayBall alloc] init];
        hongbaoBall.title = @"红包抵扣";
        hongbaoBall.payWay = JCPayWayEnumHongbao;
        //默认选中第一个
        JCPayWayBall * caiyunBall = [[JCPayWayBall alloc] init];
        caiyunBall.state_issel = YES;
        caiyunBall.payWay = JCPayWayEnumCaiyun;
        caiyunBall.title = @"红币支付";
        self.selPayWay = caiyunBall;//默认红币支付
        [_payWayArray addObject:hongbaoBall];
        [_payWayArray addObject:caiyunBall];


    }
    return _payWayArray;
}


- (JCHongbaoShowView *)hbPickerView {
    if (!_hbPickerView) {
        _hbPickerView = [JCHongbaoShowView new];
        _hbPickerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _hbPickerView;
}

- (UIView *)buyUserView {
    if (!_buyUserView) {
        _buyUserView = [UIView new];
        _buyUserView.backgroundColor = JCWhiteColor;
    }
    return _buyUserView;
}

- (UILabel *)buyCountLab {
    if (!_buyCountLab) {
        _buyCountLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _buyCountLab;
}


-(void)dealloc{
    [self.countDown destoryTimer];

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
