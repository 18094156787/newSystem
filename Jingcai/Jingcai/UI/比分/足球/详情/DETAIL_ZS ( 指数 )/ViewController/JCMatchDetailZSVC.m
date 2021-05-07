//
//  JCMatchDetailZSVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/26.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchDetailZSVC.h"
#import "JCWJsonTool.h"
#import "JNMatchZS_JCViewController.h"
#import "JNMatchZS_BDViewController.h"
#import "JNMatchZS_OPViewController.h"
#import "JNMatchZS_YPViewController.h"
#import "JNMatchZS_JQSViewController.h"
#import "UISegmentedControl+Extension.h"
@interface JCMatchDetailZSVC ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView * scrollView;

@property (strong, nonatomic) UISegmentedControl * segControl;

@property (strong, nonatomic) JNMatchZS_JCViewController * jcVC;
@property (strong, nonatomic) JNMatchZS_BDViewController * bdVC;
@property (strong, nonatomic) JNMatchZS_OPViewController * opVC;
@property (strong, nonatomic) JNMatchZS_YPViewController * ypVC;
@property (strong, nonatomic) JNMatchZS_JQSViewController * jqsVC;
@property (strong, nonatomic) NSArray * vcArr;

@end

@implementation JCMatchDetailZSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    [self loadDataWithMatchNum:self.matchBall type:1];
}

- (void)initViews {
    self.segControl.hidden = YES;
    self.segControl.frame = CGRectMake(0, 12, 200, 29);
    self.segControl.centerX = self.view.centerX;
    [self.view addSubview:self.segControl];
    
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT-50);
    self.scrollView.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_F0F0F0;
    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} forState:UIControlStateNormal];
    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:JCWhiteColor} forState:UIControlStateSelected];
    [self.segControl setTintColor:JCBaseColor normalColor:COLOR_2F2F2F];
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

}


//- (void)setMatchBall:(JCWMatchBall *)matchBall {
//    if (!matchBall) {
//        return;
//    }
//    _matchBall = matchBall;
//    [self loadDataWithMatchNum:matchBall type:0];
//
//}


- (void)loadDataWithMatchNum:(JCMatchBall *)matchBall type:(NSInteger)type {
    //让4个VC分别去加载

    self.opVC.matchNum = matchBall.id;
    self.ypVC.matchNum = matchBall.id;
    self.jqsVC.matchNum = matchBall.id;

    
    CGFloat scrollW = self.scrollView.width;
    CGFloat scrollH = self.scrollView.bounds.size.height-AUTO(120)-kBottomTabSafeAreaHeight;

//    self.isJingCai = YES;
//    self.isBeiDan = YES;
    [self.segControl removeAllSegments];
    
//    matchBall.is_guess = 1;
//    matchBall.is_bd = 1;
    NSMutableArray *titleArray = [NSMutableArray array];
    if (matchBall.is_guess>0&&matchBall.is_bd>0) {
        [self.jcVC loadDataWithMatchNum:matchBall.id type:type];
        [self.bdVC loadDataWithMatchNum:matchBall.id type:type];
        
        self.segControl.frame = CGRectMake(0, 12, AUTO(300), 29);
        [self.segControl insertSegmentWithTitle:@"竞足" atIndex:0 animated:NO];
        [self.segControl insertSegmentWithTitle:@"北单" atIndex:1 animated:NO];
        [self.segControl insertSegmentWithTitle:@"欧指" atIndex:2 animated:NO];
        [self.segControl insertSegmentWithTitle:@"亚指" atIndex:3 animated:NO];
         [self.segControl insertSegmentWithTitle:@"进球数" atIndex:4 animated:NO];
        
        [titleArray addObject:@"竞足"];
        [titleArray addObject:@"北单"];
        [titleArray addObject:@"欧指"];
        [titleArray addObject:@"亚指"];
        [titleArray addObject:@"进球数"];

        [self.scrollView addSubview:self.jcVC.view];
        [self.scrollView addSubview:self.bdVC.view];
        [self.scrollView addSubview:self.opVC.view];
        [self.scrollView addSubview:self.ypVC.view];
        [self.scrollView addSubview:self.jqsVC.view];
        self.vcArr = @[self.jcVC,self.bdVC,self.opVC,self.ypVC,self.jqsVC];
        self.scrollView.contentSize = CGSizeMake(scrollW*5, scrollH);
        self.jcVC.view.frame = CGRectMake(scrollW*0, 0, scrollW, scrollH);
        self.bdVC.view.frame = CGRectMake(scrollW*1, 0, scrollW, scrollH);
        self.opVC.view.frame = CGRectMake(scrollW*2, 0, scrollW, scrollH);
        self.ypVC.view.frame = CGRectMake(scrollW*3, 0, scrollW, scrollH);
        self.jqsVC.view.frame = CGRectMake(scrollW*4, 0, scrollW, scrollH);
    }else if(matchBall.is_guess>0){
        [self.jcVC loadDataWithMatchNum:matchBall.id type:type];
      
        
        self.segControl.frame = CGRectMake(0, 12, AUTO(240), 29);
        [self.segControl insertSegmentWithTitle:@"竞足" atIndex:0 animated:NO];
        [self.segControl insertSegmentWithTitle:@"欧指" atIndex:1 animated:NO];
        [self.segControl insertSegmentWithTitle:@"亚指" atIndex:2 animated:NO];
        [self.segControl insertSegmentWithTitle:@"进球数" atIndex:3 animated:NO];
        
        [titleArray addObject:@"竞足"];
        [titleArray addObject:@"欧指"];
        [titleArray addObject:@"亚指"];
        [titleArray addObject:@"进球数"];
        
        
        [self.scrollView addSubview:self.jcVC.view];
        [self.scrollView addSubview:self.opVC.view];
        [self.scrollView addSubview:self.ypVC.view];
        [self.scrollView addSubview:self.jqsVC.view];
        self.vcArr = @[self.jcVC,self.opVC,self.ypVC,self.jqsVC];
        self.scrollView.contentSize = CGSizeMake(scrollW*4, scrollH);
        self.jcVC.view.frame = CGRectMake(scrollW*0, 0, scrollW, scrollH);
        self.opVC.view.frame = CGRectMake(scrollW*1, 0, scrollW, scrollH);
        self.ypVC.view.frame = CGRectMake(scrollW*2, 0, scrollW, scrollH);
        self.jqsVC.view.frame = CGRectMake(scrollW*3, 0, scrollW, scrollH);
    }else if(matchBall.is_bd>0){
        [self.bdVC loadDataWithMatchNum:matchBall.id type:type];
        self.segControl.frame = CGRectMake(0, 12, AUTO(240), 29);
        [self.segControl insertSegmentWithTitle:@"北单" atIndex:0 animated:NO];
        [self.segControl insertSegmentWithTitle:@"欧指" atIndex:1 animated:NO];
        [self.segControl insertSegmentWithTitle:@"亚指" atIndex:2 animated:NO];
        [self.segControl insertSegmentWithTitle:@"进球数" atIndex:3 animated:NO];
        
        [titleArray addObject:@"北单"];
        [titleArray addObject:@"欧指"];
        [titleArray addObject:@"亚指"];
        [titleArray addObject:@"进球数"];
        
        
        [self.scrollView addSubview:self.bdVC.view];
        [self.scrollView addSubview:self.opVC.view];
        [self.scrollView addSubview:self.ypVC.view];
        [self.scrollView addSubview:self.jqsVC.view];
        self.vcArr = @[self.jcVC,self.opVC,self.ypVC,self.jqsVC];
        self.scrollView.contentSize = CGSizeMake(scrollW*4, scrollH);
        self.bdVC.view.frame = CGRectMake(scrollW*0, 0, scrollW, scrollH);
        self.opVC.view.frame = CGRectMake(scrollW*1, 0, scrollW, scrollH);
        self.ypVC.view.frame = CGRectMake(scrollW*2, 0, scrollW, scrollH);
        self.jqsVC.view.frame = CGRectMake(scrollW*3, 0, scrollW, scrollH);
    }else {
        self.segControl.frame = CGRectMake(0, 12, AUTO(180), 29);
        [self.segControl insertSegmentWithTitle:@"欧指" atIndex:0 animated:NO];
        [self.segControl insertSegmentWithTitle:@"亚指" atIndex:1 animated:NO];
        [self.segControl insertSegmentWithTitle:@"进球数" atIndex:2 animated:NO];
        

        [titleArray addObject:@"欧指"];
        [titleArray addObject:@"亚指"];
        [titleArray addObject:@"进球数"];
        
        
//        [self.scrollView addSubview:self.jcVC.view];
        [self.scrollView addSubview:self.opVC.view];
        [self.scrollView addSubview:self.ypVC.view];
        [self.scrollView addSubview:self.jqsVC.view];
        self.vcArr = @[self.opVC,self.ypVC,self.jqsVC];
        self.scrollView.contentSize = CGSizeMake(scrollW*3, scrollH);
        self.opVC.view.frame = CGRectMake(scrollW*0, 0, scrollW, scrollH);
        self.ypVC.view.frame = CGRectMake(scrollW*1, 0, scrollW, scrollH);
        self.jqsVC.view.frame = CGRectMake(scrollW*2, 0, scrollW, scrollH);
    }
    
    self.segControl.selectedSegmentIndex = 0;
//    self.segControl.frame = CGRectMake(0, 12, 200, 29);
    self.segControl.centerX = self.view.centerX;
    
    self.tabSegment = [[LMJTab alloc] initWithFrame:CGRectMake(0, 10, 300, 30) lineWidth:1 lineColor:COLOR_F0F0F0];
//        self.tabSegment.hidden = YES;
    [self.tabSegment setItemsWithTitle:titleArray normalItemColor:JCWhiteColor selectItemColor:JCBaseColor normalTitleColor:COLOR_2F2F2F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0];
    self.tabSegment.layer.cornerRadius = 5.0;
    self.tabSegment.delegate = self;
    self.tabSegment.centerX = self.view.centerX;
    [self.view addSubview:self.tabSegment];

}

-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    CGFloat pageW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(pageW*number, 0) animated:YES];
}

- (void)segSelected:(UISegmentedControl *)segmentControl {
    CGFloat scrollW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(scrollW * segmentControl.selectedSegmentIndex, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat floatIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
//    NSInteger intIndex = (NSInteger)floatIndex;
//    if (floatIndex - intIndex > 0) {
//            return ;
//    }
//    if (self.needReturnHeightBlock) {
//        self.needReturnHeightBlock([self contentH]);
//    }
//    self.scrollView.contentSize = CGSizeMake(SCREEN_HEIGHT, [self contentH]);
    
    NSLog(@"%.0f---%.0f",SCREEN_WIDTH,self.scrollView.contentSize.width);
}

#pragma mark - Override
- (CGFloat)contentH {
    CGFloat floatIndex = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    NSInteger intIndex = (NSInteger)floatIndex;
    JCBaseViewController * vc = self.vcArr[intIndex];
    return CGRectGetMinY(self.scrollView.frame)+[vc contentH];
}



- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.scrollEnabled = NO;
        _scrollView.delegate = self;
//        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

-(UISegmentedControl *)segControl {
    if (!_segControl) {
        _segControl = [UISegmentedControl new];
        [_segControl addTarget:self action:@selector(segSelected:) forControlEvents:UIControlEventValueChanged];
    }
    return _segControl;
}
- (JNMatchZS_JCViewController *)jcVC {
    if (!_jcVC) {
        _jcVC = [JNMatchZS_JCViewController new];
    }
    return _jcVC;
}
- (JNMatchZS_BDViewController *)bdVC {
    if (!_bdVC) {
        _bdVC = [JNMatchZS_BDViewController new];
    }
    return _bdVC;
}
- (JNMatchZS_OPViewController *)opVC {
    if (!_opVC) {
        _opVC = [JNMatchZS_OPViewController new];
    }
    return _opVC;
}
- (JNMatchZS_YPViewController *)ypVC {
    if (!_ypVC) {
        _ypVC = [JNMatchZS_YPViewController new];
    }
    return _ypVC;
}

- (JNMatchZS_JQSViewController *)jqsVC {
    if (!_jqsVC) {
        _jqsVC = [JNMatchZS_JQSViewController new];
    }
    return _jqsVC;
}
@end

