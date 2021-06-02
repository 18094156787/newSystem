//
//  JCActivityDetailCommomVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/23.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityDetailCommomVC.h"
#import "JCActivityDetailHeadView.h"
#import "JCActivityPrizeCell.h"
#import "JCActivityRuleCell.h"
#import "JCActivityPrizeShowView.h"
#import "JCActivityDetailModel.h"
#import "JCShareView.h"
#import "JCChargeVC.h"
#import "JCActivityResultTipView.h"
#import "JCActivityRechargeResultTipView.h"
@interface JCActivityDetailCommomVC ()

@property (nonatomic,strong) JCActivityDetailHeadView *headView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) JCActivityPrizeShowView *prizeView;

@property (nonatomic,assign) float cellHeight;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong) JCActivityResultTipView *activity_commom_tipView;

@property (nonatomic,strong) JCActivityRechargeResultTipView *activity_recharge_tipView;

@property (assign,nonatomic) BOOL showPrze;//奖励弹窗

@end

@implementation JCActivityDetailCommomVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)backItemClick {
    if (self.JCCancelBlock) {
        self.JCCancelBlock();
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showPrze = YES;//默认可以显示奖励弹窗
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:UserRechargeSuccess object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
}

- (void)refreshData {
    [self.view showLoading];
    JCActivityService *service = [JCActivityService service];
    [service getActivityDetailWithActID:NonNil(self.actID) success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.detailModel = (JCActivityDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCActivityDetailModel class]];
            self.headView.detailModel = self.detailModel;

            
            self.title = self.detailModel.title;
            NSString *accumulate = [NSString stringWithFormat:@"累计充值：%@ | 我已领取：%@",self.detailModel.cumulative_recharge,self.detailModel.quantity_received];
 
            if ([self.detailModel.pay_type integerValue]!=1&&[self.detailModel.pay_type integerValue]!=2) {
                //首冲,用后台带的文本
                accumulate = self.detailModel.recharge_information;
            }
            if ([self.detailModel.type integerValue]==2) {
                accumulate = [NSString stringWithFormat:@"我已领取: %@",self.detailModel.quantity_received];
            }

            self.infoLab.text = accumulate;

            self.sureBtn.backgroundColor = [self.detailModel.text_can_click integerValue]==1?JCBaseColor:COLOR_9F9F9F;
            self.sureBtn.userInteractionEnabled = [self.detailModel.text_can_click integerValue]==1?YES: NO;
            self.tableView.backgroundColor = [UIColor colorWithHexString:NonNil(self.detailModel.background_color)];
            [self.sureBtn setTitle:NonNil(self.detailModel.text_prompt) forState:0];
            
            self.shareView.title = self.detailModel.wechat_share.share_title;
            self.shareView.content = self.detailModel.wechat_share.share_desc;
            self.shareView.desc = self.detailModel.wechat_share.share_desc;
            self.shareView.webPageUrl =self.detailModel.wechat_share.share_url;
            self.shareView.friend_url =self.detailModel.wechat_share.friend_url;
            self.shareView.imageUrl = self.detailModel.wechat_share.share_image;
            [self.tableView reloadData];
            if ([self.detailModel.is_popover integerValue]==1&&self.showPrze) {
                [self showRechargeResult];
            }
      
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}




- (void)initSubViews {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"common_title_back_black_bold") style:0 target:self action:@selector(backItemClick)];
    backItem.tintColor = COLOR_2F2F2F;
    self.navigationItem.leftBarButtonItem = backItem;
    
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"ic_share_black") style:0 target:self action:@selector(shareItemClick)];
    shareItem.tintColor = JCBlackColor;
    self.navigationItem.rightBarButtonItem = shareItem;
    
    self.cellHeight = 50;
    
    
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 265);//240+25
    self.tableView.tableHeaderView = self.headView;
    self.tableView.separatorStyle = 0;
    [self.tableView registerClass:[JCActivityPrizeCell class] forCellReuseIdentifier:@"JCActivityPrizeCell"];
    [self.tableView registerClass:[JCActivityRuleCell class] forCellReuseIdentifier:@"JCActivityRuleCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(100));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = JCWhiteColor;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(100));
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
        
    }];
    
    [bottomView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(15));
        make.centerX.equalTo(bottomView);
        make.left.right.offset(0);
    }];
    
    [bottomView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
    }];
    

    WeakSelf;
    self.headView.JCHeightBlock = ^(float height) {
        weakSelf.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
        weakSelf.tableView.tableHeaderView = weakSelf.headView;
        
    };
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&self.detailModel.goods_info.count>0) {
        JCActivityPrizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityPrizeCell"];
        cell.detailModel = self.detailModel;
        cell.dataSource = self.detailModel.goods_info;
        
        WeakSelf;
        cell.JCClickBlock = ^{
            weakSelf.prizeView.detailModel = weakSelf.detailModel;
            weakSelf.prizeView.dataArray = weakSelf.detailModel.goods_info;
            [weakSelf.jcWindow addSubview:weakSelf.prizeView];
        };
        return cell;
    }
    
    if (indexPath.section==1) {
        JCActivityRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityRuleCell"];
        WeakSelf;
        cell.detailModel = self.detailModel;
        cell.JCRefreshBlock = ^(float height) {
            weakSelf.cellHeight = height+20;
            [weakSelf.tableView reloadData];
        };
        
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    return cell;
    

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0&&self.detailModel.goods_info.count>0) {
        if ([self.detailModel.count integerValue]>0) {
            return 170;
        }
        return 136;
    }
    if (indexPath.section==1) {
        return self.cellHeight;
    }
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        if (self.detailModel.goods_info.count>0) {
            return 12;
        }
        return 0.01f;
    }
    return 12;
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

}

- (void)sureBtnClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    //type 活动类型 1跳转已有的活动 2福利活动 3充值活动 4竞猜活动
    if ([self.detailModel.type integerValue]==3) {
        JCChargeVC *vc =[JCChargeVC new];
        self.showPrze = NO;
        WeakSelf;
        vc.JCRefreshBlock = ^{
            weakSelf.showPrze = YES;
            [weakSelf refreshData];
        };
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    
    if ([self.detailModel.type integerValue]==2) {
        //领取奖励
        JCActivityService *service = [JCActivityService service];
        [service getActivityPrizeWithActID:self.detailModel.id success:^(id  _Nullable object) {
            [self.view endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                NSString *success = object[@"data"][@"is_success"];
                if ([success integerValue]==1) {
                    [self showFuliResult];
                    [self refreshData];
                }else{
                    [JCWToastTool showHint:object[@"data"][@"get_content"]];
                }

                
                
            }else{
                [JCWToastTool showHint:object[@"msg"]];
            }
        } failure:^(NSError * _Nonnull error) {
            [self.view endLoading];
        }];

    }
    
    

 
}

- (void)shareItemClick {
    WeakSelf;
    [JCWAppTool isUserNotificationEnable:^(BOOL isEnabled) {
        if (!isEnabled) {
            dispatch_async(dispatch_get_main_queue(), ^{
                JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                [alertView alertTitle:@"" TitleColor:COLOR_2F2F2F Mesasge:@"您未开启通知权限，开启后才能使用分享功能，是否前往开启？" MessageColor:COLOR_666666 SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
                    [alertView removeFromSuperview];
                } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
                   [alertView removeFromSuperview];
                }];
                alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                [[UIApplication sharedApplication].keyWindow addSubview:alertView];

            });



        }else {

            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.shareView show];

            });

        }
    
    }];

}
//福利活动领奖
- (void)showFuliResult {
    self.activity_commom_tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.activity_commom_tipView.dataSource = self.detailModel.goods_info;
    [self.jcWindow addSubview:self.activity_commom_tipView];
    
    WeakSelf;
    self.activity_commom_tipView.JCClickBlock = ^{
        weakSelf.prizeView.detailModel = weakSelf.detailModel;
        weakSelf.prizeView.dataArray = weakSelf.detailModel.goods_info;
        [weakSelf.jcWindow addSubview:weakSelf.prizeView];
    };
}
//充值奖励弹窗
- (void)showRechargeResult {
    self.activity_recharge_tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.activity_recharge_tipView.detailModel = self.detailModel;
    self.activity_recharge_tipView.dataSource = self.detailModel.goods_popover_info;
    [self.jcWindow addSubview:self.activity_recharge_tipView];
    WeakSelf;
    self.activity_recharge_tipView.JCClickBlock = ^{
        weakSelf.prizeView.detailModel = weakSelf.detailModel;
        weakSelf.prizeView.dataArray = weakSelf.detailModel.goods_popover_info;
        [weakSelf.jcWindow addSubview:weakSelf.prizeView];
    };
}

- (JCActivityDetailHeadView *)headView {
    if (!_headView) {
        _headView = [JCActivityDetailHeadView new];
    }
    return _headView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"" FontSize:AUTO(16) BackGroundColor:JCBaseColor TextColor:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

- (JCActivityPrizeShowView *)prizeView {
    if (!_prizeView) {
        _prizeView = [JCActivityPrizeShowView new];
        _prizeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _prizeView;
}
- (JCShareView *)shareView {
    if (!_shareView) {
        _shareView = [JCShareView viewFromXib];
        
    }
    return _shareView;
}

- (JCActivityResultTipView *)activity_commom_tipView {
    if (!_activity_commom_tipView) {
        _activity_commom_tipView = [JCActivityResultTipView new];
    }
    return _activity_commom_tipView;
}

- (JCActivityRechargeResultTipView *)activity_recharge_tipView {
    if (!_activity_recharge_tipView) {
        _activity_recharge_tipView = [JCActivityRechargeResultTipView new];
    }
    return _activity_recharge_tipView;
}

@end
