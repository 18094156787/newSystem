//
//  JCActivityKindVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindVC.h"
#import "JCKindActivityHeadView.h"
#import "JCActivityPrizeCell.h"
#import "JCActivityRuleCell.h"
#import "JCActivityPrizeShowView.h"
#import "JCActivitytTimeCell.h"
#import "JCActivityKindCell.h"
#import "JCShareView.h"
#import "JCActivityGuessCompleteVC.h"
#import "JCActivityGuessFailureTipView.h"
#import "JCActivityGuessSuccessTipView.h"
#import "JCActivityKindGetPrizeCell.h"
#import "JCActivityKindProgressCell.h"
#import "JCKindScoreCompleteView.h"
#import "JCActivityDetailModel.h"
#import "JCKindSignTipView.h"
#import "JCKindInviteView.h"
#import "JCKindActivityInfoModel.h"
#import "JCActivityPrizeShowView.h"
#import "JCShareView.h"
#import "JCKindShareView.h"
#import "JCKindSignReturnModel.h"
#import "JCYCInviteShareVC.h"
#import "JCYuceShareInfoModel.h"

@interface JCActivityKindVC ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong) JCKindActivityHeadView *headView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCActivityPrizeShowView *prizeView;

@property (nonatomic,strong) UIImageView *resultImgView;

@property (nonatomic,strong) UIButton *signBtn;

@property (nonatomic,strong) UILabel *signLab;

@property (nonatomic,strong) UIButton *shareBtn;

@property (nonatomic,strong) UILabel *shareLab;

@property (nonatomic,strong) UIButton *inviteBtn;

@property (nonatomic,strong) UILabel *endLab;

@property (nonatomic,strong)CAGradientLayer *signGl;

@property (nonatomic,strong)CAGradientLayer *shareGl;

@property (nonatomic,strong)CAGradientLayer *inviteGl;

@property (nonatomic,strong) UIButton *completeBtn;

@property (nonatomic,strong) UIButton *shareImageBtn;

@property (nonatomic,strong) UIButton *endBtn;

@property (nonatomic,assign) float kindHeight;

@property (nonatomic,assign) float cellHeight;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong) JCKindScoreCompleteView *scoreTipView;//阶段奖励

@property (nonatomic,strong) JCKindInviteView *inviteView;//邀请海报二维码

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) JCKindShareView *shareBottomView;

@property (nonatomic,strong) NSMutableArray *popImageArray;//弹窗数组

@property (nonatomic,strong) JCKindSignTipView *signTipView;

@end

@implementation JCActivityKindVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
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
    self.kindHeight = 444;
    [self refreshData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"refreshKindActivityDetail" object:nil];
    

}


- (void)refreshData {
//    [self.view showLoading];
    JCActivityService *service = [JCActivityService service];
    [service getKindActivityDetailWithActID:NonNil(self.actID) success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.detailModel = (JCActivityDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCActivityDetailModel class]];
//            if (!self.detailModel.type) {
//                self.detailModel.type = @"5";
//            }
//            self.detailModel.user_info.is_finish = @"1";
            self.headView.detailModel = self.detailModel;
            self.title = self.detailModel.title;
            self.tableView.backgroundColor = [UIColor colorWithHexString:NonNil(self.detailModel.background_color)];
            

            
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
            
            if ([self.detailModel.user_info.is_sign integerValue]==1) {
                self.signBtn.userInteractionEnabled = NO;
                self.signGl.colors = @[(__bridge id)UIColorFromRGB(0xABAFB7).CGColor, (__bridge id)UIColorFromRGB(0x9B9FA8).CGColor];
                self.signLab.text = @"今日已签到";
            }
            if ([self.detailModel.user_info.is_share integerValue]==1) {
                self.shareBtn.userInteractionEnabled = NO;
                self.shareGl.colors = @[(__bridge id)UIColorFromRGB(0xABAFB7).CGColor, (__bridge id)UIColorFromRGB(0x9B9FA8).CGColor];
                self.shareLab.text = @"今日已分享";
            }
            
            if ([self.detailModel.active_state integerValue]==3) {
                self.signBtn.hidden = YES;
                self.shareBtn.hidden = YES;
                self.inviteBtn.hidden = YES;
                [self.bottomView addSubview:self.endBtn];
                self.endLab.text = @"本期活动已结束";
            }else{
                //进行中
                if ([self.detailModel.user_info.is_finish integerValue]==1) {
                    self.signBtn.hidden = YES;
                    self.shareBtn.hidden = YES;
                    self.inviteBtn.hidden = YES;

                    [self.bottomView addSubview:self.completeBtn];
                    [self.bottomView addSubview:self.shareImageBtn];
                }else{


                    if ([self.detailModel.active_state integerValue]==4) {
                        //已结束
                        self.signBtn.hidden = YES;
                        self.shareBtn.hidden = YES;
                        self.inviteBtn.hidden = YES;
                        [self.bottomView addSubview:self.endBtn];
                        self.endLab.text = @"活动太火爆，奖励已经发完了。";
                    }
                    if ([self.detailModel.active_state integerValue]==1) {
                        //未开始
                        self.signBtn.hidden = YES;
                        self.shareBtn.hidden = YES;
                        self.inviteBtn.hidden = YES;
                        [self.bottomView addSubview:self.endBtn];
                        self.endLab.text = @"活动未开始";
                    }
                    
                }

            }

            //阶段奖励
            if ([self.detailModel.is_stage integerValue]==1) {

                
                if (![self.popImageArray containsObject:self.scoreTipView]) {
                    self.scoreTipView.detailModel = self.detailModel;
                    self.scoreTipView.dataSource = self.detailModel.stage_info;
                    [self.popImageArray addObject:self.scoreTipView];
                }

            }
            if ([self.detailModel.is_popup integerValue]==2) {
                //活动海报弹窗
                self.inviteView.imgUrl = self.detailModel.popup_image;
                
                if (![self.popImageArray containsObject:self.inviteView]) {
                    self.inviteView.shareBtn.hidden = NO;
                    self.inviteView.shareBottomView.hidden = YES;
                    [self.popImageArray addObject:self.inviteView];
                }

            }
            [self showPopTipView];


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
//    self.tableView.bounces = NO;
    
    [self.tableView registerClass:[JCActivityKindCell class] forCellReuseIdentifier:@"JCActivityKindCell"];
    [self.tableView registerClass:[JCActivitytTimeCell class] forCellReuseIdentifier:@"JCActivitytTimeCell"];
    
    [self.tableView registerClass:[JCActivityPrizeCell class] forCellReuseIdentifier:@"JCActivityPrizeCell"];
    [self.tableView registerClass:[JCActivityRuleCell class] forCellReuseIdentifier:@"JCActivityRuleCell"];
    [self.tableView registerClass:[JCActivityKindGetPrizeCell class] forCellReuseIdentifier:@"JCActivityKindGetPrizeCell"];
    [self.tableView registerClass:[JCActivityKindProgressCell class] forCellReuseIdentifier:@"JCActivityKindProgressCell"];
    
    self.tableView.panGestureRecognizer.delaysTouchesBegan = YES;
    [self.view addSubview:self.tableView];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(100));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = JCWhiteColor;
    [self.view addSubview:bottomView];
    self.bottomView = bottomView;
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(100));
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
        
    }];
    
    float width = (SCREEN_WIDTH-AUTO(113)-AUTO(104)*2)/4.0f;
    
    [bottomView addSubview:self.signBtn];
//    self.signBtn.frame= CGRectMake(width, 10, AUTO(104), AUTO(44));
    [self.signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(width);
        make.top.offset(10);
        make.size.mas_equalTo(CGSizeMake(AUTO(104), AUTO(44)));
    }];
    UILabel *signLab = [UILabel initWithTitle:@"签到+1" andFont:16 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.signBtn addSubview:signLab];
    [signLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.signLab = signLab;
//
    [bottomView addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.signBtn.mas_right).offset(width);
        make.top.offset(10);
        make.size.mas_equalTo(CGSizeMake(AUTO(104), AUTO(44)));
    }];
    
    UILabel *shareLab = [UILabel initWithTitle:@"分享+5" andFont:16 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.shareBtn addSubview:shareLab];
    [shareLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.shareLab = shareLab;
    

    [bottomView addSubview:self.inviteBtn];
    [self.inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shareBtn.mas_right).offset(width);
        make.top.offset(10);
        make.size.mas_equalTo(CGSizeMake(AUTO(113), AUTO(44)));
    }];
    UILabel *inviteLab = [UILabel initWithTitle:@"邀请注册+10" andFont:16 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.inviteBtn addSubview:inviteLab];
    [inviteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    
    [bottomView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(68)));
    }];
    
    WeakSelf;
    [self.signBtn bk_whenTapped:^{
        [weakSelf signBtnClick];
    }];
    
    [self.shareBtn bk_whenTapped:^{
        [weakSelf shareItemClick];
    }];
    
    [self.inviteBtn bk_whenTapped:^{
        [weakSelf inviteBtnClick];
    }];

    
   
    self.headView.JCHeightBlock = ^(float height) {
        weakSelf.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
        weakSelf.tableView.tableHeaderView = weakSelf.headView;
        
    };
    //签到
    self.signTipView.JCCloseBlock = ^{
        if ([weakSelf.popImageArray containsObject:weakSelf.signTipView]) {
            [weakSelf.popImageArray removeObject:weakSelf.signTipView];
            [weakSelf showPopTipView];
        }
    };
    
    //阶段奖励
    self.scoreTipView.JCClickBlock = ^(NSArray * _Nonnull dataArray) {
        weakSelf.prizeView.showHeader = NO;
        weakSelf.prizeView.detailModel = weakSelf.detailModel;
        weakSelf.prizeView.dataArray = dataArray;
        [weakSelf.jcWindow addSubview:weakSelf.prizeView];
    };
    self.scoreTipView.JCCloseBlock = ^{
        if ([weakSelf.popImageArray containsObject:weakSelf.scoreTipView]) {
            [weakSelf.popImageArray removeObject:weakSelf.scoreTipView];
            [weakSelf showPopTipView];
        }
    };
    
    //分享海报弹窗
    self.inviteView.JCBlock = ^(UIImage * _Nonnull image) {
        weakSelf.shareBottomView.frame = CGRectMake(0, SCREEN_HEIGHT-100-kBottomTabSafeAreaHeight, SCREEN_WIDTH, 100+kBottomTabSafeAreaHeight);
        weakSelf.shareBottomView.shareImage = image;
        [weakSelf.inviteView addSubview:weakSelf.shareBottomView];
        weakSelf.inviteView.shareBottomView.hidden = YES;
        [weakSelf.shareBottomView show];
    };
    self.inviteView.JCCloseBlock = ^{
        if ([weakSelf.popImageArray containsObject:weakSelf.inviteView]) {
            [weakSelf.popImageArray removeObject:weakSelf.inviteView];
            [weakSelf showPopTipView];
        }
    };
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (self.detailModel.banner.count>0) {
            JCActivityKindGetPrizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityKindGetPrizeCell"];
    //        JCWSlideBall *slide = [JCWSlideBall new];
    //        slide.desc = @"地方代购复古风格快递费";
            cell.tipArray = self.detailModel.banner;
            return cell;
        }

    }
    if (indexPath.section==1) {
        JCActivityKindProgressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityKindProgressCell"];
        cell.detailModel = self.detailModel;
        return cell;
    }
    
    
    if (indexPath.section==2) {
        JCActivityKindCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityKindCell"];
//        WeakSelf;
//        cell.JCHeightBlock = ^(float heihgt) {
//            weakSelf.kindHeight = heihgt+20;
//            [weakSelf.tableView reloadData];
//        };
        cell.actID = self.actID;
        cell.detailModel = self.detailModel;
        return cell;
    }
    if (indexPath.section==3) {
        JCActivitytTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivitytTimeCell"];
        cell.detailModel = self.detailModel;
        cell.kindImageView = JCIMAGE(@"ic_kind_title");
        return cell;
    }
    if (indexPath.section==4) {
        JCActivityPrizeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityPrizeCell"];
        cell.detailModel = self.detailModel;
        cell.dataSource = self.detailModel.goods_info;
        cell.kindImageView = JCIMAGE(@"ic_kind_title");
        WeakSelf;
        cell.JCClickBlock = ^{
            weakSelf.prizeView.showHeader = YES;
            weakSelf.prizeView.detailModel = weakSelf.detailModel;
            weakSelf.prizeView.dataArray = weakSelf.detailModel.goods_info;
            [weakSelf.jcWindow addSubview:weakSelf.prizeView];
        };
        return cell;
    }

    if (indexPath.section==5) {
        JCActivityRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityRuleCell"];
        WeakSelf;
        cell.detailModel = self.detailModel;
        cell.kindImageView = JCIMAGE(@"ic_kind_title");
        cell.JCRefreshBlock = ^(float height) {
            weakSelf.cellHeight = height+20;
            [weakSelf.tableView reloadData];
        };

        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.contentView.backgroundColor = JCClearColor;
    cell.backgroundColor = JCClearColor;
    return cell;

}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (self.detailModel.banner.count>0) {
            return 32;
        }
        return 0.01f;
    }
    if (indexPath.section==1) {
        return 86;
    }
    if (indexPath.section==2) {

        return self.kindHeight;
    }

    if (indexPath.section==3) {
        return 100;
    }
    
    if (indexPath.section==4) {
        if (self.detailModel.goods_info.count>0) {
            if ([self.detailModel.count integerValue]>0) {
                return 170;
            }
            return 136;
        }
        return 0.01f;
        
    }
    return self.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        if (self.detailModel.banner.count==0) {
            return 0.01f;
        }
    }


    if (section==2) {
        return 0.01;
    }
    if (section==4) {
        if (self.detailModel.goods_info.count==0) {
            return 0.01f;
        }
        
    }
    return 20;
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

- (void)signBtnClick {

    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
//    [self.navigationController.topViewController isKindOfClass:[UIViewController class]];
    [self.view showLoading];
    JCActivityService *service = [JCActivityService service];
    [service getKindActivitySignWithActID:self.actID type:@"1" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshKindActivityDetail" object:nil];
            JCKindSignReturnModel *user_info = (JCKindSignReturnModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCKindSignReturnModel class]];
            [self.tableView reloadData];
            
            if ([user_info.is_sign integerValue]==1) {
                self.signBtn.userInteractionEnabled = NO;
                self.signGl.colors = @[(__bridge id)UIColorFromRGB(0xABAFB7).CGColor, (__bridge id)UIColorFromRGB(0x9B9FA8).CGColor];
                self.signLab.text = @"今日已签到";
//                [self.jcWindow addSubview:self.signTipView];
                if (![self.popImageArray containsObject:self.signTipView]) {
                    [self.popImageArray addObject:self.signTipView];
                }
                
            }
            if ([user_info.is_stage integerValue]==1) {
                self.detailModel.stage_grade = user_info.stage_grade;
                self.scoreTipView.detailModel = self.detailModel;
                self.scoreTipView.dataSource = user_info.stage_info;
                
                if (![self.popImageArray containsObject:self.scoreTipView]) {
                    [self.popImageArray addObject:self.scoreTipView];
                }

            }
            if ([user_info.is_popup integerValue]==2) {
                //活动海报弹窗
                self.inviteView.imgUrl = user_info.popup_image;
                
                if (![self.popImageArray containsObject:self.inviteView]) {
                    self.inviteView.shareBtn.hidden = NO;
                    self.inviteView.shareBottomView.hidden = YES;
                    [self.popImageArray addObject:self.inviteView];
                }

            }
            [self showPopTipView];
            

            
//            [self refreshData];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}


//邀请注册
- (void)inviteBtnClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    JCYCInviteShareVC *vc = [JCYCInviteShareVC new];
    JCYuceShareInfoModel *model = [JCYuceShareInfoModel new];
    model.friend_url = self.detailModel.share_resiger.share_resiger_url;
    model.url = self.detailModel.share_resiger.share_resiger_url;
    model.information = self.detailModel.share_resiger.share_title;
    model.desc = self.detailModel.share_resiger.share_desc;
    vc.activity_id = self.actID;
    vc.infoModel = model;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)shareItemClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
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
//分享海报
- (void)sharePosterClick {
//    self.inviteView.imgUrl = @"http://imagetest.yixinzuqiu.com/upload/image/1109/47b87ab5cad3451bf3484dc385e408aa.jpg";
    self.inviteView.imgUrl = self.detailModel.popup_image;
    self.inviteView.shareBottomView.hidden = NO;
    self.inviteView.shareBtn.hidden = YES;
    [self.jcWindow addSubview:self.inviteView];

}
//展示弹窗,可能存在多个
- (void)showPopTipView {
    if (self.popImageArray.count>0) {
        UIView *view = self.popImageArray.firstObject;
        [self.jcWindow addSubview:view];
    }
    
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    if ([scrollView isKindOfClass:[UITableView class]]) {
//        NSLog(@"------是列表---");
//    }
//    else {
//        NSLog(@"------是滚动试图----");
//    }
    JCActivityKindCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
    cell.userVC.tableView.scrollEnabled = YES;
    cell.scoreVC.tableView.scrollEnabled = YES;
    cell.prizeVC.tableView.scrollEnabled = YES;
}
- (JCKindActivityHeadView *)headView {
    if (!_headView) {
        _headView = [JCKindActivityHeadView new];
    }
    return _headView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
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

- (UIButton *)signBtn {
    if (!_signBtn) {
        _signBtn = [UIButton initWithText:@"签到+1" FontSize:16 BackGroundColor:JCClearColor TextColor:JCWhiteColor];
        [_signBtn hg_setAllCornerWithCornerRadius:22];
        self.signGl = [CAGradientLayer layer];
        self.signGl.frame = CGRectMake(0,0,AUTO(104),AUTO(44));
        self.signGl.startPoint = CGPointMake(0, 0);
        self.signGl.endPoint = CGPointMake(0, 1);
        self.signGl.colors = @[(__bridge id)UIColorFromRGB(0xFFC152).CGColor, (__bridge id)UIColorFromRGB(0xFD8F39).CGColor];
        self.signGl.locations = @[@(0), @(1.0f)];
        [_signBtn.layer addSublayer:self.signGl];
        

    }
    return _signBtn;
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton initWithText:@"分享+5" FontSize:16 BackGroundColor:JCClearColor TextColor:JCWhiteColor];
        [_shareBtn hg_setAllCornerWithCornerRadius:22];
        
        self.shareGl = [CAGradientLayer layer];
        self.shareGl.frame = CGRectMake(0,0,AUTO(104),AUTO(44));
        self.shareGl.startPoint = CGPointMake(0, 0);
        self.shareGl.endPoint = CGPointMake(1, 1);
        self.shareGl.colors = @[(__bridge id)UIColorFromRGB(0xFFC152).CGColor, (__bridge id)UIColorFromRGB(0xFD8F39).CGColor];
        self.shareGl.locations = @[@(0), @(1.0f)];
        [_shareBtn.layer addSublayer:self.shareGl];
    }
    return _shareBtn;
}

- (UIButton *)inviteBtn {
    if (!_inviteBtn) {
        _inviteBtn = [UIButton initWithText:@"邀请注册+10" FontSize:16 BackGroundColor:JCClearColor TextColor:JCWhiteColor];
        [_inviteBtn hg_setAllCornerWithCornerRadius:22];
        self.inviteGl = [CAGradientLayer layer];
        self.inviteGl.frame = CGRectMake(0,0,AUTO(113),AUTO(44));
        self.inviteGl.startPoint = CGPointMake(0, 0);
        self.inviteGl.endPoint = CGPointMake(1, 0);
        self.inviteGl.colors = @[(__bridge id)UIColorFromRGB(0xFB5735).CGColor, (__bridge id)UIColorFromRGB(0xFF3125).CGColor];
        self.inviteGl.locations = @[@(0), @(1.0f)];
        [_inviteBtn.layer addSublayer:self.inviteGl];
    }
    return _inviteBtn;
}

- (UIButton *)completeBtn {
    if (!_completeBtn) {
        float width = (SCREEN_WIDTH-45)/2.0f;
        _completeBtn = [UIButton initWithText:@"" FontSize:16 BackGroundColor:JCClearColor TextColor:JCWhiteColor];
        _completeBtn.frame = CGRectMake(15, 10, width, 44);
        [_completeBtn hg_setAllCornerWithCornerRadius:22];
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = CGRectMake(0,0,width,AUTO(44));
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 0);
        gl.colors = @[(__bridge id)UIColorFromRGB(0xABAFB7).CGColor, (__bridge id)UIColorFromRGB(0x9B9FA8).CGColor];
        gl.locations = @[@(0), @(1.0f)];
        [_completeBtn.layer addSublayer:gl];
        
        UILabel *completeLab = [UILabel initWithTitle:@"活动目标已达成" andFont:16 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        
        completeLab.frame = CGRectMake(0, 0, width, 44);
        [_completeBtn addSubview:completeLab];
    }
    return _completeBtn;
}

- (UIButton *)shareImageBtn {
    if (!_shareImageBtn) {
        float width = (SCREEN_WIDTH-45)/2.0f;
        _shareImageBtn = [UIButton initWithText:@"" FontSize:16 BackGroundColor:JCClearColor TextColor:JCWhiteColor];
        [_shareImageBtn addTarget:self action:@selector(sharePosterClick) forControlEvents:UIControlEventTouchUpInside];
        _shareImageBtn.frame = CGRectMake(30+width, 10, width, 44);
        [_shareImageBtn hg_setAllCornerWithCornerRadius:22];
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = CGRectMake(0,0,width,AUTO(44));
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 0);
        gl.colors = @[(__bridge id)UIColorFromRGB(0xFB5735).CGColor, (__bridge id)UIColorFromRGB(0xFF3125).CGColor];
        gl.locations = @[@(0), @(1.0f)];
        [_shareImageBtn.layer addSublayer:gl];
        
        UILabel *shareLab = [UILabel initWithTitle:@"分享活动图片" andFont:16 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        
        shareLab.frame = CGRectMake(0, 0, width, 44);
        [_shareImageBtn addSubview:shareLab];
    }
    return _shareImageBtn;
}

- (UIButton *)endBtn {
    if (!_endBtn) {
        _endBtn = [UIButton initWithText:@"" FontSize:16 BackGroundColor:JCClearColor TextColor:JCWhiteColor];
        [_endBtn hg_setAllCornerWithCornerRadius:22];
        _endBtn.frame = CGRectMake(15, 10, SCREEN_WIDTH-30, 44);
        CAGradientLayer *gl = [CAGradientLayer layer];
        gl.frame = CGRectMake(0,0,SCREEN_WIDTH-30,AUTO(44));
        gl.startPoint = CGPointMake(0, 0);
        gl.endPoint = CGPointMake(1, 0);
        gl.colors = @[(__bridge id)UIColorFromRGB(0xABAFB7).CGColor, (__bridge id)UIColorFromRGB(0x9B9FA8).CGColor];
        gl.locations = @[@(0), @(1.0f)];
        [_endBtn.layer addSublayer:gl];
        self.endLab = [UILabel initWithTitle:@"" andFont:16 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        self.endLab.frame = CGRectMake(0, 0, SCREEN_WIDTH-30, 44);
        [_endBtn addSubview:self.endLab];
    }
    return _endBtn;
}
- (JCKindScoreCompleteView *)scoreTipView {
    if (!_scoreTipView) {
        
        _scoreTipView = [JCKindScoreCompleteView new];
        _scoreTipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _scoreTipView;
}

- (JCKindInviteView *)inviteView {
    if (!_inviteView) {
        _inviteView = [JCKindInviteView new];
        _inviteView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _inviteView;
}

- (JCKindShareView *)shareBottomView {
    if (!_shareBottomView) {
        _shareBottomView = [JCKindShareView new];
    }
    return _shareBottomView;;
}

- (NSMutableArray *)popImageArray {
    if (!_popImageArray) {
        _popImageArray = [NSMutableArray array];
    }
    return _popImageArray;
}
- (JCKindSignTipView *)signTipView {
    if (!_signTipView) {
        _signTipView = [JCKindSignTipView new];
        _signTipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _signTipView;
}
@end
