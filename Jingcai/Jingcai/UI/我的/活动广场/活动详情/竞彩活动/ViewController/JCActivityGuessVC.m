//
//  JCActivityGuessVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessVC.h"
#import "JCActivityHeadView.h"
#import "JCActivityPrizeCell.h"
#import "JCActivityRuleCell.h"
#import "JCActivityPrizeShowView.h"
#import "JCActivitytTimeCell.h"
#import "JCActivityGuessChooseCell.h"
#import "JCShareView.h"
#import "JCActivityGuessCompleteVC.h"
#import "JCActivityGuessFailureTipView.h"
#import "JCActivityGuessSuccessTipView.h"
@interface JCActivityGuessVC ()

@property (nonatomic,strong) JCActivityHeadView *headView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) JCActivityPrizeShowView *prizeView;

@property (nonatomic,strong) UIImageView *resultImgView;

@property (nonatomic,assign) float cellHeight;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCShareView *shareView;

@end

@implementation JCActivityGuessVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.headView.countDown destoryTimer];
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
            self.tableView.backgroundColor = [UIColor colorWithHexString:NonNil(self.detailModel.background_color)];
            
            [self.sureBtn setTitle:NonNil(self.detailModel.text_prompt) forState:0];
            self.sureBtn.backgroundColor = [self.detailModel.text_can_click integerValue]==1?JCBaseColor:COLOR_9F9F9F;
            self.sureBtn.userInteractionEnabled = [self.detailModel.text_can_click integerValue]==1?YES: NO;
            
            if ([self.detailModel.prize integerValue]>1&&[self.detailModel.is_participate integerValue]==1) {
                    self.resultImgView.hidden = NO;
                }
            //    self.resultImgView.hidden = [detailModel.is_participate integerValue]==1?NO:YES;
                if (self.detailModel.is_guess==1) {
                    self.resultImgView.image = JCIMAGE(@"active_ic_right");
                }
                if (self.detailModel.is_guess==2) {
                    self.resultImgView.image = JCIMAGE(@"active_ic_wrong");
                }
            
            self.shareView.title = self.detailModel.wechat_share.share_title;
            self.shareView.content = self.detailModel.wechat_share.share_desc;
            self.shareView.desc = self.detailModel.wechat_share.share_desc;
            self.shareView.webPageUrl =self.detailModel.wechat_share.share_url;
            self.shareView.friend_url =self.detailModel.wechat_share.friend_url;
            self.shareView.imageUrl = self.detailModel.wechat_share.share_image;
//            self.detailModel.goods_info = @[];
            [self.tableView reloadData];
            
            NSMutableArray *dataArray = [NSMutableArray array];
            for (JCActivityOptionModel *model in self.detailModel.activity_option) {
                if ([model.correct integerValue]==1) {
                    [dataArray addObject:model];
                }
            }
            self.headView.dataSource = dataArray;
            
            if ([self.detailModel.is_guessing_reminder integerValue]==1) {
                if (self.detailModel.is_guess==1) {
                    //猜中
                    JCActivityGuessSuccessTipView *guess_failureView = [JCActivityGuessSuccessTipView new];
                    guess_failureView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                    guess_failureView.dataSource = self.detailModel.goods_info;
                    WeakSelf;
                    guess_failureView.JCClickBlock = ^{
                        weakSelf.prizeView.detailModel = weakSelf.detailModel;
                        weakSelf.prizeView.dataArray = weakSelf.detailModel.goods_info;
                        [weakSelf.jcWindow addSubview:weakSelf.prizeView];
                    };
                    
                    [self.jcWindow addSubview:guess_failureView];
                }
                if (self.detailModel.is_guess==2) {
                    //没猜中
                    JCActivityGuessFailureTipView *guess_failureView = [JCActivityGuessFailureTipView new];
                    guess_failureView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                    [self.jcWindow addSubview:guess_failureView];
                }
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
    self.tableView.separatorStyle = 0;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 265);//240+25
    self.tableView.tableHeaderView = self.headView;
    
    
    [self.tableView registerClass:[JCActivityGuessChooseCell class] forCellReuseIdentifier:@"JCActivityGuessChooseCell"];
    [self.tableView registerClass:[JCActivitytTimeCell class] forCellReuseIdentifier:@"JCActivitytTimeCell"];
    
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
    
    [bottomView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(68)));
    }];

    WeakSelf;
    self.headView.JCHeightBlock = ^(float height) {
        weakSelf.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
        weakSelf.tableView.tableHeaderView = weakSelf.headView;
        
    };
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCActivityGuessChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityGuessChooseCell"];
        cell.detailModel = self.detailModel;
        cell.dataSource = self.detailModel.activity_option;
        WeakSelf;
        cell.JCSelectBlock = ^(NSInteger selCount) {
            [weakSelf.sureBtn setTitle:[NSString stringWithFormat:@"提交竞猜 (%ld/%@)",selCount,weakSelf.detailModel.option] forState:0];
        };
        return cell;
    }
    if (indexPath.section==1) {
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
    if (indexPath.section==2) {
        JCActivitytTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivitytTimeCell"];
        cell.detailModel = self.detailModel;
        return cell;
    }
    if (indexPath.section==3) {
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
    if (indexPath.section==0) {
        if (self.detailModel.activity_option.count<=10) {
            NSInteger count = ceil(self.detailModel.activity_option.count/2.0f);
            return 62*count+65;
        }
//        return 378;
        return 410;
    }
    if (indexPath.section==1) {
        if (self.detailModel.goods_info.count>0) {
            return 136;
        }
        return 0.01f;
        
    }
    if (indexPath.section==2) {
        return 92;
    }
    
    return self.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1) {
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
    NSMutableArray *dataArray = [NSMutableArray array];
    NSArray *array = [NSArray arrayWithArray:self.detailModel.activity_option];
    for (JCActivityOptionModel *model in array) {
        if ([model.local_choice integerValue]==1) {
            [dataArray addObject:model];
        }
    }
    if (dataArray.count==0) {
        [JCWToastTool showHint:@"您还未选择任何选项，请选择后再提交！"];
        return;
    }
    if (dataArray.count<[self.detailModel.option integerValue]) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        WeakSelf;
        [alertView alertTitle:@"" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_666666 SureTitle:@"确认提交" SureColor:JCWhiteColor SureHandler:^{
            [alertView removeFromSuperview];
            [weakSelf finalSubmitWithDataArray:dataArray];
        } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
           [alertView removeFromSuperview];
        }];
        NSString *title = [NSString stringWithFormat:@"当前可提交%@个选项，您只选择了%ld个，是否确认提交？",self.detailModel.option,dataArray.count];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange count_range = [title rangeOfString:self.detailModel.option];
        if (count_range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
        }
        NSRange sel_range = [title rangeOfString:[NSString stringWithFormat:@"%ld",dataArray.count]];
        if (sel_range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:sel_range];
        }
        alertView.contentLab.attributedText = attr;
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        return;
    }
    
    
    [self finalSubmitWithDataArray:dataArray];
    



 
}

- (void)finalSubmitWithDataArray:(NSArray *)dataArray {
    NSString *options = @"";
    for (int i=0; i<dataArray.count; i++) {
        JCActivityOptionModel *model = dataArray[i];
        if (i==0) {
            options = model.id;
        }else{
            options = [NSString stringWithFormat:@"%@,%@",options,model.id];
        }
    }
    
    
    JCActivityService *service = [JCActivityService service];
    [service getSubmitJingCaiUserWithActID:self.detailModel.id options:options success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCActivityGuessCompleteVC *vc = [JCActivityGuessCompleteVC new];
            vc.actID = self.actID;
            [self.navigationController pushViewController:vc animated:YES];
            [self refreshData];
//            [JCWToastTool showHint:@"提交成功"];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
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

- (JCActivityHeadView *)headView {
    if (!_headView) {
        _headView = [JCActivityHeadView new];
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
        _sureBtn = [UIButton initWithText:@"提交竞猜" FontSize:AUTO(16) BackGroundColor:JCBaseColor TextColor:JCWhiteColor];
        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
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
        _shareView.image = JCIMAGE(@"icon_app");
    }
    return _shareView;
}

- (UIImageView *)resultImgView {
    if (!_resultImgView) {
        _resultImgView = [UIImageView new];
        _resultImgView.hidden = YES;
    }
    return _resultImgView;
}
@end
