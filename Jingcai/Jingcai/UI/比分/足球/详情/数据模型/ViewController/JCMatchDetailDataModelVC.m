//
//  JNMatchDetailSJVC.m
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCMatchDetailDataModelVC.h"
#import "JNMatchSJViewController.h"
#import "JCWJsonTool.h"
#import "JNMatchZJBall.h"
#import "JNMatchInjuryBall.h"
#import "JNMatchTableBall.h"
#import "RNNoData.h"
#import "JNMatchSJAgainstDataVC.h"
#import "UISegmentedControl+Extension.h"
#import "JCDiscreteDataModelDetailVC.h"
#import "JCHistoryPayDataModelDetailStickVC.h"
#import "JCPoissonDataModelDetailVC.h"
#import "JCKellyDataModelDetailVC.h"
#import "JCTransactionDataModelMatchVC.h"
#import "JCDataModelTitleModel.h"
@interface JCMatchDetailDataModelVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@property (strong, nonatomic) NSMutableArray *vcArr;

@property (strong, nonatomic) NSMutableArray *titleArray;

@property (assign, nonatomic) NSInteger is_have_ai_big_tab;

@end

@implementation JCMatchDetailDataModelVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.segControl.hidden = YES;
    self.scrollView.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_F0F0F0;
    [self loadDataWithMatchBall:self.matchBall];
    

    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat scrollW = self.scrollView.bounds.size.width;
    CGFloat scrollH = self.scrollView.bounds.size.height;

    self.scrollView.contentSize = CGSizeMake(scrollW*self.vcArr.count, scrollH);
    [self.vcArr enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.view.frame = CGRectMake(scrollW*idx, 0, scrollW, scrollH);
    }];

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
    JCMatchService_New * service = [JCMatchService_New service];
    [service getMatchDataModelItemWithMatch_id:matchBall.id success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_have_ai_big_tab = object[@"data"][@"is_have_ai_big"];
            self.is_have_ai_big_tab = [is_have_ai_big_tab integerValue];
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCDataModelTitleModel class]];
            self.titleArray = [NSMutableArray array];
            self.vcArr = [NSMutableArray array];
            [array enumerateObjectsUsingBlock:^(JCDataModelTitleModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.titleArray addObject:obj.title];
//                id;//1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5凯利指数 6.离散指数
                if ([obj.id integerValue]==2) {
                    [self.vcArr addObject:[JCTransactionDataModelMatchVC new]];
                }
                if ([obj.id integerValue]==3) {
                    [self.vcArr addObject:[JCHistoryPayDataModelDetailStickVC new]];
                }
                if ([obj.id integerValue]==4) {
                    [self.vcArr addObject:[JCPoissonDataModelDetailVC new]];
                }
                if ([obj.id integerValue]==5) {
                    JCKellyDataModelDetailVC *vc = [JCKellyDataModelDetailVC new];
                    vc.hidetopMatch = YES;
                    vc.match_id = self.matchBall.id;
                    [self.vcArr addObject:vc];
                }
                if ([obj.id integerValue]==6) {
                    [self.vcArr addObject:[JCDiscreteDataModelDetailVC new]];
                }
            }];
            if ([is_have_ai_big_tab integerValue]==1) {
                [self.titleArray insertObject:@"鲸猜大数据" atIndex:0];
                JNMatchSJAgainstDataVC *vc = [JNMatchSJAgainstDataVC new];
                vc.matchBall = self.matchBall;
                [self.titleArray insertObject:vc atIndex:0];
            }
            
//            NSString *is_have_ai_big_tab = object[@"data"];
//            self.matchBall.is_have_ai_big_tab = [is_have_ai_big_tab intValue];
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }
        [self defaultData];

    } failure:^(NSError * _Nonnull error) {
        [self defaultData];
    }];


    

    
    

}

- (void)defaultData {
    if (self.titleArray.count==0) {
        return;
    }

    [self.vcArr enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.scrollView addSubview:obj.view];
    }];

    
    float width = (SCREEN_WIDTH-AUTO(70)-20)/5.0f;
    self.tabSegment = [[LMJTab alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 30) lineWidth:1 lineColor:COLOR_F0F0F0];
//    self.tabSegment.centerY = self.view.centerY;
//        self.tabSegment.hidden = YES;
//    [self.tabSegment setItemsWithTitle:titleArray normalItemColor:JCWhiteColor selectItemColor:JCBaseColor normalTitleColor:COLOR_2F2F2F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0];
    [self.tabSegment setItemsWithTitle:self.titleArray normalItemColor:JCWhiteColor selectItemColor:JCBaseColor normalTitleColor:COLOR_2F2F2F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0 itemWidth:@[@(AUTO(70)),@(width),@(width),@(width),@(width),@(width)]];
    self.tabSegment.layer.cornerRadius = 5.0;
    self.tabSegment.delegate = self;

    [self.view addSubview:self.tabSegment];
    float start = 0;
    if (self.titleArray.count<7) {
         start = (SCREEN_WIDTH-self.titleArray.count*width-20)/2.0f;
        if (self.is_have_ai_big_tab==1) {
            start = (SCREEN_WIDTH-(self.titleArray.count-1)*width-AUTO(70)-20)/2.0f;
        }
    }
    self.tabSegment.frame = CGRectMake(start, 10, SCREEN_WIDTH-20, 30);

//    self.segControl.selectedSegmentIndex = 0;
}

-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    CGFloat pageW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(pageW*number, 0) animated:YES];
}

@end
