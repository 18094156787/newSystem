//
//  JCBasketBallMatchTongJiC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchTongJiC.h"
#import "JCBasketBallMatchTongJiTeamVC.h"
#import "JCBasketBallMatchTongJiDataVC.h"
#import "JCBasketBallMatchTongJiTeamModel.h"
#import "JCBasketBallMatchTongJiDataModel.h"
#import "JCBasketBallMatchTongJiUserModel.h"
@interface JCBasketBallMatchTongJiC ()<LMJTabDelegate>

@property (nonatomic,strong) JCBasketBallMatchTongJiTeamVC *homeVC;

@property (nonatomic,strong) JCBasketBallMatchTongJiTeamVC *awayVC;

@property (nonatomic,strong) JCBasketBallMatchTongJiDataVC *dataVC;

@property (nonatomic,strong) UIScrollView * scrollView;

@end

@implementation JCBasketBallMatchTongJiC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubViews];
    [self refreshData];
}


- (void)refreshData {
    [self.jcWindow showLoading];
    JCBasketBallMatchService_New *service = [JCBasketBallMatchService_New new];//3574634
    [service getBasketBalltMatchtDetailTongjiWithMatch_id:self.matchBall.id success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {

//            NSArray *homeArray = [JCWJsonTool arrayWithJson:object[@"data"][@"home"] class:[JCBasketBallMatchTongJiTeamModel class]];
//            NSArray *awayArray = [JCWJsonTool arrayWithJson:object[@"data"][@"away"] class:[JCBasketBallMatchTongJiTeamModel class]];

            
            NSArray *home_sfArray = [JCWJsonTool arrayWithJson:object[@"data"][@"players"][@"players_home_info"][@"shou_player_info"] class:[JCBasketBallMatchTongJiUserModel class]];
            [home_sfArray enumerateObjectsUsingBlock:^(JCBasketBallMatchTongJiUserModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.play_info.rank = [obj.play_info.df integerValue]*10000+[obj.play_info.zccxsj integerValue]*100+[obj.player_qyh integerValue];
                
            }];
            home_sfArray =   [home_sfArray sortedArrayUsingComparator:^NSComparisonResult(JCBasketBallMatchTongJiUserModel *obj1, JCBasketBallMatchTongJiUserModel *obj2) {
                //降序，key表示比较的关键字
                if (obj1.play_info.rank<obj2.play_info.rank) {
                    return NSOrderedDescending;
                }else {
                    return NSOrderedAscending;
                }
            }];
            NSArray *home_tbArray = [JCWJsonTool arrayWithJson:object[@"data"][@"players"][@"players_home_info"][@"ti_player_info"] class:[JCBasketBallMatchTongJiUserModel class]];
            [home_tbArray enumerateObjectsUsingBlock:^(JCBasketBallMatchTongJiUserModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.play_info.rank = [obj.play_info.df integerValue]*10000+[obj.play_info.zccxsj integerValue]*100+[obj.player_qyh integerValue];
                
            }];
            home_tbArray =   [home_tbArray sortedArrayUsingComparator:^NSComparisonResult(JCBasketBallMatchTongJiUserModel *obj1, JCBasketBallMatchTongJiUserModel *obj2) {
                //降序，key表示比较的关键字
                if (obj1.play_info.rank<obj2.play_info.rank) {
                    return NSOrderedDescending;
                }else {
                    return NSOrderedAscending;
                }
            }];

            NSMutableArray *homeArray = [NSMutableArray array];
            [homeArray addObjectsFromArray:home_sfArray];
            [homeArray addObjectsFromArray:home_tbArray];
            //总计
            JCBasketBallMatchTongJiUserModel *total_home_Model = [JCBasketBallMatchTongJiUserModel new];
            total_home_Model.player_zw = @"总计";
            JCBasketBallMatchTongJiTeamModel *home_info = (JCBasketBallMatchTongJiTeamModel *)[JCWJsonTool entityWithJson:object[@"data"][@"players"][@"players_home_score_detail"] class:[JCBasketBallMatchTongJiTeamModel class]];
            home_info.zccxsj = @"-";
            home_info.z = @"-";
            total_home_Model.play_info = home_info;
            if (homeArray.count>0) {
                [homeArray addObject:total_home_Model];
            }
            
            if (home_sfArray.count>0) {
                self.awayVC.emptyIndex = home_sfArray.count;
            }
            self.awayVC.dataArray = [NSArray arrayWithArray:homeArray];
            
            NSArray *away_sfArray = [JCWJsonTool arrayWithJson:object[@"data"][@"players"][@"players_away_info"][@"shou_player_info"] class:[JCBasketBallMatchTongJiUserModel class]];
//            NSMutableArray *away_sf_sort_Array = [NSMutableArray array];
            //数据排序 ,规则:得分*10000+时间*100+球衣号
            [away_sfArray enumerateObjectsUsingBlock:^(JCBasketBallMatchTongJiUserModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.play_info.rank = [obj.play_info.df integerValue]*10000+[obj.play_info.zccxsj integerValue]*100+[obj.player_qyh integerValue];
                
            }];
            away_sfArray =   [away_sfArray sortedArrayUsingComparator:^NSComparisonResult(JCBasketBallMatchTongJiUserModel *obj1, JCBasketBallMatchTongJiUserModel *obj2) {
                //降序，key表示比较的关键字
                if (obj1.play_info.rank<obj2.play_info.rank) {
                    return NSOrderedDescending;
                }else {
                    return NSOrderedAscending;
                }
            }];
            NSArray *away_tbArray = [JCWJsonTool arrayWithJson:object[@"data"][@"players"][@"players_away_info"][@"ti_player_info"] class:[JCBasketBallMatchTongJiUserModel class]];
            [away_tbArray enumerateObjectsUsingBlock:^(JCBasketBallMatchTongJiUserModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.play_info.rank = [obj.play_info.df integerValue]*10000+[obj.play_info.zccxsj integerValue]*100+[obj.player_qyh integerValue];
                
            }];
            away_tbArray =   [away_tbArray sortedArrayUsingComparator:^NSComparisonResult(JCBasketBallMatchTongJiUserModel *obj1, JCBasketBallMatchTongJiUserModel *obj2) {
                //降序，key表示比较的关键字
                if (obj1.play_info.rank<obj2.play_info.rank) {
                    return NSOrderedDescending;
                }else {
                    return NSOrderedAscending;
                }
            }];
            NSMutableArray *awayArray = [NSMutableArray array];
            [awayArray addObjectsFromArray:away_sfArray];
            [awayArray addObjectsFromArray:away_tbArray];
            //总计
            JCBasketBallMatchTongJiUserModel *total_away_Model = [JCBasketBallMatchTongJiUserModel new];
            total_away_Model.player_zw = @"总计";
            JCBasketBallMatchTongJiTeamModel *away_info =(JCBasketBallMatchTongJiTeamModel *)[JCWJsonTool entityWithJson:object[@"data"][@"players"][@"players_away_score_detail"] class:[JCBasketBallMatchTongJiTeamModel class]];
            away_info.zccxsj = @"-";
            away_info.z = @"-";
            total_away_Model.play_info = away_info;
            if (awayArray.count>0) {
                [awayArray addObject:total_away_Model];
            }
           
            if (away_sfArray.count>0) {
                self.homeVC.emptyIndex = away_sfArray.count;
            }

            
            
            
            self.homeVC.dataArray = [NSArray arrayWithArray:awayArray];
            
            
            NSArray *dataArray = [JCWJsonTool arrayWithJson:object[@"data"][@"players"][@"players_all_score_detail"] class:[JCBasketBallMatchTongJiDataModel class]];

            self.dataVC.dataSource = dataArray;



        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];

}


- (void)initSubViews {
    self.view.backgroundColor = COLOR_F0F0F0;

    
    self.scrollView.frame = CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT-50-kNavigationBarHeight-44-kBottomTabSafeAreaHeight);
    [self.view addSubview:self.scrollView];

    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3,   self.scrollView.height);
    

    [self.scrollView addSubview:self.homeVC.view];
    [self.scrollView addSubview:self.awayVC.view];
    [self.scrollView addSubview:self.dataVC.view];
    
    self.homeVC.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.scrollView.height);
    self.awayVC.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH,  self.scrollView.height);
    self.dataVC.view.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH,  self.scrollView.height);
    
}

- (void)setMatchBall:(JCBasketBallMatchBall *)matchBall {
    _matchBall = matchBall;
    NSMutableArray *titleArray = [NSMutableArray array];
    [titleArray addObject:NonNil(matchBall.away_team_name)];
    [titleArray addObject:NonNil(matchBall.home_team_name)];
    [titleArray addObject:NonNil(@"球队数据")];
//    float start = SCREEN_WIDTH/2.0f-AUTO(77)*titleArray.count/2.0f;
    self.tabSegment = [[LMJTab alloc] initWithFrame:CGRectMake(0, 10, 100*3, 30) lineWidth:1 lineColor:COLOR_F0F0F0];
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

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}

-(JCBasketBallMatchTongJiTeamVC *)homeVC {
    if (!_homeVC) {
        _homeVC = [JCBasketBallMatchTongJiTeamVC new];
    }
    return _homeVC;
}

-(JCBasketBallMatchTongJiTeamVC *)awayVC {
    if (!_awayVC) {
        _awayVC = [JCBasketBallMatchTongJiTeamVC new];
    }
    return _awayVC;
}

- (JCBasketBallMatchTongJiDataVC *)dataVC {
    if (!_dataVC) {
        _dataVC = [JCBasketBallMatchTongJiDataVC new];
        _dataVC.matchBall = self.matchBall;
    }
    return _dataVC;
}

@end
