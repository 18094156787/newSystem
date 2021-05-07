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
@interface JCActivityDetailCommomVC ()

@property (nonatomic,strong) JCActivityDetailHeadView *headView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) JCActivityPrizeShowView *prizeView;

@property (nonatomic,assign) float cellHeight;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCShareView *shareView;

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
            NSString *accumulate = [NSString stringWithFormat:@"累计充值：%@ | ",self.detailModel.cumulative_recharge];
            if ([self.detailModel.type integerValue]==2) {
                accumulate = @"";
            }
            if ([self.detailModel.pay_type integerValue]==3||[self.detailModel.pay_type integerValue]==4) {
                accumulate = @"";
            }
                NSString *infoStr = [NSString stringWithFormat:@"%@我已领取：%@ ",accumulate,self.detailModel.quantity_received];
            self.infoLab.text = infoStr;

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
            
//            self.detailModel.goods_info = @[];
            [self.tableView reloadData];
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
        [self.navigationController pushViewController:[JCChargeVC new] animated:YES];
        return;
    }
    
    if ([self.detailModel.type integerValue]==2) {
        //领取奖励
        JCActivityService *service = [JCActivityService service];
        [service getActivityPrizeWithActID:self.detailModel.id success:^(id  _Nullable object) {
            [self.view endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                [self refreshData];
                [JCWToastTool showHint:object[@"data"][@"get_content"]];
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
@end
