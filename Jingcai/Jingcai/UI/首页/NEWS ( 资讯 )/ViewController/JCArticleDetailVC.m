//
//  JCArticleDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCArticleDetailVC.h"
#import "JCArticleDetailContentCell.h"
#import "JCArticleDetailHeadViewCell.h"
#import "JCWNewsDetailBall.h"
#import "JCShareView.h"
#import "JCBaseTitleAlertView.h"
#import "JCFanganSaleOut_BuyCell.h"
@interface JCArticleDetailVC ()

@property (nonatomic, strong) UIView *bottomView;

@property (strong, nonatomic) UIButton *shareBtn;

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *shareImgView;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UILabel *shareLab;

@property (strong, nonatomic) UILabel *likeLab;

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,assign) float cellHeight;

@property (strong, nonatomic) JCWNewsDetailBall * newsDetailBall;

@property (nonatomic,assign) BOOL is_saleOut;//已下架

@end

@implementation JCArticleDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"文章详情";
    [self initViews];
    [self loadNewsDetailData];
    [self browseArticle];//增加浏览记录
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadNewsDetailData) name:@"JCDaShangSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getMyUserInfo) name:@"JCDaShangSuccess" object:nil];
}

- (void)loadNewsDetailData {
    [self.view showLoading];
    JCHomeService_New * service = [JCHomeService_New service];
    [service getArticleDetailWithId:self.articalId Success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            [self.view endLoading];
            self.newsDetailBall = (JCWNewsDetailBall *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCWNewsDetailBall class]];
            if (self.newsDetailBall.status==8) {
                self.is_saleOut = YES;
                self.bottomView.hidden = YES;
            }
            [self.tableView reloadData];
            self.likeLab.text = [self.newsDetailBall.dz_number integerValue]>0?self.newsDetailBall.dz_number:@"点赞";
            self.likeImgView.image = self.newsDetailBall.is_good==1?JCIMAGE(@"daka_icon_dz"):JCIMAGE(@"daka_icon_dz_un");
            

            
            self.shareView.title = self.newsDetailBall.wechat_share.share_title;
            self.shareView.content = self.newsDetailBall.wechat_share.share_desc;
            self.shareView.desc = self.newsDetailBall.wechat_share.share_desc;
            self.shareView.webPageUrl =self.newsDetailBall.wechat_share.share_url;
            self.shareView.friend_url =self.newsDetailBall.wechat_share.friend_url;
            
            return ;
        }
    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
        [JCWToastTool showHint:@"网络异常"];
    }];

}

- (void)initViews {
    self.tableView.separatorStyle = 0;
    self.tableView.estimatedRowHeight = 100;
    [self.tableView registerClass:[JCArticleDetailContentCell class] forCellReuseIdentifier:@"JCArticleDetailContentCell"];
    [self.tableView registerClass:[JCArticleDetailHeadViewCell class] forCellReuseIdentifier:@"JCArticleDetailHeadViewCell"];
    [self.tableView registerClass:[JCFanganSaleOut_BuyCell class] forCellReuseIdentifier:@"JCFanganSaleOut_BuyCell"];
    
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-49-kBottomTabSafeAreaHeight);
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(49+kBottomTabSafeAreaHeight);
    }];
//    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-49-kBottomTabSafeAreaHeight-kNavigationBarHeight, SCREEN_WIDTH, 49+kBottomTabSafeAreaHeight);
    self.bottomView.layer.shadowColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:0.5].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,-1);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 1.5;
    
    [self.bottomView addSubview:self.likeBtn];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/2.0f, 49));
    }];
    
    [self.bottomView addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/2.0f, 49));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_979797;
    [self.bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bottomView);
        make.centerY.equalTo(self.likeBtn);
        make.size.mas_equalTo(CGSizeMake(0.5, 20));
    }];
    
    [self.likeBtn addSubview:self.likeImgView];
    [self.likeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(65));
        make.centerY.equalTo(self.likeBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(24)));
    }];
    [self.likeBtn addSubview:self.likeLab];
    [self.likeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.likeBtn);
        make.left.equalTo(self.likeImgView.mas_right).offset(AUTO(5));
    }];
    
    [self.shareBtn addSubview:self.shareImgView];
    [self.shareImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView.mas_centerX).offset(AUTO(65));
        make.centerY.equalTo(self.shareBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(24)));
    }];
    
    [self.shareBtn addSubview:self.shareLab];
    [self.shareLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.shareBtn);
        make.left.equalTo(self.shareImgView.mas_right).offset(AUTO(5));
    }];

    WeakSelf;
    [self.shareBtn bk_whenTapped:^{
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

    }];
    
}

#pragma mark - Protocol
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        return UITableViewAutomaticDimension;
    }
    if(self.is_saleOut&&indexPath.row==1){
        return UITableViewAutomaticDimension;
    }
    return self.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0) {
        JCArticleDetailHeadViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCArticleDetailHeadViewCell"];
        cell.newsDetailBall = self.newsDetailBall;
//        cell.newsDetailBall = self.newsDetailBall;
        WeakSelf;
        cell.JCConcernBlock = ^{
            [weakSelf concernTuiJianWithModel:self.newsDetailBall.user_id];
        };
        return cell;
    }
    if (self.is_saleOut) {
        JCFanganSaleOut_BuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCFanganSaleOut_BuyCell"];
        cell.is_wz = YES;
        return cell;
            }

    JCArticleDetailContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JCArticleDetailContentCell"];
    WeakSelf;
    cell.JCRefreshBlock = ^(float height) {
        weakSelf.cellHeight = height;
        [weakSelf.tableView reloadData];
    };
    cell.newsDetailBall = self.newsDetailBall;
    return cell;

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [UIView new];
    if (section==0) {
        headView.backgroundColor = COLOR_F0F0F0;
    }else{
        headView.backgroundColor = JCWhiteColor;
    }
    
    
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return AUTO(8);
    }
    return 0.001f;
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (UITableViewCell *cell in self.tableView.visibleCells) {
        if ([cell isKindOfClass:[JCArticleDetailContentCell class]]) {
            JCArticleDetailContentCell *contentCell = (JCArticleDetailContentCell *)cell;
            [contentCell.webView setNeedsLayout];
            
        }
    }
}

- (void)concernTuiJianWithModel:(NSString *)user_id{
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
 
    [self.view showLoading];
    JCHomeService_New * service = [JCHomeService_New service];
    [service gzUserWithId:user_id type:@"2" success:^(id  _Nullable object) {
        [self endRefresh];
        if ([JCWJsonTool isSuccessResponse:object]) {
            //1是未关注.2是已关注
            NSString *status = [NSString stringWithFormat:@"%@",object[@"data"][@"status"]];
            self.newsDetailBall.is_subscribe = [status integerValue]==2?@"已关注":@"关注";
//            model.fensi = object[@"data"][@"fensi"];
            [self.tableView reloadData];
//            [weakSelf.tableView reloadData];

        }
    } failure:^(NSError * _Nonnull error) {
        [self endRefresh];
    }];

}
- (void)likeBtnClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    [self.view showLoading];
    JCHomeService_New * service = [JCHomeService_New service];
    [service getArticleBrowseWithId:self.articalId article_cate:@"3" type:@"1" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_good = object[@"data"][@"is_good"];
            self.newsDetailBall.is_good = [is_good integerValue];
            self.newsDetailBall.dz_number= [NSString stringWithFormat:@"%@",object[@"data"][@"dz_number"]];
            self.likeLab.text = [self.newsDetailBall.dz_number integerValue]>0?self.newsDetailBall.dz_number:@"点赞";
            self.likeImgView.image = self.newsDetailBall.is_good==1?JCIMAGE(@"daka_icon_dz"):JCIMAGE(@"daka_icon_dz_un");

        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}
//浏览文章
- (void)browseArticle {
    JCHomeService_New * service = [JCHomeService_New service];
    [service getArticleBrowseWithId:self.articalId article_cate:@"3" type:@"2" success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {

        }
    } failure:^(NSError * _Nonnull error) {
        
    }];

}


- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _shareBtn;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
        [_likeBtn addTarget:self action:@selector(likeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}

- (UIImageView *)shareImgView {
    if (!_shareImgView) {
        _shareImgView = [UIImageView new];
        _shareImgView.image = JCIMAGE(@"daka_icon_fx");
    }
    return _shareImgView;
}

- (UILabel *)shareLab {
    if (!_shareLab) {
        _shareLab = [UILabel initWithTitle:@"分享" andFont:AUTO(16) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _shareLab;
}

- (UIImageView *)likeImgView {
    if (!_likeImgView) {
        _likeImgView = [UIImageView new];
        _likeImgView.image = JCIMAGE(@"daka_icon_dz_un");//daka_icon_dz
    }
    return _likeImgView;
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [UILabel initWithTitle:@"点赞" andFont:AUTO(16) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
}
- (JCShareView *)shareView {
    if (!_shareView) {
        _shareView = [JCShareView viewFromXib];
        _shareView.titleString = @"分享方案";
        _shareView.image = JCIMAGE(@"icon_app");
    }
    return _shareView;
}
@end
