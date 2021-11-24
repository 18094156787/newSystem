//
//  JNMatchDetailSJVC.m
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchDetailSJVC.h"
#import "JNMatchSJViewController.h"
#import "JCWJsonTool.h"
#import "JNMatchZJBall.h"
#import "JNMatchInjuryBall.h"
#import "JNMatchTableBall.h"
#import "RNNoData.h"
#import "JNMatchSJAgainstDataVC.h"
#import "UISegmentedControl+Extension.h"
@interface JNMatchDetailSJVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (strong, nonatomic) JNMatchSJViewController *homeVC;
@property (strong, nonatomic) JNMatchSJViewController *awayVC;
@property (strong, nonatomic) JNMatchSJAgainstDataVC *againstVC;
@property (strong, nonatomic) NSArray *vcArr;
@end

@implementation JNMatchDetailSJVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.segControl.hidden = YES;
    self.scrollView.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_F0F0F0;

//    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} forState:UIControlStateNormal];
//    [self.segControl setTitleTextAttributes:@{NSForegroundColorAttributeName:JCWhiteColor} forState:UIControlStateSelected];
//    [self.segControl setTintColor:JCBaseColor normalColor:COLOR_2F2F2F];
//    [self defaultData];
    [self loadDataWithMatchBall:self.matchBall];
    

    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat scrollW = self.scrollView.bounds.size.width;
    CGFloat scrollH = self.scrollView.bounds.size.height;



    if (self.matchBall.is_have_ai_big_tab==1) {
        self.scrollView.contentSize = CGSizeMake(scrollW*3, scrollH);
        self.againstVC.view.frame = CGRectMake(0, 0, scrollW, scrollH);
        self.homeVC.view.frame = CGRectMake(scrollW, 0, scrollW, scrollH);
        self.awayVC.view.frame = CGRectMake(scrollW*2, 0, scrollW, scrollH);

    }else{
         self.scrollView.contentSize = CGSizeMake(scrollW*2, scrollH);
        self.homeVC.view.frame = CGRectMake(0, 0, scrollW, scrollH);
        self.awayVC.view.frame = CGRectMake(scrollW, 0, scrollW, scrollH);
    }
    
    
}
- (JNMatchSJViewController *)homeVC {
    if (!_homeVC) {
        _homeVC = [JNMatchSJViewController new];
        _homeVC.type = @"1";
    }
    return _homeVC;
}
- (JNMatchSJViewController *)awayVC {
    if (!_awayVC) {
        _awayVC = [JNMatchSJViewController new];
        _awayVC.type = @"2";
    }
    return _awayVC;
}
- (JNMatchSJAgainstDataVC *)againstVC {
    if (!_againstVC) {
        _againstVC = [JNMatchSJAgainstDataVC new];
        _againstVC.matchBall = self.matchBall;
    }
    return _againstVC;
}

- (IBAction)segChanged:(UISegmentedControl *)sender {
    CGFloat scrollW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(scrollW*sender.selectedSegmentIndex, 0) animated:YES];
    //更新父视图高度
//    if (self.needReturnHeightBlock) {
//        self.needReturnHeightBlock([self contentH]);
//    }
}
- (CGFloat)contentH {
    JCBaseViewController * vc = self.vcArr[self.segControl.selectedSegmentIndex];
    return CGRectGetMinY(self.scrollView.frame)+[vc contentH];
}

//- (void)setMatchBall:(JCWMatchBall *)matchBall {
//    if (!matchBall) {
//        return;
//    }
//    _matchBall = matchBall;
//    [self loadDataWithMatchBall:matchBall];
//
//}

#pragma mark - 📌 LOADING
- (void)loadDataWithMatchBall:(JCMatchBall *)matchBall {
    if (!matchBall) {
        return;
    }   
    
//    JCMatchService_New * service = [JCMatchService_New service];//self.matchBall.id
////    self.matchBall.id = @"3513886";
//    [service getMatchHaveBigDataWithMatchnum:self.matchBall.id success:^(id  _Nullable object) {
//        
////        [self.scrollView addSubview:self.homeVC.view];
////        [self.scrollView addSubview:self.awayVC.view];
////        self.vcArr = @[self.homeVC,self.awayVC];
//        
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            NSString *is_have_ai_big_tab = object[@"data"];
//            self.matchBall.is_have_ai_big_tab = [is_have_ai_big_tab intValue];
//        }else{
//            [JCWToastTool showHint:object[@"msg"]];
//        }
//        [self defaultData];
//
//    } failure:^(NSError * _Nonnull error) {
//        [self defaultData];
//        
//    }];
    [self defaultData];

    

    
    

}

- (void)defaultData {
    [self.scrollView addSubview:self.homeVC.view];
    [self.scrollView addSubview:self.awayVC.view];

    
    NSMutableArray *titleArray = [NSMutableArray array];
    if (self.matchBall.is_have_ai_big_tab==1) {
        [titleArray addObject:@"鲸猜大数据"];
    }
    [titleArray addObject:NonNil(self.matchBall.home_team.name_zh)];
    [titleArray addObject:NonNil(self.matchBall.away_team.name_zh)];
    float start = (SCREEN_WIDTH-300)/2.0f;
    self.tabSegment = [[LMJTab alloc] initWithFrame:CGRectMake(start, 10, 300, 30) lineWidth:1 lineColor:COLOR_F0F0F0];
//        self.tabSegment.hidden = YES;
    [self.tabSegment setItemsWithTitle:titleArray normalItemColor:JCWhiteColor selectItemColor:JCBaseColor normalTitleColor:COLOR_2F2F2F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0];
    self.tabSegment.layer.cornerRadius = 5.0;
    self.tabSegment.delegate = self;
//    self.tabSegment.centerX = self.view.centerX;
    [self.view addSubview:self.tabSegment];
    
    if (self.matchBall.is_have_ai_big_tab==1) {
        [self.scrollView addSubview:self.againstVC.view];
        self.vcArr = @[self.againstVC,self.homeVC,self.awayVC];
    }else{

        self.vcArr = @[self.homeVC,self.awayVC];
    }
    self.homeVC.matchBall = self.matchBall;
    self.awayVC.matchBall = self.matchBall;
    self.segControl.selectedSegmentIndex = 0;
}

-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    CGFloat pageW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(pageW*number, 0) animated:YES];
}

- (UIImage *)imageWithColor: (UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
