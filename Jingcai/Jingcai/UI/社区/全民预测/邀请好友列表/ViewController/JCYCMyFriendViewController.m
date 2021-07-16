//
//  JCYCMyFriendViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCMyFriendViewController.h"
#import "JCYCFriendCell.h"
#import "JCYCFriendRuleCell.h"
#import "JCYCFriendHeadView.h"
#import "JCYuceShareInfoModel.h"
#import "JCInviteCodeInfoModel.h"
#import "JCTitleBannerModel.h"
#import "JCYCInviteShareVC.h"
#import "JCYCHongbaoChaiView.h"
#import "JCYCHongbaoInfoView.h"
#import "JCYCHongBaoWMVC.h"
#import "JCJingCaiHongbaoModel.h"
@interface JCYCMyFriendViewController ()

@property (nonatomic,strong)JCYCFriendHeadView *headView;

@property (nonatomic,strong) JCYuceShareInfoModel *shareInfoModel;

@property (nonatomic,strong) NSArray <JCInviteCodeInfoModel*>*inviteArray;

@property (nonatomic,strong) NSArray <JCTitleBannerModel*>*prizeArray;





@end

@implementation JCYCMyFriendViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImgWhiteColor];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor purpleColor];
    [self initViews];
    [self refreshData];
}


- (void)refreshData {
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New new];
    [service getMyInviteFriendListWithPage_size:@"100" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.shareInfoModel = (JCYuceShareInfoModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCYuceShareInfoModel class]];
            self.headView.model = self.shareInfoModel;
            self.inviteArray = [NSArray yy_modelArrayWithClass:[JCInviteCodeInfoModel class] json:object[@"data"][@"share"]];
            self.prizeArray = [NSArray yy_modelArrayWithClass:[JCTitleBannerModel class] json:object[@"data"][@"radio"]];
            self.headView.titleArray = self.prizeArray;

            [self.tableView reloadData];


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

 

}



- (void)initViews {
    // gradient

    
    UIView *bgView = [UIView new];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-AUTO(80)-kBottomTabSafeAreaHeight);
    [self.view insertSubview:bgView atIndex:0];
    bgView.backgroundColor = COLOR_F75050;
    
//    CAGradientLayer *gl = [CAGradientLayer layer];
//    gl.frame = CGRectMake(0,0,SCREEN_WIDTH,SCREEN_HEIGHT);
//    gl.startPoint = CGPointMake(0.7, 0.13);
//    gl.endPoint = CGPointMake(0, 0.36);
//    gl.colors = @[(__bridge id)[UIColor colorWithRed:164/255.0 green:1/255.0 blue:214/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:110/255.0 green:4/255.0 blue:216/255.0 alpha:1.0].CGColor];
//    gl.locations = @[@(0), @(1.0f)];
//    bgView.layer.cornerRadius = 8;
//    [bgView.layer addSublayer:gl];

    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 200;
    [self.tableView registerClass:[JCYCFriendCell class] forCellReuseIdentifier:@"JCYCFriendCell"];
    [self.tableView registerClass:[JCYCFriendRuleCell class] forCellReuseIdentifier:@"JCYCFriendRuleCell"];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.offset(-kBottomTabSafeAreaHeight-AUTO(80));
    }];
    
    
    
    
    self.headView = [JCYCFriendHeadView new];
    self.headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kNavigationBarHeight+520);
    self.tableView.tableHeaderView = self.headView;
    
    UIView *bottomView = [UIView new];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = [COLOR_870202 colorWithAlphaComponent:0.16];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom);
    }];
    
//    CAGradientLayer *gl1 = [CAGradientLayer layer];
//    gl1.frame = CGRectMake(0,0,SCREEN_WIDTH,kBottomTabSafeAreaHeight+AUTO(80));
//    gl1.startPoint = CGPointMake(1, -1.97);
//    gl1.endPoint = CGPointMake(0.03, 1.94);
//    gl1.colors = @[(__bridge id)[UIColor colorWithRed:210/255.0 green:10/255.0 blue:119/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:101/255.0 green:19/255.0 blue:222/255.0 alpha:1.0].CGColor];
//    gl1.locations = @[@(0), @(1.0f)];
//    bottomView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2].CGColor;
//    bottomView.layer.shadowOffset = CGSizeMake(0,-2);
//    bottomView.layer.shadowOpacity = 1;
//    bottomView.layer.shadowRadius = 4;
//    [bottomView.layer addSublayer:gl1];
    
    
 
//    inviteBtn.backgroundColor = COLOR_FBAD54;
    
    
    UIView *bottomGlView = [UIView new];
    bottomGlView.frame = CGRectMake(16,16,SCREEN_WIDTH-32,44);
    [bottomGlView hg_setAllCornerWithCornerRadius:22];
    [bottomView addSubview:bottomGlView];
    // gradient
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,SCREEN_WIDTH-32,44);
    gl.startPoint = CGPointMake(0.5, 0);
    gl.endPoint = CGPointMake(0.5, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:251/255.0 green:216/255.0 blue:80/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:251/255.0 green:173/255.0 blue:84/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0), @(1.0f)];
    [bottomGlView.layer addSublayer:gl];
//    [inviteBtn setBackgroundImage:JCIMAGE(@"me_invite_btn") forState:0];
//    [inviteBtn setBackgroundImage:JCIMAGE(@"me_invite_btn") forState:UIControlStateHighlighted];
    UIButton *inviteBtn = [UIButton initWithText:@"立即邀请" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:COLOR_713A08];
    [inviteBtn hg_setAllCornerWithCornerRadius:44];
    [bottomGlView addSubview:inviteBtn];
    inviteBtn.frame = CGRectMake(0,0,SCREEN_WIDTH-32,44);
//    [inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.top.offset(AUTO(15));
//        make.height.mas_equalTo(AUTO(44));
//    }];
    
    
    WeakSelf;
    self.headView.JCInviteBlock = ^{
        JCYCInviteShareVC *vc = [JCYCInviteShareVC new];
        vc.infoModel = weakSelf.shareInfoModel;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    

    
    [inviteBtn bk_whenTapped:^{
        JCYCInviteShareVC *vc = [JCYCInviteShareVC new];
        vc.infoModel = weakSelf.shareInfoModel;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    
    self.headView.JCChaiBlock = ^{
        [weakSelf chaiHongbaoResult];
//        JCYCHongbaoChaiView *view = [JCYCHongbaoChaiView new];
//        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        [[UIApplication sharedApplication].keyWindow addSubview:view];
//        @weakify(view);
//        view.JCChaiBlock = ^{
//            @strongify(view);
//            [view removeFromSuperview];
//            JCYCHongbaoInfoView *chaiResultView = [JCYCHongbaoInfoView new];
//            chaiResultView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//            [[UIApplication sharedApplication].keyWindow addSubview:chaiResultView];
//            @weakify(chaiResultView);
//            chaiResultView.JCGoHongbaoBlock = ^{
//                @strongify(chaiResultView);
//                [chaiResultView removeFromSuperview];
//                [weakSelf.navigationController pushViewController:[JCYCHongBaoWMVC new] animated:YES];
//            };
//        };
        
    };
}



#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return self.inviteArray.count>0?1:0;
    }
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCYCFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCFriendCell"];
        cell.backgroundColor = JCClearColor;
        cell.dataArray = [NSMutableArray arrayWithArray:self.inviteArray];
        return cell;;
    }
    JCYCFriendRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCYCFriendRuleCell"];
    cell.backgroundColor = JCClearColor;
    return cell;
}

#pragma mark <UITableViewDelegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        if (self.inviteArray.count==0) {
            return 0;
        }
        return AUTO(50)*self.inviteArray.count+AUTO(70);
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
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

- (void)chaiHongbaoResult {
    [self.view showLoading];
    JCUserService_New *service = [JCUserService_New new];
    [service getMyInviteFriendChaiHongbaoWithsuccess:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if ([object[@"data"] isKindOfClass:[NSNull class]]) {
                return;
            }
            NSLog(@"拆红包数据%@",object);
            JCJingCaiHongbaoModel *model = (JCJingCaiHongbaoModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCJingCaiHongbaoModel class]];
            NSString *cjCount = object[@"data"][@"remaining_times"];
            self.shareInfoModel.cjCount = [NSString stringWithFormat:@"%@",cjCount];//同步剩余抽奖次数
            self.headView.model = self.shareInfoModel;
            WeakSelf;   
            JCYCHongbaoInfoView *chaiResultView = [JCYCHongbaoInfoView new];
            chaiResultView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            chaiResultView.model = model;
            [[UIApplication sharedApplication].keyWindow addSubview:chaiResultView];
            @weakify(chaiResultView);
            chaiResultView.JCGoHongbaoBlock = ^{
                @strongify(chaiResultView);
                [chaiResultView removeFromSuperview];
                [weakSelf.navigationController pushViewController:[JCYCHongBaoWMVC new] animated:YES];
            };
            
            
            
            
//            self.topHeadView.model = model;
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];


}

@end
