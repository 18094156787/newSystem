//
//  JCActivityGuess_SPF_More_VC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuess_SPF_More_VC.h"
#import "JCActivityGuess_SPF_HeadView.h"
#import "JCActivityPrizeCell.h"
#import "JCActivityRuleCell.h"
#import "JCActivityPrizeShowView.h"
#import "JCActivitytTimeCell.h"
#import "JCActivityGuess_SPF_More_MatchCell.h"
#import "JCShareView.h"
#import "JCActivityGuessMore_CompleteVC.h"
#import "JCActivityGuessFailureTipView.h"
#import "JCActivityGuessSuccessTipView.h"
#import "JCActivityGuess_SPF_More_CheckView.h"
#import "JCActivityGuessMore_CompleteVC.h"
@interface JCActivityGuess_SPF_More_VC ()

@property (nonatomic,strong) JCActivityGuess_SPF_HeadView *headView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) JCActivityGuess_SPF_More_CheckView *checkView;

@property (nonatomic,strong) JCActivityPrizeShowView *prizeView;

@property (nonatomic,strong) UIImageView *resultImgView;

@property (nonatomic,assign) float cellHeight;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic,strong) JCActivityOptionModel *selectOptionModel;

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong) NSMutableArray *selMatchArray;

@property (nonatomic,assign) NSInteger match_count;

@end

@implementation JCActivityGuess_SPF_More_VC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    [self.headView.countDown destoryTimer];
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
            
            self.match_count =0;
            for (JCActivityGuess_SPF_More_MatchModel *matchModel in self.detailModel.get_match_info_array) {
                if (matchModel.status_id==1) {
                    self.match_count++;
                }
                
            }


            if ([self.detailModel.is_participate integerValue]==1) {
                if (self.detailModel.is_guess==1) {
                    self.resultImgView.image = JCIMAGE(@"ic_spf_isRight");
                    self.resultImgView.hidden = NO;
                }else if (self.detailModel.is_guess==2) {
                    self.resultImgView.image = JCIMAGE(@"ic_spf_isWrong");
                    self.resultImgView.hidden = NO;
                }else if (self.detailModel.is_guess==4) {
                    self.resultImgView.image = JCIMAGE(@"ic_spf_cancel");
                    self.resultImgView.hidden = NO;
                }else{
                    self.resultImgView.hidden = YES;
                }
            }else{
                if (self.detailModel.is_guess==4) {
                    //未参与,并且活动取消,优先展示活动取消
                   self.resultImgView.image = JCIMAGE(@"ic_spf_cancel");
                   self.resultImgView.hidden = NO;
                }else if ([self.detailModel.active_state integerValue]==3) {
                    self.resultImgView.image = JCIMAGE(@"jc_activity_no_cy");
                    self.resultImgView.hidden = NO;
                }
                

            }

            
//            if (self.detailModel.is_guess!=4)

            
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
//            self.headView.dataSource = dataArray;
            
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
                if (self.detailModel.is_guess==4) {
                    //活动取消
//                    self.resultImgView.image = JCIMAGE(@"ic_spf_cancel");
//                    self.resultImgView.hidden = NO;
                    //赛事取消
                    if ([self.detailModel.is_participate integerValue]==1) {

                        
                        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                        alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
                    //    WeakSelf;
                        [alertView alertTitle:@"活动取消" TitleColor:COLOR_2F2F2F Mesasge:@"由于比赛未能正常进行，活动无法开奖。本次活动取消，十分抱歉！" MessageColor:COLOR_2F2F2F ComfirmTitle:@"关闭" ComfirmColor:JCWhiteColor confirmHandler:^{
                            [alertView removeFromSuperview];
                        }];
                        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
                    }
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
    
    
    [self.tableView registerClass:[JCActivityGuess_SPF_More_MatchCell class] forCellReuseIdentifier:@"JCActivityGuess_SPF_More_MatchCell"];
    [self.tableView registerClass:[JCActivitytTimeCell class] forCellReuseIdentifier:@"JCActivitytTimeCell"];
    
    [self.tableView registerClass:[JCActivityPrizeCell class] forCellReuseIdentifier:@"JCActivityPrizeCell"];
    [self.tableView registerClass:[JCActivityRuleCell class] forCellReuseIdentifier:@"JCActivityRuleCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(76));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = JCWhiteColor;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(76));
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
        
    }];
    

    
    [bottomView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(16));
        make.centerX.equalTo(bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
    }];
    
    [bottomView addSubview:self.resultImgView];
    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(16));
        make.size.mas_equalTo(CGSizeMake(AUTO(76), AUTO(76)));
    }];

    WeakSelf;
    self.headView.JCHeightBlock = ^(float height) {
        weakSelf.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, height);
        weakSelf.tableView.tableHeaderView = weakSelf.headView;
        
    };
    
    self.checkView.JCSureBlock = ^{
        [weakSelf.checkView removeFromSuperview];
        [weakSelf finalSubmit];

        
    };
    

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section==0) {
        return self.detailModel.get_match_info_array.count;
    }
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCActivityGuess_SPF_More_MatchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityGuess_SPF_More_MatchCell"];
        cell.detailModel = self.detailModel;
        cell.matchModel = self.detailModel.get_match_info_array[indexPath.row];
//        cell.dataSource = self.detailModel.activity_option;
        WeakSelf;
        cell.JCSelectBlock = ^{
            weakSelf.selMatchArray = [NSMutableArray array];
            for (JCActivityGuess_SPF_More_MatchModel * matchModel in weakSelf.detailModel.get_match_info_array) {
                if (matchModel.select_btn) {
                    [weakSelf.selMatchArray addObject:matchModel];
                }
            }
            [weakSelf.sureBtn setTitle:[NSString stringWithFormat:@"提交选项  (%ld/%ld)",weakSelf.selMatchArray.count,weakSelf.match_count] forState:0];
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
        JCActivityRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCActivityRuleCell"];
        cell.haveTime = YES;
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

        return 200;
    }
    if (indexPath.section==1) {
        if (self.detailModel.goods_info.count>0) {
            return 144;
        }
        return 0.01f;
        
    }

    return self.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {

        return 0.01f;
    }
    if (section==1) {
        return 0.01f;
    }
//    if (section==1) {
//        if (self.detailModel.goods_info.count>0) {
//            return 12;
//        }
//        return 0.01f;
//    }
    return 8;
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
    
    if (self.selMatchArray.count==0) {
        [JCWToastTool showHint:@"您还未选择任何选项，请选择后再提交！"];
        return;
    }
    
    
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    if (self.selMatchArray.count<self.match_count) {
        JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
        alertView.contentLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
        WeakSelf;
        [alertView alertTitle:@"" TitleColor:COLOR_2F2F2F Mesasge:@"" MessageColor:COLOR_2F2F2F SureTitle:@"仍要提交" SureColor:JCWhiteColor SureHandler:^{
    //
    //            [weakSelf finalSubmitWithDataArray:dataArray];
            [alertView removeFromSuperview];
            [weakSelf showCheckView];
        } CancleTitle:@"知道了" CancleColor:JCBaseColor CancelHandler:^{
           [alertView removeFromSuperview];
        }];
        NSString *title = [NSString stringWithFormat:@"当前活动共有%@场比赛，您只提交了%@场。是否确认提交？",[NSString stringWithFormat:@"%ld",self.match_count],[NSString stringWithFormat:@"%ld",self.selMatchArray.count]];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange count_range = [title rangeOfString:[NSString stringWithFormat:@"%ld",self.selMatchArray.count]];
        if (count_range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:count_range];
        }
        NSRange sel_range = [title rangeOfString:[NSString stringWithFormat:@"%ld",self.match_count]];
        if (sel_range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:sel_range];
        }
        alertView.contentLab.attributedText = attr;
        alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:alertView];
        
        
        
        return;
    }
    [self showCheckView];

    


    


}

- (void)finalSubmit {

    NSString *optionID = @"";
    for (int i=0; i<self.selMatchArray.count; i++) {
        JCActivityGuess_SPF_More_MatchModel *model = self.selMatchArray[i];
        if (i==0) {
            optionID = [NSString stringWithFormat:@"%ld",model.select_btn.tag];
        }else{
            optionID = [NSString stringWithFormat:@"%@,%@",optionID,[NSString stringWithFormat:@"%ld",model.select_btn.tag]];
        }
    }
    JCActivityService *service = [JCActivityService service];
    [service getSubmitJingCaiUserWithActID:self.detailModel.id options:optionID success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCActivityGuessMore_CompleteVC *vc = [JCActivityGuessMore_CompleteVC new];
            vc.actID = self.actID;
//            vc.is_more_spf = YES;
//            vc.matchArray = self.selMatchArray;
//            vc.selectOptionModel = self.selectOptionModel;
//            vc.detailModel = self.detailModel;
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

- (void)showCheckView {
//    NSMutableArray *array = [NSMutableArray array];
//    for (int i=0; i<self.detailModel.activity_option.count; i++) {
//        JCActivityOptionModel *model = self.detailModel.activity_option[i];
//        if ([model.local_choice integerValue]==1) {
//            [array addObject:model];
//        }
//    }
//    self.checkView.dataArray  = array;
    self.checkView.dataArray = self.selMatchArray;;
    [self.jcWindow addSubview:self.checkView];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (JCActivityGuess_SPF_HeadView *)headView {
    if (!_headView) {
        _headView = [JCActivityGuess_SPF_HeadView new];
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

- (JCActivityGuess_SPF_More_CheckView *)checkView {
    if (!_checkView) {
        _checkView = [JCActivityGuess_SPF_More_CheckView new];
        _checkView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _checkView;
}
- (NSMutableArray *)selMatchArray {
    if (!_selMatchArray) {
        _selMatchArray = [NSMutableArray array];
    }
    return _selMatchArray;
}

@end
