//
//  JCBasketBallMatchZhiShuVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchZhiShuVC.h"
#import "JCBasketBallMatchZhiShuRFVC.h"
#import "JCBasketBallMatchZhiShuSFVC.h"
#import "JCBasketBallMatchZhiShuZFVC.h"
@interface JCBasketBallMatchZhiShuVC ()<LMJTabDelegate>

@property (nonatomic,strong) JCBasketBallMatchZhiShuRFVC *rfVC;

@property (nonatomic,strong) JCBasketBallMatchZhiShuSFVC *sfVC;

@property (nonatomic,strong) JCBasketBallMatchZhiShuZFVC *zfVC;

@property (nonatomic,strong) UIScrollView * scrollView;

@end

@implementation JCBasketBallMatchZhiShuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubViews];

}

- (void)initSubViews {
    self.view.backgroundColor = COLOR_F0F0F0;
    NSMutableArray *titleArray = [NSMutableArray array];
    [titleArray addObject:NonNil(@"让分")];
    [titleArray addObject:NonNil(@"胜负")];
    [titleArray addObject:NonNil(@"总分")];
//    float start = SCREEN_WIDTH/2.0f-AUTO(77)*titleArray.count/2.0f;
    self.tabSegment = [[LMJTab alloc] initWithFrame:CGRectMake(0, 10, 75*3, 30) lineWidth:1 lineColor:COLOR_F0F0F0];
//        self.tabSegment.hidden = YES;
    [self.tabSegment setItemsWithTitle:titleArray normalItemColor:JCWhiteColor selectItemColor:JCBaseColor normalTitleColor:COLOR_2F2F2F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0];
    self.tabSegment.layer.cornerRadius = 5.0;
    self.tabSegment.delegate = self;
    self.tabSegment.centerX = self.view.centerX;
    [self.view addSubview:self.tabSegment];
    
    self.scrollView.frame = CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT-50-kNavigationBarHeight-44-kBottomTabSafeAreaHeight);
    [self.view addSubview:self.scrollView];
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(0);
//        make.top.equalTo(self.tabSegment.mas_bottom).offset(10);
//        make.width.mas_equalTo(SCREEN_WIDTH);
//        make.bottom.offset(0);
//    }];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3,   self.scrollView.height);
    
    
    self.rfVC.matchBall = self.matchBall;
    self.sfVC.matchBall = self.matchBall;
    self.zfVC.matchBall = self.matchBall;

    [self.scrollView addSubview:self.rfVC.view];
    [self.scrollView addSubview:self.sfVC.view];
    [self.scrollView addSubview:self.zfVC.view];
    
    self.rfVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.scrollView.height);
    self.sfVC.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH,  self.scrollView.height);
    self.zfVC.view.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH,  self.scrollView.height);
    
}

-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    CGFloat pageW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(pageW*number, 0) animated:YES];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}

- (JCBasketBallMatchZhiShuRFVC *)rfVC {
    if (!_rfVC) {
        _rfVC = [JCBasketBallMatchZhiShuRFVC new];
    }
    return _rfVC;
}

- (JCBasketBallMatchZhiShuSFVC *)sfVC {
    if (!_sfVC) {
        _sfVC = [JCBasketBallMatchZhiShuSFVC new];
    }
    return _sfVC;
}

- (JCBasketBallMatchZhiShuZFVC *)zfVC {
    if (!_zfVC) {
        _zfVC = [JCBasketBallMatchZhiShuZFVC new];
    }
    return _zfVC;
}

@end
