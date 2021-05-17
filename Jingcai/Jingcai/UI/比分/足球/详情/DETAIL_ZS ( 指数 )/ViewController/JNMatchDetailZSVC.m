//
//  JNMatchDetailZSVC.m
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchDetailZSVC.h"
#import "JCWJsonTool.h"
#import "JNMatchZS_JCViewController.h"
#import "JNMatchZS_BDViewController.h"
#import "JNMatchZS_OPViewController.h"
#import "JNMatchZS_YPViewController.h"
#import "JNMatchZS_JQSViewController.h"
#import "UISegmentedControl+Extension.h"

@interface JNMatchDetailZSVC () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView * scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl * segControl;
@property (strong, nonatomic) JNMatchZS_JCViewController * jcVC;
@property (strong, nonatomic) JNMatchZS_BDViewController * bdVC;
@property (strong, nonatomic) JNMatchZS_OPViewController * opVC;
@property (strong, nonatomic) JNMatchZS_YPViewController * ypVC;
@property (strong, nonatomic) JNMatchZS_JQSViewController * jqsVC;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *left;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *right;
@property (strong, nonatomic) NSArray * vcArr;
@end

@implementation JNMatchDetailZSVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_F0F0F0;
    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} forState:UIControlStateNormal];
    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:JCWhiteColor} forState:UIControlStateSelected];
    [self.segControl setTintColor:JCBaseColor normalColor:COLOR_2F2F2F];
    [self loadDataWithMatchNum:self.matchBall type:1];

}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

}
- (IBAction)segSelected:(UISegmentedControl *)segmentControl {
    CGFloat scrollW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(scrollW * segmentControl.selectedSegmentIndex, 0) animated:YES];
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

//- (void)setMatchBall:(JCWMatchBall *)matchBall {
//    if (!matchBall) {
//        return;
//    }
//    _matchBall = matchBall;
//    [self loadDataWithMatchNum:matchBall type:0];
//
//}


- (void)loadDataWithMatchNum:(JCWMatchBall *)matchBall type:(NSInteger)type {
    //让4个VC分别去加载
    
    [self.jcVC loadDataWithMatchNum:matchBall.matchNum type:type];
    [self.bdVC loadDataWithMatchNum:matchBall.matchNum type:type];
//    [self.opVC loadDataWithMatchNum:matchBall.matchNum type:type];
    self.opVC.matchNum = matchBall.matchNum;
    self.ypVC.matchNum = matchBall.matchNum;
    self.jqsVC.matchNum = matchBall.matchNum;
//    [self.ypVC loadDataWithMatchNum:matchBall.matchNum type:type];
//    [self.jqsVC loadDataWithMatchNum:matchBall.matchNum type:type];
    
    CGFloat scrollW = SCREEN_WIDTH;
    CGFloat scrollH = self.scrollView.bounds.size.height;
    float width = 0;
    if (SCREEN_WIDTH==375) {
        scrollW = SCREEN_WIDTH+44;
        width = 44;
    }
//    CGFloat scrollW = SCREEN_WIDTH;
//    CGFloat scrollH = SCREEN_HEIGHT;
    self.isJingCai = YES;
    self.isBeiDan = YES;
    [self.segControl removeAllSegments];
    if (matchBall.is_jc==1&&matchBall.is_bd==1) {
        self.segControl.frame = CGRectMake(0, 0, 200, 29);
        [self.segControl insertSegmentWithTitle:@"竞足" atIndex:0 animated:NO];
        [self.segControl insertSegmentWithTitle:@"北单" atIndex:1 animated:NO];
        [self.segControl insertSegmentWithTitle:@"欧指" atIndex:2 animated:NO];
        [self.segControl insertSegmentWithTitle:@"亚指" atIndex:3 animated:NO];
        [self.segControl insertSegmentWithTitle:@"进球数" atIndex:4 animated:NO];

        [self.scrollView addSubview:self.jcVC.view];
        [self.scrollView addSubview:self.bdVC.view];
        [self.scrollView addSubview:self.opVC.view];
        [self.scrollView addSubview:self.ypVC.view];
        [self.scrollView addSubview:self.jqsVC.view];
        self.vcArr = @[self.jcVC,self.bdVC,self.opVC,self.ypVC,self.jqsVC];
        self.scrollView.contentSize = CGSizeMake(scrollW*5, scrollH);
        self.jcVC.view.frame = CGRectMake(scrollW*0, 0, scrollW, scrollH);
        self.bdVC.view.frame = CGRectMake(scrollW*1-width, 0, scrollW, scrollH);
        self.opVC.view.frame = CGRectMake(scrollW*2-width*2, 0, scrollW, scrollH);
        self.ypVC.view.frame = CGRectMake(scrollW*3-width*3, 0, scrollW, scrollH);
        self.jqsVC.view.frame = CGRectMake(scrollW*4-width*4, 0, scrollW, scrollH);
    }else if(matchBall.is_jc==1){
        self.segControl.frame = CGRectMake(0, 0, 160, 29);
        [self.segControl insertSegmentWithTitle:@"竞足" atIndex:0 animated:NO];
        [self.segControl insertSegmentWithTitle:@"欧指" atIndex:1 animated:NO];
        [self.segControl insertSegmentWithTitle:@"亚指" atIndex:2 animated:NO];
        [self.segControl insertSegmentWithTitle:@"进球数" atIndex:3 animated:NO];
        [self.scrollView addSubview:self.jcVC.view];
        [self.scrollView addSubview:self.opVC.view];
        [self.scrollView addSubview:self.ypVC.view];
        [self.scrollView addSubview:self.jqsVC.view];
        self.vcArr = @[self.jcVC,self.opVC,self.ypVC,self.jqsVC];
        self.scrollView.contentSize = CGSizeMake(scrollW*4, scrollH);
        self.jcVC.view.frame = CGRectMake(scrollW*0, 0, scrollW, scrollH);
        self.opVC.view.frame = CGRectMake(scrollW*1-width, 0, scrollW, scrollH);
        self.ypVC.view.frame = CGRectMake(scrollW*2-width*2, 0, scrollW, scrollH);
        self.jqsVC.view.frame = CGRectMake(scrollW*3-width*3, 0, scrollW, scrollH);
    }else if(matchBall.is_bd==1){
        self.segControl.frame = CGRectMake(0, 0, 160, 29);
        [self.segControl insertSegmentWithTitle:@"北单" atIndex:0 animated:NO];
        [self.segControl insertSegmentWithTitle:@"欧指" atIndex:1 animated:NO];
        [self.segControl insertSegmentWithTitle:@"亚指" atIndex:2 animated:NO];
        [self.segControl insertSegmentWithTitle:@"进球数" atIndex:3 animated:NO];
        
        
        [self.scrollView addSubview:self.bdVC.view];
        [self.scrollView addSubview:self.opVC.view];
        [self.scrollView addSubview:self.ypVC.view];
        [self.scrollView addSubview:self.jqsVC.view];
        self.vcArr = @[self.jcVC,self.opVC,self.ypVC,self.jqsVC];
        self.scrollView.contentSize = CGSizeMake(scrollW*4, scrollH);
        self.bdVC.view.frame = CGRectMake(scrollW*0, 0, scrollW, scrollH);
        self.opVC.view.frame = CGRectMake(scrollW*1-width, 0, scrollW, scrollH);
        self.ypVC.view.frame = CGRectMake(scrollW*2-width*2, 0, scrollW, scrollH);
        self.jqsVC.view.frame = CGRectMake(scrollW*3-width*3, 0, scrollW, scrollH);
    }else {
        self.segControl.frame = CGRectMake(0, 0, 120, 29);
        [self.segControl insertSegmentWithTitle:@"欧指" atIndex:0 animated:NO];
        [self.segControl insertSegmentWithTitle:@"亚指" atIndex:1 animated:NO];
        [self.segControl insertSegmentWithTitle:@"进球数" atIndex:2 animated:NO];
        
        
//        [self.scrollView addSubview:self.jcVC.view];
        [self.scrollView addSubview:self.opVC.view];
        [self.scrollView addSubview:self.ypVC.view];
        [self.scrollView addSubview:self.jqsVC.view];
        self.vcArr = @[self.opVC,self.ypVC,self.jqsVC];
        self.scrollView.contentSize = CGSizeMake(scrollW*3, scrollH);
        self.opVC.view.frame = CGRectMake(scrollW*0, 0, scrollW, scrollH);
        self.ypVC.view.frame = CGRectMake(scrollW*1-width, 0, scrollW, scrollH);
        self.jqsVC.view.frame = CGRectMake(scrollW*2-width*2, 0, scrollW, scrollH);
    }
    self.segControl.selectedSegmentIndex = 0;
//    self.segControl.frame = CGRectMake(0, 0, 80, 29);
    self.left.constant = 44+(4-self.vcArr.count)*20;
    self.right.constant = 44+(4-self.vcArr.count)*20;
//    self.left.constant = 0;
//    self.right.constant = 0;
    
    WeakSelf;
//    for (JCBaseViewController * vc in self.vcArr) {
//        vc.needReturnHeightBlock = ^(CGFloat contentH) {
//            weakSelf.needReturnHeightBlock ? weakSelf.needReturnHeightBlock([weakSelf contentH]) : nil;
//        };
//    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat floatIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    NSInteger intIndex = (NSInteger)floatIndex;
    if (floatIndex - intIndex > 0) {
            return ;
    }
    if (self.needReturnHeightBlock) {
        self.needReturnHeightBlock([self contentH]);
    }
}

#pragma mark - Override
- (CGFloat)contentH {
    CGFloat floatIndex = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    NSInteger intIndex = (NSInteger)floatIndex;
    JCBaseViewController * vc = self.vcArr[intIndex];
    return CGRectGetMinY(self.scrollView.frame)+[vc contentH];
}
@end
