//
//  JNMatchDetailQBVC.m
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchDetailQBVC.h"
#import "JCWJsonTool.h"
#import "JNMatchQingbaoBall.h"
#import "JNSegmentedControl.h"
#import "JCMatchQBViewController.h"
#import "UISegmentedControl+Extension.h"
@interface JNMatchDetailQBVC ()
@property (nonatomic, strong) JCMatchQBViewController * homeVC;
@property (nonatomic, strong) JCMatchQBViewController * awayVC;
@property (weak, nonatomic) IBOutlet JNSegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIScrollView * scrollView;
@end

@implementation JNMatchDetailQBVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.segment.hidden = YES;
    self.scrollView.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_F0F0F0;
    [self.segment setTitleTextAttributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F} forState:UIControlStateNormal];
    [self.segment setTitleTextAttributes:@{NSForegroundColorAttributeName:JCWhiteColor} forState:UIControlStateSelected];
    [self.segment setTintColor:JCBaseColor normalColor:COLOR_2F2F2F];

    self.segment.backgroundColor = JCWhiteColor;
    [self.scrollView addSubview:self.homeVC.view];
    [self.scrollView addSubview:self.awayVC.view];
    WeakSelf;
    self.homeVC.needReturnHeightBlock = ^(CGFloat contentH) {
        if (weakSelf.needReturnHeightBlock) {
            weakSelf.needReturnHeightBlock([weakSelf contentH]);
        }
    };
    self.awayVC.needReturnHeightBlock = ^(CGFloat contentH) {
        if (weakSelf.needReturnHeightBlock) {
            weakSelf.needReturnHeightBlock([weakSelf contentH]);
        }
    };
    [self loadDataWithMatchBall:self.matchBall];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat scrollW = self.scrollView.bounds.size.width;
    CGFloat scrollH = self.scrollView.bounds.size.height;
    self.scrollView.contentSize = CGSizeMake(scrollW*2, scrollH);
    self.homeVC.view.frame = CGRectMake(0, 10, scrollW, scrollH);
    self.awayVC.view.frame = CGRectMake(scrollW, 10, scrollW, scrollH);
}
- (JCMatchQBViewController *)homeVC {
    if (!_homeVC) {
        _homeVC = [JCMatchQBViewController new];
    }
    return _homeVC;
}
- (JCMatchQBViewController *)awayVC {
    if (!_awayVC) {
        _awayVC = [JCMatchQBViewController new];
    }
    return _awayVC;
}

//- (void)setMatchBall:(JCWMatchBall *)matchBall {
//    if (!matchBall) {
//        return;
//    }
//    _matchBall = matchBall;
//    [self loadDataWithMatchBall:matchBall];
//
//}

- (void)loadDataWithMatchBall:(JCMatchBall *)matchBall {
    if (!matchBall) {
        return;
    }
    NSMutableArray *titleArray = [NSMutableArray array];
    [titleArray addObject:NonNil(matchBall.home_team.name_zh)];
    [titleArray addObject:NonNil(matchBall.away_team.name_zh)];
//    float start = SCREEN_WIDTH/2.0f-AUTO(77)*titleArray.count/2.0f;
    self.tabSegment = [[LMJTab alloc] initWithFrame:CGRectMake(0, 10, 240, 30) lineWidth:1 lineColor:[UIColor whiteColor]];
//        self.tabSegment.hidden = YES;
    [self.tabSegment setItemsWithTitle:titleArray normalItemColor:JCWhiteColor selectItemColor:JCBaseColor normalTitleColor:COLOR_2F2F2F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0];
    self.tabSegment.layer.cornerRadius = 5.0;
    self.tabSegment.delegate = self;
    self.tabSegment.centerX = self.view.centerX;
    
    [self.view addSubview:self.tabSegment];
    [self.segment setTitle:NonNil(matchBall.home_team.name_zh) forSegmentAtIndex:0];
    [self.segment setTitle:NonNil(matchBall.away_team.name_zh) forSegmentAtIndex:1];
    WeakSelf;
    [self.jcWindow showLoading];
    JCMatchService_New * service = [JCMatchService_New service];
    [service getMatchQingBaoWithMatchnum:matchBall.id success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *homeGoodArray = [JCWJsonTool arrayWithJson:object[@"data"][@"good_home"] class:[JNMatchQingbaoBall class]];
            NSArray *homeBadArray = [JCWJsonTool arrayWithJson:object[@"data"][@"bad_home"] class:[JNMatchQingbaoBall class]];
            NSArray *awayGoodArray = [JCWJsonTool arrayWithJson:object[@"data"][@"good_away"] class:[JNMatchQingbaoBall class]];
            NSArray *awayBadArray = [JCWJsonTool arrayWithJson:object[@"data"][@"bad_away"] class:[JNMatchQingbaoBall class]];
            NSArray *natureBadArray = [JCWJsonTool arrayWithJson:object[@"data"][@"neutral_home"] class:[JNMatchQingbaoBall class]];
            self.homeVC.goodInfoArray = homeGoodArray;
            self.homeVC.badInfoArray = homeBadArray;
            self.homeVC.natureInfoArray = natureBadArray;
            
            self.awayVC.goodInfoArray = awayGoodArray;
            self.awayVC.badInfoArray = awayBadArray;
            self.awayVC.natureInfoArray = natureBadArray;

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];


}
-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    CGFloat pageW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(pageW*number, 0) animated:YES];
}

- (IBAction)segChanged:(UISegmentedControl *)sender {
    CGFloat pageW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(pageW*sender.selectedSegmentIndex, 0) animated:YES];
}
- (CGFloat)contentH {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat pageW = self.scrollView.bounds.size.width;
    NSInteger index = (NSInteger)(offsetX/pageW);
    if (index == 0) {
        return [self.homeVC contentH] + CGRectGetMinY(self.scrollView.frame);
    }
    if (index == 1) {
        return [self.awayVC contentH] + CGRectGetMinY(self.scrollView.frame);
    }
    return 0;
}
- (UIImage *)imageWithColor: (UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 50, 20);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
