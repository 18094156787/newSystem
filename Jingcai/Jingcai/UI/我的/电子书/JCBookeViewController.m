//
//  JCBookeViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBookeViewController.h"
#import <SJVideoPlayer.h>
//#define SourceURL0 [NSURL URLWithString:@"https://dh2.v.netease.com/2017/cg/fxtpty.mp4"]
#define SourceURL0 [NSURL URLWithString:@"http://cdn.yixinzuqiu.com/static/jctzsc.mp4"]



@interface JCBookeViewController ()

@property (nonatomic,strong) UIView *playerContainerView;

@property (nonatomic, strong) SJVideoPlayer *player;

@property (nonatomic, strong) UIScrollView *scrollowView;

@property (nonatomic, strong) UIImageView *infoImgView;

@property (nonatomic, strong) UIButton *playerBtn;

@end

@implementation JCBookeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    self.navigationController.navigationBarHidden = NO;
    [self setNavBackImg];

}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_player vc_viewDidAppear];
#ifdef DEBUG
    NSLog(@"AA: %d - %s", (int)__LINE__, __func__);
#endif
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleRed;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [_player vc_viewWillDisappear];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [_player vc_viewDidDisappear];
#ifdef DEBUG
        NSLog(@"AA: %d - %s", (int)__LINE__, __func__);
#endif
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = JCWhiteColor;
    [self initViews];
    [self setupViews];
}

- (void)initViews {
    
    UIImageView *imgBgView = [UIImageView new];
//    imgBgView.image = JCIMAGE(@"mine_top_bg");
    [self.view addSubview:imgBgView];
    [imgBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(-kNavigationBarHeight);
        make.height.mas_equalTo(AUTO(190));
    }];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.right.offset(AUTO(-10));
        make.top.offset(AUTO(5));
        make.height.mas_equalTo(AUTO(250));
    }];
    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 8;
    bgView.layer.shadowColor = [UIColor colorWithRed:178/255.0 green:186/255.0 blue:205/255.0 alpha:0.5].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,0);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 9;
//    bgView.layer.masksToBounds = YES;
    
    [self.playerContainerView hg_setCornerOnTopWithRadius:8];
    [bgView addSubview:self.playerContainerView];
    float width = SCREEN_WIDTH-AUTO(20);
//    self.playerContainerView.frame = CGRectMake(AUTO(15), 0, SCREEN_WIDTH-AUTO(30), AUTO(190));
    [self.playerContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.mas_equalTo(width*9/16);
//        make.bottom.offset(AUTO(-50));
    }];
    

    [self.view addSubview:self.playerBtn];
    [self.playerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.self.playerContainerView);

    }];
    
    UIView *bottomView= [UIView new];
    [bgView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(bgView);
        make.top.equalTo(self.playerContainerView.mas_bottom);
    }];
    
    UILabel *introduceLab = [UILabel initWithTitle:@"鲸猜学院进阶手册" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bottomView addSubview:introduceLab];
    [introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(bottomView);
    }];

    UIButton *detailBtn = [UIButton initWithText:@"立即查看pdf" FontSize:AUTO(14) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
    [detailBtn hg_setAllCornerWithCornerRadius:AUTO(24.5)];
    [bottomView addSubview:detailBtn];
    [detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(32)));
    }];
    [detailBtn addTarget:self action:@selector(detailBtnClick) forControlEvents:UIControlEventTouchUpInside];


    
    [self.view addSubview:self.scrollowView];
    [self.scrollowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.view);
        make.top.equalTo(bgView.mas_bottom).offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];

    self.infoImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(790));
    [self.scrollowView addSubview:self.infoImgView];

}

- (void)setupViews {
    self.title = @"鲸猜学院";
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _player = [SJVideoPlayer player];
    _player.defaultEdgeControlLayer.showResidentBackButton = NO;
    _player.defaultEdgeControlLayer.hiddenBackButtonWhenOrientationIsPortrait = YES; // 竖屏时,
    _player.pausedToKeepAppearState = YES;
    _player.controlLayerAppearManager.interval = 5; // 设置控制层隐藏间隔
    _player.resumePlaybackWhenAppDidEnterForeground = YES;
    _player.autoplayWhenSetNewAsset = NO;//自动播放
    _player.presentView.backgroundColor= JCWhiteColor;
    _player.presentView.placeholderImageView.image = JCIMAGE(@"web_introduce");
    _player.hiddenPlaceholderImageViewWhenPlayerIsReadyForDisplay = NO;
    WeakSelf;
    _player.playbackObserver.timeControlStatusDidChangeExeBlock = ^(__kindof SJBaseVideoPlayer * _Nonnull player) {
//        NSLog(@"%ld",player.timeControlStatus);
        if (player.timeControlStatus==0) {
            weakSelf.playerBtn.hidden = NO;
        }else{
            weakSelf.player.presentView.placeholderImageView.image = JCIMAGE(@"");
            weakSelf.playerBtn.hidden = YES;
        }
        
        
    };
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"book" ofType:@"mp4"];
    NSString *url_str = [JCConfigModel currentConfigModel].get_jctzsc;
    NSURL *url = [NSURL URLWithString:NonNil(url_str)];
    SJVideoPlayerURLAsset *asset = [[SJVideoPlayerURLAsset alloc] initWithURL:url];//SourceURL0
//    [NSURL URLWithString:@"https://tracker.namitiyu.com/zh/football?profile=YO0kUPHJ4faHB&id=3438865"]
    
//
//
    asset.startPosition = 0;

    _player.URLAsset = asset;

    [_playerContainerView addSubview:_player.view];
    [_player.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];

}

- (void)playerBtnClick {
    [self.player play];
}

- (UIView *)playerContainerView {
    if (!_playerContainerView) {
        _playerContainerView = [UIView new];
    }
    return _playerContainerView;
}

- (void)detailBtnClick {
    WebViewController *vc = [WebViewController new];
    vc.titleStr = @"鲸猜学院进阶手册";
    NSString *url = [JCConfigModel currentConfigModel].get_tz;
    vc.urlStr = url;
//    @"http://cdn.yixinzuqiu.com/static/%E8%B6%B3%E7%90%83%E7%AB%9E%E7%8C%9C%E7%BD%91%E7%AB%9E%E5%BD%A9%E6%8A%95%E6%B3%A8%E6%89%8B%E5%86%8C.pdf"
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:^{
//
//    }];
}

- (UIImageView *)infoImgView {
    if (!_infoImgView) {
        _infoImgView = [UIImageView new];
        _infoImgView.image = JCIMAGE(@"book_img_js");
    }
    return _infoImgView;
}

- (UIScrollView *)scrollowView {
    if (!_scrollowView) {
        _scrollowView = [UIScrollView new];
        _scrollowView.contentSize = CGSizeMake(SCREEN_WIDTH, AUTO(800));
    }
    return _scrollowView;
}

- (UIButton *)playerBtn {
    if (!_playerBtn) {
        _playerBtn = [UIButton new];
        [_playerBtn setImage:JCIMAGE(@"book_ic_bf") forState:0];
        [_playerBtn setImage:JCIMAGE(@"book_ic_bf") forState:UIControlStateHighlighted];
        [_playerBtn addTarget:self action:@selector(playerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playerBtn;
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
