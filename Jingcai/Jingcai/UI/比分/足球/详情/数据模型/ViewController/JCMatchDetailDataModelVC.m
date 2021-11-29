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
#import "JCHistoryPayDataModelDetailVC.h"
#import "JCPoissonDataModelDetailVC.h"
#import "JCKellyDataModelDetailVC.h"
#import "JCTransactionDataModelMatchVC.h"
#import "JCDataModelTitleModel.h"
@interface JCMatchDetailDataModelVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@property (strong, nonatomic) JNDIYemptyView *emptyView;

@property (strong, nonatomic) NSMutableArray *vcArr;

@property (strong, nonatomic) NSMutableArray *titleArray;

@property (strong, nonatomic) NSArray *titleModelArray;

@property (assign, nonatomic) NSInteger is_have_ai_big_tab;

@property (assign, nonatomic) float total_width;

@end

@implementation JCMatchDetailDataModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self loadDataWithMatchBall:self.matchBall];
    

    
}

- (void)initView {
    self.segControl.hidden = YES;
    self.scrollView.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = COLOR_F0F0F0;
    [self initViews];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NotificationUserLogin object:nil];
    


}

- (void)refreshData {
    [self.vcArr removeAllObjects];
    [self.titleArray removeAllObjects];
    [self.scrollView removeAllSubviews];
//    for (UIView *view in self.view.subviews) {
//        if (view==self.scrollView) {
//            break;
//        }
//        [view removeFromSuperview];;
//    }
    [self loadDataWithMatchBall:self.matchBall];
}

- (void)initViews {
    JNDIYemptyView *emptyView = [JNDIYemptyView diyNoDataEmptyViewWithBlock:^{
//            [weakSelf refreshData];
        }];
    emptyView.imageStr = @"jc_dataModel_empty";
    emptyView.titleStr = @"当前暂无数据模型~";
    emptyView.contentViewOffset = AUTO(-150);
    emptyView.hidden = YES;
    [self.view addSubview:emptyView];
    self.emptyView = emptyView;
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


#pragma mark - 📌 LOADING
- (void)loadDataWithMatchBall:(JCMatchBall *)matchBall {
    if (!matchBall) {
        return;
    }
    
//    matchBall.id = @"3647153";
    JCMatchService_New * service = [JCMatchService_New service];
    [service getMatchDataModelItemWithMatch_id:matchBall.id success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_have_ai_big_tab = object[@"data"][@"is_have_ai_big"];
            NSString *free_day = [NSString stringWithFormat:@"%@",object[@"data"][@"free_day"]];
            self.is_have_ai_big_tab = [is_have_ai_big_tab integerValue];
            NSArray *array = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCDataModelTitleModel class]];
            self.titleModelArray = [NSArray arrayWithArray:array];
            self.emptyView.hidden = array.count>0?YES:NO;
            self.titleArray = [NSMutableArray array];
            self.vcArr = [NSMutableArray array];
            [array enumerateObjectsUsingBlock:^(JCDataModelTitleModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.free_day = NonNil(free_day);
                
                [self.titleArray addObject:obj.title];
//                id;//1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5机构分歧 6.指数分歧
                if ([obj.id integerValue]==1) {
                    JNMatchSJAgainstDataVC *vc = [JNMatchSJAgainstDataVC new];
                    vc.matchBall = matchBall;
                    vc.titleModel = obj;
                    [self.vcArr addObject:vc];
                }
                if ([obj.id integerValue]==2) {
                    JCTransactionDataModelMatchVC *vc = [JCTransactionDataModelMatchVC new];
                    vc.hidetopMatch = YES;
                    vc.match_id = matchBall.id;
                    vc.titleModel = obj;
                    [self.vcArr addObject:vc];
                }
                if ([obj.id integerValue]==3) {
                    JCHistoryPayDataModelDetailVC *vc = [JCHistoryPayDataModelDetailVC new];
                    vc.hidetopMatch = YES;
                    vc.isMatch = YES;
                    vc.titleModel = obj;
                    vc.match_id = matchBall.id;
                    [self.vcArr addObject:vc];
                }
                if ([obj.id integerValue]==4) {
                    JCPoissonDataModelDetailVC *vc =[JCPoissonDataModelDetailVC new];
                    vc.hidetopMatch = YES;
                    vc.isMatch = YES;
                    vc.titleModel = obj;
                    vc.match_id = matchBall.id;
                    [self.vcArr addObject:vc];
                }
                if ([obj.id integerValue]==5) {
                    JCKellyDataModelDetailVC *vc = [JCKellyDataModelDetailVC new];
                    vc.hidetopMatch = YES;
                    vc.isMatch = YES;
                    vc.titleModel = obj;
                    vc.match_id = self.matchBall.id;
                    [self.vcArr addObject:vc];
                }
                if ([obj.id integerValue]==6) {
                    JCDiscreteDataModelDetailVC *vc =[JCDiscreteDataModelDetailVC new];
                    vc.match_id = matchBall.id;
                    vc.hidetopMatch = YES;
                    vc.isMatch = YES;
                    vc.titleModel = obj;
                    [self.vcArr addObject:vc];
                }
            }];
//            if ([is_have_ai_big_tab integerValue]==1) {
//                [self.titleArray insertObject:@"鲸猜大数据" atIndex:0];
//                JNMatchSJAgainstDataVC *vc = [JNMatchSJAgainstDataVC new];
//                JCDataModelTitleModel *obj = [JCDataModelTitleModel new];
//                vc.titleModel = obj;
//                vc.matchBall = self.matchBall;
//                [self.vcArr insertObject:vc atIndex:0];
//            }
            

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
    float width = AUTO(100);
    self.total_width = 0;
    NSMutableArray *itemWidthArray = [NSMutableArray array];
    [self.titleArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [itemWidthArray addObject:@(width)];
        self.total_width =self.total_width+width;
    }];
    
    float start = (SCREEN_WIDTH-self.total_width)/2.0f;
    CGRect frame = CGRectMake(start, 10, self.total_width, 30);
    if (self.titleArray.count>=4) {
        frame = CGRectMake(20, 10, SCREEN_WIDTH-40, 30);

    }
    
    if (self.tabSegment) {
        [self.tabSegment removeFromSuperview];
    }
    self.tabSegment = [[LMJTab alloc] initWithFrame:frame lineWidth:1 lineColor:COLOR_F0F0F0];

    [self.tabSegment setItemsWithTitle:self.titleArray normalItemColor:JCWhiteColor selectItemColor:JCBaseColor normalTitleColor:COLOR_2F2F2F selectTitleColor:[UIColor whiteColor] titleTextSize:12 selectItemNumber:0 itemWidth:[NSMutableArray arrayWithArray:itemWidthArray]];
    self.tabSegment.layer.cornerRadius = 5.0;
    self.tabSegment.delegate = self;

    [self.view addSubview:self.tabSegment];
    
    if (self.model_id.length>0) {
        for (int i=0; i<self.titleModelArray.count; i++) {
            JCDataModelTitleModel *model = self.titleModelArray[i];
            if ([model.id integerValue]==[self.model_id integerValue]) {
                self.tabSegment.selectIndex = i;
                [self tab:self.tabSegment didSelectedItemNumber:i];
                break;
            }
        }
    }

}

-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
    CGFloat pageW = self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(pageW*number, 0) animated:YES];
}

@end
