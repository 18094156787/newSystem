//
//  JNMatchDetailZRVC.m
//  Jingcai
//
//  Created by Administrator on 2019/6/13.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchDetailZRVC.h"
#import "JCWJsonTool.h"
#import "JNMatchLineupBall.h"
#import "JNMatchDrawCell.h"
#import "JNMatchBattleCell.h"
#import "RNNoData.h"
#import "JCDataBaseTitleHeadView.h"
#import "JCWMatchBall.h"
#import "JNMatchDetailZRCell.h"
#import "JCDiXianFootView.h"
@interface JNMatchDetailZRVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView * tableView;
@property (nonatomic, assign) CGFloat tableH;
@property (nonatomic, strong) NSMutableArray * sfHomeArr;
@property (nonatomic, strong) NSMutableArray * sfAwayArr;
@property (nonatomic, strong) NSMutableArray * tbHomeArr;
@property (nonatomic, strong) NSMutableArray * tbAwayArr;
@property (nonatomic, strong) JCDiXianFootView *footView;


@end

@implementation JNMatchDetailZRVC
- (void)viewDidLoad {
  
    [super viewDidLoad];
    self.tableView.scrollEnabled = YES;
    [self.tableView registerNib:[UINib nibWithNibName:@"JNMatchDrawCell" bundle:nil] forCellReuseIdentifier:@"JNMatchDrawCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JNMatchBattleCell" bundle:nil] forCellReuseIdentifier:@"JNMatchBattleCell"];
    [self.tableView registerClass:[JNMatchDetailZRCell class] forCellReuseIdentifier:@"JNMatchDetailZRCell"];
    [self loadDataWithMatchBall:self.matchBall];;
}

#pragma mark - 📌 OVERRIDE
- (CGFloat)contentH {
    return self.tableH;
}

#pragma mark - 📌 UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 &&( self.sfHomeArr.count == 0 || self.sfAwayArr.count == 0)) {
        return 0;
    }
    if (indexPath.section == 1) {
        if (self.sfHomeArr.count == 0 && self.sfAwayArr.count == 0) {
            return 0;
        }
        if (self.sfHomeArr.count>self.sfAwayArr.count) {
            return self.sfHomeArr.count*AUTO(40)+AUTO(50);
        }
        return self.sfAwayArr.count*AUTO(40)+AUTO(50);
    }
    if (indexPath.section == 2) {
        if (self.tbHomeArr.count == 0 && self.tbAwayArr.count == 0) {
            return 0;
        }
        if (self.tbHomeArr.count>self.tbAwayArr.count) {
            return self.tbHomeArr.count*AUTO(40)+AUTO(50);
        }
        return self.tbAwayArr.count*AUTO(40)+AUTO(50);
    }
    
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        JNMatchDrawCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchDrawCell"];
        cell.homeArr = self.sfHomeArr;
        cell.awayArr = self.sfAwayArr;
        return cell;
    }
    JNMatchDetailZRCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JNMatchDetailZRCell"];
    cell.homeArr = indexPath.section == 1 ? self.sfHomeArr : self.tbHomeArr;
    cell.awayArr = indexPath.section == 1 ? self.sfAwayArr : self.tbAwayArr;
    cell.matchBall = self.matchBall;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return (self.sfHomeArr.count == 0 && self.sfAwayArr.count == 0) ? 0 : 44;
    }
    if (section == 2) {
        return (self.tbHomeArr.count == 0 && self.tbAwayArr.count == 0) ? 0 : 44;
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [UIView new];
    }

    JCDataBaseTitleHeadView *headView = [JCDataBaseTitleHeadView new];
    headView.backgroundColor = JCWhiteColor;
    headView.titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    headView.titleLab.text = section == 1 ? @"首发阵容" : @"替补阵容";
    return headView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView = [UIView new];
    footView.backgroundColor = COLOR_F0F0F0;
    return footView;;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
        if (section==1&&self.sfHomeArr.count > 0 && self.sfAwayArr.count > 0) {
        return AUTO(8);
    }
    return 0.01f;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if([indexPath row] == ((NSIndexPath *)[[tableView indexPathsForVisibleRows] lastObject]).row) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tableH = self.tableView.contentSize.height;
            if (self.needReturnHeightBlock) {
                self.needReturnHeightBlock([self contentH]);
            }
        });
    }
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
    [self.tableView showTopNoData];
    self.matchBall = matchBall;
    WeakSelf;
    [self.jcWindow showLoading];//3373011
    JCMatchService_New * service = [JCMatchService_New service];//
    [service getMatchZhenrongWithMatchnum:matchBall.id success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if ([object[@"data"][@"lineup"] isKindOfClass:[NSDictionary class]]) {
                NSArray *homeArray = [JCWJsonTool arrayWithJson:object[@"data"][@"lineup"][@"home"] class:[JNMatchLineupBall class]];
                NSArray *awayArray = [JCWJsonTool arrayWithJson:object[@"data"][@"lineup"][@"away"] class:[JNMatchLineupBall class]];
                
                self.sfHomeArr = [NSMutableArray array];
                self.tbHomeArr = [NSMutableArray array];
                [homeArray enumerateObjectsUsingBlock:^(JNMatchLineupBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj.first intValue]==1) {
                        [self.sfHomeArr addObject:obj];
                    }else{
                        [self.tbHomeArr addObject:obj];
                    }
                }];
                
                self.sfAwayArr = [NSMutableArray array];
                self.tbAwayArr = [NSMutableArray array];
                [awayArray enumerateObjectsUsingBlock:^(JNMatchLineupBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj.first intValue]==1) {
                        [self.sfAwayArr addObject:obj];
                    }else{
                        [self.tbAwayArr addObject:obj];
                    }
                }];
                
                [weakSelf.tableView reloadData];
            }
 
            
            
            if (weakSelf.sfHomeArr.count > 0 || weakSelf.sfAwayArr.count > 0 || weakSelf.tbHomeArr.count > 0 || weakSelf.tbAwayArr.count > 0) {
                self.footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(50));
                self.tableView.tableFooterView = self.footView;
                [weakSelf.tableView hideNoData];
            }
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];

}

- (JCDiXianFootView *)footView {
    if (!_footView) {
        _footView = [JCDiXianFootView new];
    }
    return _footView;
}
@end
